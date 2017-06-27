package com.easyhousing.dao;

import com.easyhousing.model.BuildingDeal;

public interface BuildingDealDao {
	
	public void insertBuildingDeal(BuildingDeal u);
	public int deleteBuildingDeal(BuildingDeal u);
	public int updateBuildingDeal(BuildingDeal u);
	public BuildingDeal selectBuildingDeal(BuildingDeal u);
}
