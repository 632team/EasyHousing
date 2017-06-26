package com.easyhousing.model;

import java.util.Date;

public class BuildingInfo {
	
	private String buildingAddress;
	private int buildingId;
	private String buildingName;
	private String buildingDecoration;
	private int buildingMaxArea;
	private int buildingMinArea;
	private String buildingNeighbourhood;
	private int buildingReferencePrice;
	private String buildingSaleState;
	private Date buildingTimeHanded;
	
	public String getBuildingAddress() {
		return buildingAddress;
	}
	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}
	public int getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	public String getBuildingDecoration() {
		return buildingDecoration;
	}
	public void setBuildingDecoration(String buildingDecoration) {
		this.buildingDecoration = buildingDecoration;
	}
	public int getBuildingMaxArea() {
		return buildingMaxArea;
	}
	public void setBuildingMaxArea(int buildingMaxArea) {
		this.buildingMaxArea = buildingMaxArea;
	}
	public int getBuildingMinArea() {
		return buildingMinArea;
	}
	public void setBuildingMinArea(int buildingMinArea) {
		this.buildingMinArea = buildingMinArea;
	}
	public String getBuildingNeighbourhood() {
		return buildingNeighbourhood;
	}
	public void setBuildingNeighbourhood(String buildingNeighbourhood) {
		this.buildingNeighbourhood = buildingNeighbourhood;
	}
	public int getBuildingReferencePrice() {
		return buildingReferencePrice;
	}
	public void setBuildingReferencePrice(int buildingReferencePrice) {
		this.buildingReferencePrice = buildingReferencePrice;
	}
	public String getBuildingSaleState() {
		return buildingSaleState;
	}
	public void setBuildingSaleState(String buildingSaleState) {
		this.buildingSaleState = buildingSaleState;
	}
	public Date getBuildingTimeHanded() {
		return buildingTimeHanded;
	}
	public void setBuildingTimeHanded(Date buildingTimeHanded) {
		this.buildingTimeHanded = buildingTimeHanded;
	}
}
