package com.easyhousing.model;

import java.util.Date;

public class RentHouseComment {
	private int rentHouseId;
	private String userComment;
	private int userId;
	private Date userCommentDate;
	private int rentHouseCommentId;
	public int getRentHouseId() {
		return rentHouseId;
	}
	public void setRentHouseId(int rentHouseId) {
		this.rentHouseId = rentHouseId;
	}
	public String getUserComment() {
		return userComment;
	}
	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getUserCommentDate() {
		return userCommentDate;
	}
	public void setUserCommentDate(Date userCommentDate) {
		this.userCommentDate = userCommentDate;
	}
	public int getRentHouseCommentId() {
		return rentHouseCommentId;
	}
	public void setRentHouseCommentId(int rentHouseCommentId) {
		this.rentHouseCommentId = rentHouseCommentId;
	}
	
}
