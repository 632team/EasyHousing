package com.easyhousing.model;

import java.util.Date;

public class RentHousePic {
	private Date insertTime;
	private String picUrl;
	private int rentHouseId;
	
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public int getRentHouseId() {
		return rentHouseId;
	}
	public void setRentHouseId(int rentHouseId) {
		this.rentHouseId = rentHouseId;
	}
	
}
