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

    public void modifypassword(String id, String password) throws SQLException {
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	try {
    		con=dataSource.getConnection();
    		String modifyPasswordSql = "update MEMBER set password=? where member_id=?";
    		pstmt=con.prepareStatement(modifyPasswordSql);
    		pstmt.setString(1, password);
    		pstmt.setString(2, id);
    		pstmt.executeUpdate();
    	}finally {
    		closeAll(pstmt,con);
    	}
    }
    
    public MemberVO login(String id, String password) throws SQLException {
		MemberVO loginVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql="select name from member where member_id=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				loginVO = new MemberVO(id, password, rs.getString(1));
		} finally {
			closeAll(rs, pstmt, con);
		}
		return loginVO;
   }
    
	public MemberVO UpdateMember(String memberId, String email, String name) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		MemberVO memberVO = null;
		ResultSet rs = null;
		
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
			pstmt.close();
			
			String updateSessionSql = "SELECT * FROM member WHERE member_id = ?";
			pstmt = con.prepareStatement(updateSessionSql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberVO = new MemberVO(rs.getString(1), null, rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(pstmt, con);
		}
				
		return memberVO;

	}
}
/*
 * public MemberVO checkpassword(String password) throws SQLException { MemberVO
 * memberVO = null; Connection con = null; PreparedStatement pstmt = null;
 * ResultSet rs = null; try { con=dataSource.getConnection(); String
 * checkPasswordSql = "select password from member where member_id=?";
 * pstmt=con.prepareStatement(checkPasswordSql); pstmt.setString(1, password);
 * rs=pstmt.executeQuery(); if(rs.next()) { memberVO = new
 * MemberVO(password,rs.getString(1)); } }finally { closeAll(rs,pstmt,con); }
 * return memberVO; } }
 */
