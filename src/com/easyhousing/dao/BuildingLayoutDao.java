package com.easyhousing.dao;

import com.easyhousing.model.BuildingLayout;

public interface BuildingLayoutDao {
	public void insertBuildingLayout(BuildingLayout u);
	public int deleteBuildingLayout(BuildingLayout u);
	public int updateBuildingLayout(BuildingLayout u);
	public BuildingLayout selectBuildingLayout(BuildingLayout u);
}
