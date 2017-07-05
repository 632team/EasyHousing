package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.BuildingDeal;

public interface BuildingDealDao {
	
	public void insertBuildingDeal(BuildingDeal u);
	public int deleteBuildingDeal(BuildingDeal u);
	public int updateBuildingDeal(BuildingDeal u);
	public BuildingDeal selectBuildingDeal(BuildingDeal u);
	public List<BuildingDeal> selectAllByUserId(int id);
	public List<BuildingDeal> selectAll();
}
