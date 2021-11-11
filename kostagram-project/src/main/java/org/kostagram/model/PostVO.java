package org.kostagram.model;

import java.io.Serializable;

public class PostVO implements Serializable{
	private static final long serialVersionUID = 5386444296273611786L;
	private int postId;
	private String memberId;
	private String img;
	private String orgImg;
	private String postContent;
	private String postDate;
	private CommentVO commentVO;
	
	public PostVO() {
		super();
	}

    public PostVO(int postId, String memberId, String img, String orgImg, String postContent, String postDate,
            CommentVO commentVO) {
        super();
        this.postId = postId;
        this.memberId = memberId;
        this.img = img;
        this.orgImg = orgImg;
        this.postContent = postContent;
        this.postDate = postDate;
        this.commentVO = commentVO;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getOrgImg() {
        return orgImg;
    }

    public void setOrgImg(String orgImg) {
        this.orgImg = orgImg;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public CommentVO getCommentVO() {
        return commentVO;
    }

    public void setCommentVO(CommentVO commentVO) {
        this.commentVO = commentVO;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "PostVO [postId=" + postId + ", memberId=" + memberId + ", img=" + img + ", orgImg=" + orgImg
                + ", postContent=" + postContent + ", postDate=" + postDate + ", commentVO=" + commentVO + "]";
    }

}
