package com.easyhousing.dao;

import com.easyhousing.model.RentHouse;

public interface RentHouseDao {
	public void insertRentHouse(RentHouse u);
	public int deleteRentHouse(RentHouse u);
	public int updateRentHouse(RentHouse u);
	public RentHouse selectRentHouse(RentHouse u);
}
