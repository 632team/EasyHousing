package com.easyhousing.model;

import java.util.Date;

public class BuildingPic {
	
	private int buildingId;
	private Date buildingPicInsertTime;
	private String buildingPicUrl;
	private String buildingPicType;
	
	public int getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	public Date getBuildingPicInsertTime() {
		return buildingPicInsertTime;
	}
	public void setBuildingPicInsertTime(Date buildingPicInsertTime) {
		this.buildingPicInsertTime = buildingPicInsertTime;
	}
	public String getBuildingPicUrl() {
		return buildingPicUrl;
	}
	public void setBuildingPicUrl(String buildingPicUrl) {
		this.buildingPicUrl = buildingPicUrl;
	}
	public String getBuildingPicType() {
		return buildingPicType;
	}
	public void setBuildingPicType(String buildingPicType) {
		this.buildingPicType = buildingPicType;
	}
}
