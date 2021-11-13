package org.kostagram.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class PostDAO {
	private static PostDAO instance = new PostDAO();
	private DataSource dataSource;

	private PostDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static PostDAO getInstance() {
		return instance;
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public ArrayList<PostVO> mainPostList() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostVO vo = null;
		MemberVO mvo = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		try {
			con = dataSource.getConnection();
			String postSql = "select p.post_id,p.img,p.org_img,p.post_content,p.post_date,m.member_id,m.org_profile_img from post p,member m where p.member_id=m.member_id order by p.post_id desc";
			pstmt = con.prepareStatement(postSql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PostVO(rs.getInt(1), null, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				mvo = new MemberVO(rs.getString(6),null,null,null,null,rs.getString(7),null,null);
				vo.setMemberVO(mvo);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return list;
	}

	public PostVO getPostDetail(String postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostVO postVO = null;
		MemberVO memberVO = null;
		
		try {
			con = dataSource.getConnection();
			String postSql = "SELECT * FROM post WHERE post_id = ?";
			
			pstmt = con.prepareStatement(postSql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				postVO = new PostVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), memberVO);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return postVO;
	}
		
	//포스트 업로드 메서드
	public void uploadPost(String fileName, String fileRealName, String postContent, String memberId) throws SQLException {
	    Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = dataSource.getConnection();
            StringBuilder postUploadSql = new StringBuilder();
            postUploadSql.append("insert into post(post_id, member_id, img, org_img, post_content, post_date) ");
            postUploadSql.append("values(post_seq.nextval, ?, ?, ?, ?, sysdate)");
            pstmt = con.prepareStatement(postUploadSql.toString());
            pstmt.setString(1, memberId);
            pstmt.setString(2, fileName);
            pstmt.setString(3, fileRealName);
            pstmt.setString(4, postContent);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(pstmt, con);
        }
	}
	// 포스트 아이디 조회
	public PostVO getPostId(String memberId) throws SQLException {
	    Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PostVO vo = null;
        try {
            con = dataSource.getConnection();
            String getPostIdSql = "SELECT * FROM post WHERE member_id = ? and post_id = (select max(post_id) from post where member_id = ?)";
            
            pstmt = con.prepareStatement(getPostIdSql);
            pstmt.setString(1, memberId);
            pstmt.setString(2, memberId);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                vo = new PostVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), null,null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(rs, pstmt, con);
        }
        return vo;
	}

	// 포스트 삭제 메서드
	public void deletePostByNo(int postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String deletePostByNoSql = "delete from post where post_id=?";
			pstmt = con.prepareStatement(deletePostByNoSql);
			pstmt.setInt(1, postId);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	} // deletePostByNo()
	
	// 포스트 수정 메서드
	public void updatePostByNo(PostVO postVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String updatePostByNoSql = "update post set post_content=? where post_id=?";
			pstmt = con.prepareStatement(updatePostByNoSql);
			pstmt.setString(1, postVO.getPostContent());
			pstmt.setInt(2, postVO.getPostId());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	} //updatePostByNo()
	
	// post 검색 메서드
	public ArrayList<PostVO> searchMemberByWord(String searchWord) throws SQLException {
		ArrayList<PostVO> searchPostList=new ArrayList<PostVO>();
		String sqlSearchWord="%"+searchWord+"%"; 
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String searchPostSql="select * from post p,member m where p.member_id=m.member_id and post_content like ?";
			pstmt=con.prepareStatement(searchPostSql);
			pstmt.setString(1, sqlSearchWord);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PostVO pvo=new PostVO();
				pvo.setPostId(rs.getInt("post_id"));
				System.out.println(rs.getInt("post_id"));
				pvo.setOrgImg(rs.getString("org_img"));
				pvo.setPostContent(rs.getString("post_content"));
				MemberVO mvo = new MemberVO();
				mvo.setMemberId(rs.getString("member_id"));
				mvo.setProfileImgPath(rs.getString("org_profile_img"));
				pvo.setMemberVO(mvo);
				searchPostList.add(pvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return searchPostList;
	}
	
	public ArrayList<PostVO> surfpost() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		PostVO pvo = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		
		try {
			con = dataSource.getConnection();
			String surfpostSql = "select * from post";
			
			pstmt = con.prepareStatement(surfpostSql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				pvo = new PostVO(rs.getInt(1), null, null, rs.getString(4), null, null, null, null);
				list.add(pvo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}		
		return list;
	}
	
	public MemberVO getMemberInfo(String memberId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		
		try {
			con = dataSource.getConnection();
			String memberSql = "SELECT * FROM member WHERE member_id=?";
			
			pstmt = con.prepareStatement(memberSql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberVO = new MemberVO(rs.getString(1), null, rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return memberVO;
	}
	
	public int likeCount(String postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = dataSource.getConnection();
			String countSql = "SELECT COUNT(*) FROM likes WHERE post_id=?";
			
			pstmt = con.prepareStatement(countSql);
			pstmt.setString(1, postId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return count;
	}
		
}
