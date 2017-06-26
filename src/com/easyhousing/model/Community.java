package com.easyhousing.model;

import java.util.Date;

public class Community {
	private int communityId;
	private int rentHouseId;
	private int comminutyBuildingNum;
	private Date comminutyBuildTime;
	private String comminutyDeveloper;
	private int comminutyHouseNum;
	private double comminutyPrice;
	private String comminutyPropertyCompany;
	private double comminutyPropertyFee;
	public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	public int getRentHouseId() {
		return rentHouseId;
	}
	public void setRentHouseId(int rentHouseId) {
		this.rentHouseId = rentHouseId;
	}
	public int getComminutyBuildingNum() {
		return comminutyBuildingNum;
	}
	public void setComminutyBuildingNum(int comminutyBuildingNum) {
		this.comminutyBuildingNum = comminutyBuildingNum;
	}
	public Date getComminutyBuildTime() {
		return comminutyBuildTime;
	}
	public void setComminutyBuildTime(Date comminutyBuildTime) {
		this.comminutyBuildTime = comminutyBuildTime;
	}
	public String getComminutyDeveloper() {
		return comminutyDeveloper;
	}
	public void setComminutyDeveloper(String comminutyDeveloper) {
		this.comminutyDeveloper = comminutyDeveloper;
	}
	public int getComminutyHouseNum() {
		return comminutyHouseNum;
	}
	public void setComminutyHouseNum(int comminutyHouseNum) {
		this.comminutyHouseNum = comminutyHouseNum;
	}
	public double getComminutyPrice() {
		return comminutyPrice;
	}
	public void setComminutyPrice(double comminutyPrice) {
		this.comminutyPrice = comminutyPrice;
	}
	public String getComminutyPropertyCompany() {
		return comminutyPropertyCompany;
	}
	public void setComminutyPropertyCompany(String comminutyPropertyCompany) {
		this.comminutyPropertyCompany = comminutyPropertyCompany;
	}
	public double getComminutyPropertyFee() {
		return comminutyPropertyFee;
	}
	public void setComminutyPropertyFee(double comminutyPropertyFee) {
		this.comminutyPropertyFee = comminutyPropertyFee;
	}
	
}
