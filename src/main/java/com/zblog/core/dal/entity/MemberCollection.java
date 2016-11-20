package com.zblog.core.dal.entity;

public class MemberCollection extends BaseEntity{
	private String memberId;
  	private String postId;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
  	
	
}
