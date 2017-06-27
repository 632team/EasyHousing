package com.easyhousing.model;

import java.util.Date;

public class BuyHouseComment {
	private int buildingId;
	private int userId;
	private int buyHouseCommentId;
	private String userComment;
	private Date userCommentDate;
	
	public int getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBuyHouseCommentId() {
		return buyHouseCommentId;
	}
	public void setBuyHouseCommentId(int buyHouseCommentId) {
		this.buyHouseCommentId = buyHouseCommentId;
	}
	public String getUserComment() {
		return userComment;
	}
	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}
	public Date getUserCommentDate() {
		return userCommentDate;
	}
	public void setUserCommentDate(Date userCommentDate) {
		this.userCommentDate = userCommentDate;
	}
}
