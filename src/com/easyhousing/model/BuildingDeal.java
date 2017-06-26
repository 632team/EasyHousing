package com.easyhousing.model;

import java.util.Date;

public class BuildingDeal {
	
	private int agentId;
	private int buildingId;
	private int userId;
	private int buildingDealPerPrice;
	private int buildingDealTotalPrice;
	private int buildingDealId;
	private Date buildingDealTime;
	private String buildingLayout;
	
	public int getAgentId() {
		return agentId;
	}
	
	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}
	
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
	
	public int getBuildingDealPerPrice() {
		return buildingDealPerPrice;
	}
	
	public void setBuildingDealPerPrice(int buildingDealPerPrice) {
		this.buildingDealPerPrice = buildingDealPerPrice;
	}
	
	public int getBuildingDealTotalPrice() {
		return buildingDealTotalPrice;
	}
	
	public void setBuildingDealTotalPrice(int buildingDealTotalPrice) {
		this.buildingDealTotalPrice = buildingDealTotalPrice;
	}
	
	public int getBuildingDealId() {
		return buildingDealId;
	}
	
	public void setBuildingDealId(int buildingDealId) {
		this.buildingDealId = buildingDealId;
	}
	
	public Date getBuildingDealTime() {
		return buildingDealTime;
	}
	
	public void setBuildingDealTime(Date buildingDealTime) {
		this.buildingDealTime = buildingDealTime;
	}
	
	public String getBuildingLayout() {
		return buildingLayout;
	}
	
	public void setBuildingLayout(String buildingLayout) {
		this.buildingLayout = buildingLayout;
	}
	
}
