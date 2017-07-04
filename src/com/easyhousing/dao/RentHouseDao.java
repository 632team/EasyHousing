package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.RentHouse;

public interface RentHouseDao {
	public int insertRentHouse(RentHouse u);
	public int deleteRentHouse(RentHouse u);
	public int updateRentHouse(RentHouse u);
	public List<RentHouse> selectRentHouse(String area, int lowPrice, int highPrice, int lowRoomNum, int highRoomNum);
	public RentHouse selectRentHouseById(int id);
	public List<RentHouse> selectAllRentHouse();
}
