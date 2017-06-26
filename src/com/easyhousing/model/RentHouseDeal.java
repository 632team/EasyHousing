package com.easyhousing.model;

import java.util.Date;

public class RentHouseDeal {
	private int agentId;
	private int rentHouseId;
	private int userId;
	private Date rentTime;
	private int rentId;
	private double rentPrice;
	public int getAgentId() {
		return agentId;
	}
	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}
	public int getRentHouseId() {
		return rentHouseId;
	}
	public void setRentHouseId(int rentHouseId) {
		this.rentHouseId = rentHouseId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getRentTime() {
		return rentTime;
	}
	public void setRentTime(Date rentTime) {
		this.rentTime = rentTime;
	}
	public int getRentId() {
		return rentId;
	}
	public void setRentId(int rentId) {
		this.rentId = rentId;
	}
	public double getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(double rentPrice) {
		this.rentPrice = rentPrice;
	}
}
