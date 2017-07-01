package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.UserCollectRentHouse;

public interface UserCollectRentHouseDao {
	public void insertUserCollectRentHouse(UserCollectRentHouse u);
	public int deleteUserCollectRentHouse(UserCollectRentHouse u);
	public List<UserCollectRentHouse> selectAllByUserId(UserCollectRentHouse u);
}
