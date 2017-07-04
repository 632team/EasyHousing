package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.RentHouseDeal;

public interface RentHouseDealDao {
	public void insertRentHouseDeal(RentHouseDeal u);
	public int deleteRentHouseDeal(RentHouseDeal u);
	public int updateRentHouseDeal(RentHouseDeal u);
	public RentHouseDeal selectRentHouseDeal(RentHouseDeal u);
	public List<RentHouseDeal> selectAllByUserId(int id);
	public List<RentHouseDeal> selectAll();
}
