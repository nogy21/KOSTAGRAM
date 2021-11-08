package org.kostagram.model;

import java.sql.Connection;
import java.sql.DriverManager;
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
    //회원가입 메서드
    public void registerMember(MemberVO registerVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = dataSource.getConnection();
            StringBuilder registerSql = new StringBuilder();
            registerSql.append("insert into KOSTA_MEMBER(member_id, password, email, name, register_date) ");
            registerSql.append("values (?, ?, ?, ?, sysdate)");
            pstmt = con.prepareStatement(registerSql.toString());
            pstmt.setString(1, registerVO.getMemberId());
            pstmt.setString(2, registerVO.getPassword());
            pstmt.setString(3, registerVO.getEmail());
            pstmt.setString(4, registerVO.getName());
            pstmt.executeUpdate();
            
        }finally {
            closeAll(pstmt, con);
        }
    }
    //아이디 중복확인 체크 메서드 
    public boolean checkId(String id) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = dataSource.getConnection();
            String checkIdSql = "select count(*) from kosta_member where member_id=?";
            pstmt = con.prepareStatement(checkIdSql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()&&rs.getInt(1)==1)
                result=true;
        }finally {
            closeAll(rs, pstmt, con);
        }
        return result;
    }
    
}
