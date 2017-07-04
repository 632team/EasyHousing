package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.BuildingPic;

public interface BuildingPicDao {
	public void insertBuildingPic(BuildingPic u);
	public int deleteBuildingPic(BuildingPic u);
	public int updateBuildingPic(BuildingPic u);
	public BuildingPic selectBuildingPic(BuildingPic u);
	public List<String> selectBuildingPicByBuildingId(int id);
	public List<BuildingPic> selectAll();
}
