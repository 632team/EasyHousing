package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.BuildingInfo;

public interface BuildingSearch {
	public List<BuildingInfo> searchBuilding(String Address, int lowPrice, int highPrice);
	public BuildingInfo searchBuildingById(int id);
}
