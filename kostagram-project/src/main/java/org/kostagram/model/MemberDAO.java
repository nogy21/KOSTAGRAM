package org.kostagram.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
    private static MemberDAO instance = new MemberDAO();
    private DataSource dataSource;
    private MemberDAO() {
        this.dataSource = DataSourceManager.getInstance().getDataSource();
    }
    public static MemberDAO getInstance() {
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
    
	public void UpdateMember(String memberId, String email, String name) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String UpdateMemberSql = null;
			
			if(email =="") {
				UpdateMemberSql = "UPDATE member SET name=? WHERE member_id=?";
				pstmt = con.prepareStatement(UpdateMemberSql);
				pstmt.setString(1, name);
				pstmt.setString(2, memberId);
			}else if(name == "") {
				UpdateMemberSql = "UPDATE member SET email=? WHERE member_id=?";
				pstmt = con.prepareStatement(UpdateMemberSql);
				pstmt.setString(1, email);
				pstmt.setString(2, memberId);
			}else {
				UpdateMemberSql = "UPDATE member SET email=?, name=? WHERE member_id=?";
				pstmt = con.prepareStatement(UpdateMemberSql);
				pstmt.setString(1, email);
				pstmt.setString(2, name);
				pstmt.setString(3, memberId);
			}
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(pstmt, con);
		}
				
		
	}
}
