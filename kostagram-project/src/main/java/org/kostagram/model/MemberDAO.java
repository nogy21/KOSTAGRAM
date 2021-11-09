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
    public void updateProfile(String fileName, String fileRealName, String introduce, String memberId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = dataSource.getConnection();
            String updateProfileSql = "update member set profile_img=?, org_profile_img=?, introduce=? where member_id=?";
            pstmt = con.prepareStatement(updateProfileSql);
            pstmt.setString(1, fileName);
            pstmt.setString(2, fileRealName);
            pstmt.setString(3, introduce);
            pstmt.setString(4, memberId);
            pstmt.executeUpdate();
        }finally {
            closeAll(pstmt, con);
        }
    }
}
