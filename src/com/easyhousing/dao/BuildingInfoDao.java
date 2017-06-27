package com.easyhousing.dao;

import com.easyhousing.model.BuildingInfo;

public interface BuildingInfoDao {
	public void insertBuildingInfo(BuildingInfo u);
	public int deleteBuildingInfo(BuildingInfo u);
	public int updateBuildingInfo(BuildingInfo u);
	public BuildingInfo selectBuildingInfo(BuildingInfo u);
}
