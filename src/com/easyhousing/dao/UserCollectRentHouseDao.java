package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.UserCollectRentHouse;

public interface UserCollectRentHouseDao {
	public void insertUserCollectRentHouse(UserCollectRentHouse u);
	public void deleteUserCollectRentHouse(UserCollectRentHouse u);
	public List<UserCollectRentHouse> selectAllByUserId(UserCollectRentHouse u);
	public UserCollectRentHouse selectAllByUserIdRentHouseId(UserCollectRentHouse u);
}
