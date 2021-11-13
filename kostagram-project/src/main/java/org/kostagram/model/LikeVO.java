package org.kostagram.model;

public class LikeVO {
	private int likesId;
	private String memberId;
	private int postId;
	public LikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeVO(int likesId, String memberId, int postId) {
		super();
		this.likesId = likesId;
		this.memberId = memberId;
		this.postId = postId;
	}
	public int getLikesId() {
		return likesId;
	}
	public void setLikesId(int likesId) {
		this.likesId = likesId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	@Override
	public String toString() {
		return "LikeVO [likesId=" + likesId + ", memberId=" + memberId + ", postId=" + postId + "]";
	}

}
