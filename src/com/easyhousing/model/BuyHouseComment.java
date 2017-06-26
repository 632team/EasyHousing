package com.easyhousing.model;

public class BuyHouseComment {
	private int buildingId;
	private int userId;
	private int buyHouseId;
	private String userComment;
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
	public int getBuyHouseId() {
		return buyHouseId;
	}
	public void setBuyHouseId(int buyHouseId) {
		this.buyHouseId = buyHouseId;
	}
	public String getUserComment() {
		return userComment;
	}
	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}
}
