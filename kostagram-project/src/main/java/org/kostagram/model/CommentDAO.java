package org.kostagram.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class CommentDAO {
    private static CommentDAO instance = new CommentDAO();
    private DataSource dataSource;
    private CommentDAO() {
        this.dataSource = DataSourceManager.getInstance().getDataSource();
    }
    public static CommentDAO getInstance() {
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
    // 댓글 작성
    public CommentVO writeComment(String memberId, int postId, String commentContent) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        CommentVO commentVO = null;
        try {
            con = dataSource.getConnection();
            StringBuilder writeCommentSql = new StringBuilder();
            writeCommentSql.append("insert into post_comment(comment_id, member_id, post_id, comment_date, comment_content) ");
            writeCommentSql.append("values (comment_seq.nextval, ?, ?, sysdate, ?)");
            pstmt = con.prepareStatement(writeCommentSql.toString());
            pstmt.setString(1, memberId);
            pstmt.setInt(2, postId);
            pstmt.setString(3, commentContent);
            pstmt.executeUpdate();
        }finally {
            closeAll(pstmt, con);
        }
        return commentVO;
    }
    // 댓글 삭제
    public void deleteComment(int commentId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = dataSource.getConnection();
            String writeCommentSql = "delete from post_comment where comment_id=?";
            pstmt = con.prepareStatement(writeCommentSql);
            pstmt.setInt(1, commentId);
            pstmt.executeUpdate();
        }finally {
            closeAll(pstmt, con);
        }
    }
    // 댓글 리스트
    public ArrayList<CommentVO> getCommentList(int postId) throws SQLException{
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<CommentVO> commentList= new ArrayList<CommentVO>();
        try {
            con = dataSource.getConnection();
            StringBuilder getCommentListSql = new StringBuilder("");
            getCommentListSql.append("select b.comment_content, to_char(b.comment_date,'YYYY-MM-DD') as date2, b.member_id, b.comment_id, m.org_profile_img ");
            getCommentListSql.append("from (select comment_content, comment_date, comment_id, c.member_id ");
            getCommentListSql.append("from post_comment c, post p ");
            getCommentListSql.append("where c.post_id=? and p.post_id=? ");
            getCommentListSql.append(") b, member m ");
            getCommentListSql.append("where b.member_id = m.member_id ");
            getCommentListSql.append("order by b.comment_id desc");
            pstmt = con.prepareStatement(getCommentListSql.toString());
            pstmt.setInt(1, postId);
            pstmt.setInt(2, postId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                MemberVO mvo = new MemberVO();
                mvo.setProfileImgPath(rs.getString("org_profile_img"));
                mvo.setMemberId(rs.getString("member_id"));
                CommentVO commentVO = new CommentVO(mvo, rs.getInt("comment_id"), rs.getString("comment_content"), rs.getString("date2"));
                commentList.add(commentVO);
            }
        }finally {
            closeAll(pstmt, con);
        }
        return commentList;
    }
}
