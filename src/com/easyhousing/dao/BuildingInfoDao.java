package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.BuildingInfo;

public interface BuildingInfoDao {
	public void insertBuildingInfo(BuildingInfo u);
	public int deleteBuildingInfo(BuildingInfo u);
	public int updateBuildingInfo(BuildingInfo u);
	public BuildingInfo selectBuildingInfo(BuildingInfo u);
	public BuildingInfo selectBuildingById(int id);
	public List<BuildingInfo> selectBuilding(String area, int lowPrice, int highPrice);
	public List<BuildingInfo> selectAll();
}
