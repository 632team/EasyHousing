package com.easyhousing.dao;

import com.easyhousing.model.BuildingPic;

public interface BuildingPicDao {
	public void insertBuildingPic(BuildingPic u);
	public int deleteBuildingPic(BuildingPic u);
	public int updateBuildingPic(BuildingPic u);
	public BuildingPic selectBuildingPic(BuildingPic u);
}
