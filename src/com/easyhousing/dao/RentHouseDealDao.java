package com.easyhousing.dao;

import com.easyhousing.model.RentHouseDeal;

public interface RentHouseDealDao {
	public void insertRentHouseDeal(RentHouseDeal u);
	public int deleteRentHouseDeal(RentHouseDeal u);
	public int updateRentHouseDeal(RentHouseDeal u);
	public RentHouseDeal selectRentHouseDeal(RentHouseDeal u);
}
