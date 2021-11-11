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
		PostVO pvo = null;
		MemberVO mvo = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		try {
			con = dataSource.getConnection();
			String postSql = "select p.post_id,p.img,p.org_img,p.post_content,p.post_date,m.member_id,m.org_profile_img from post p,member m where p.member_id=m.member_id order by p.post_id desc";
			pstmt = con.prepareStatement(postSql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pvo = new PostVO(rs.getInt(1), null, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				mvo = new MemberVO(rs.getString(6),null,null,null,null,rs.getString(7),null,null);
				pvo.setMemberVO(mvo);
				list.add(pvo);
			}
		} catch (SQLException e) {
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
		PostVO pvo = null;
		
		try {
			con = dataSource.getConnection();
			String postSql = "SELECT * FROM post WHERE post_id = ?";
			
			pstmt = con.prepareStatement(postSql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pvo = new PostVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return pvo;
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
				pvo = new PostVO(rs.getInt(1), null, null, rs.getString(4),null,null,null);
				list.add(pvo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}		
		return list;
	}
}


