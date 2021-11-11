package org.kostagram.model;

import java.io.Serializable;

public class CommentVO implements Serializable{
    private static final long serialVersionUID = 5220019328172706310L;
    private MemberVO memberVO;
    private int commentId;
    private String commentContent;
    private String commentDate;
    public CommentVO() {
        super();
    }
    public CommentVO(MemberVO memberVO, int commentId, String commentContent, String commentDate) {
        super();
        this.memberVO = memberVO;
        this.commentId = commentId;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
    }
    public MemberVO getMemberVO() {
        return memberVO;
    }
    public void setMemberVO(MemberVO memberVO) {
        this.memberVO = memberVO;
    }
    public int getCommentId() {
        return commentId;
    }
    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
    public String getCommentContent() {
        return commentContent;
    }
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    public String getCommentDate() {
        return commentDate;
    }
    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    @Override
    public String toString() {
        return "CommentVO [memberVO=" + memberVO + ", commentId=" + commentId + ", commentContent=" + commentContent
                + ", commentDate=" + commentDate + "]";
    }
    
}
