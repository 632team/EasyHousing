package com.easyhousing.model;

public class BuildingLayout {
	
	private int buildingId;
	private String buildingLayoutPicUrl;
	private int buildingLayoutReferencePrice;
	private String buildingLayout;
	private int buildingLayoutSoldOut;
	private int buildingLayoutPerPrice;
	
	public int getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	public String getBuildingLayoutPicUrl() {
		return buildingLayoutPicUrl;
	}
	public void setBuildingLayoutPicUrl(String buildingLayoutPicUrl) {
		this.buildingLayoutPicUrl = buildingLayoutPicUrl;
	}
	public int getBuildingLayoutReferencePrice() {
		return buildingLayoutReferencePrice;
	}
	public void setBuildingLayoutReferencePrice(int buildingLayoutReferencePrice) {
		this.buildingLayoutReferencePrice = buildingLayoutReferencePrice;
	}
	public String getBuildingLayout() {
		return buildingLayout;
	}
	public void setBuildingLayout(String buildingLayout) {
		this.buildingLayout = buildingLayout;
	}
	public int getBuildingLayoutSoldOut() {
		return buildingLayoutSoldOut;
	}
	public void setBuildingLayoutSoldOut(int buildingLayoutSoldOut) {
		this.buildingLayoutSoldOut = buildingLayoutSoldOut;
	}
	public int getBuildingLayoutPerPrice() {
		return buildingLayoutPerPrice;
	}
	public void setBuildingLayoutPerPrice(int buildingLayoutPerPrice) {
		this.buildingLayoutPerPrice = buildingLayoutPerPrice;
	}
}
