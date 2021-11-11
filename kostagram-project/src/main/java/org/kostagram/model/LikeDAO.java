package org.kostagram.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class LikeDAO {
	private static LikeDAO instance = new LikeDAO();
    private DataSource dataSource;
    private LikeDAO() {
        this.dataSource = DataSourceManager.getInstance().getDataSource();
    }
    public static LikeDAO getInstance() {
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
	
	public void likePost(String memberId, String postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt= null;
		
		try {
			con= dataSource.getConnection();
			String likeSql ="insert into likes(likes_id, member_id, post_id) values(likes_seq.nextval,?,?)";
			
			pstmt = con.prepareStatement(likeSql);
			pstmt.setString(1,memberId);
			pstmt.setString(2, postId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			closeAll(pstmt, con);
		}
	}
	public boolean liked(String memberId, String postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean didLike = false;
	
		try {
			con=dataSource.getConnection();
			String likedSql = "select member_id from likes where post_id=? and member_id=?";
			pstmt = con.prepareStatement(likedSql);
			pstmt.setString(1, postId);
			pstmt.setString(2, memberId);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				didLike=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			closeAll(rs, pstmt, con);
		}
		
		return didLike;
	}
	public void unLikePost(String memberId, String postId) throws SQLException {
		 Connection con = null;
		 PreparedStatement pstmt = null;
		 
		 try {
			con= dataSource.getConnection();
			String likeSql = "delete from likes where post_id=? and member_id=?";
			pstmt=con.prepareStatement(likeSql);
			pstmt.setString(1, postId);
			pstmt.setString(2, memberId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			closeAll(pstmt, con);
		}
	}
	public int likecnt(String postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countLikes = 0;
						
		try {
			con = dataSource.getConnection();
			String likeSql = "SELECT COUNT(*) as likecnt FROM likes where post_id=?";
			pstmt=con.prepareStatement(likeSql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				countLikes=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			closeAll(rs, pstmt, con);
		}
	
		return countLikes;
	}
}

