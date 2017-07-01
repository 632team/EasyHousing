package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.UserCollectBuilding;

public interface UserCollectBuildingDao {
	public void insertUserCollectBuilding(UserCollectBuilding u);
	public int deleteUserCollectBuilding(UserCollectBuilding u);
	public List<UserCollectBuilding> selectAllByUserId(UserCollectBuilding u);
}
