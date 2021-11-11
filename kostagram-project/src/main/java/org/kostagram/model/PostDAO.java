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
		PostVO vo = null;
		
		try {
			con = dataSource.getConnection();
			String postSql = "SELECT * FROM post WHERE post_id = ?";
			
			pstmt = con.prepareStatement(postSql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new PostVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return vo;
	}
	public ArrayList<PostVO> getPostingList(PagingBean pagingBean) throws SQLException{
		ArrayList<PostVO> list=new ArrayList<PostVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();//dbcp로부터 컨넥션을 빌려온다
			StringBuilder sql=new StringBuilder();
			sql.append("select p.post_id,p.img,p.org_img,p.post_content,p.post_date,m.member_id ");
			sql.append("from( ");
			sql.append("select row_number() over(order by post_id desc) as rnum,post_id,img,org_img,post_content, ");
			sql.append("to_char(post_date,'YYYY.MM.DD') as post_date,member_id ");
			sql.append("from post ");
			sql.append(") p,member m  ");
			sql.append("where p.member_id=m.member_id and rnum ? and ? ");	
			sql.append("order by p.post_id desc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pagingBean.getStartRowNumber());
			pstmt.setInt(2, pagingBean.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PostVO pvo=new PostVO();
				pvo.setPostId(rs.getInt("postid"));//1,2,3~ 대신 컬럼명으로 가능 
				pvo.setImg(rs.getString("img"));
				pvo.setOrgImg(rs.getString("orgimg"));
				pvo.setPostDate(rs.getString("post_date"));
				MemberVO mvo=new MemberVO();
				mvo.setMemberId(rs.getString("memberid"));
				pvo.setMemberVO(mvo);
				list.add(pvo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
}


