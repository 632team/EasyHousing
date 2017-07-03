package com.easyhousing.service;

public interface RentHouseCollect {
	
	public void insert(int userId, int rentHouseId);
	public void delete(int userId, int rentHouseId);
	public int selectByUserIdRentHouseId(int userId, int rentHouseId);
}
