package com.easyhousing.service;

/**
 * 租房收藏相关服务
 */
public interface RentHouseCollect {
	public void insert(int userId, int rentHouseId);
	public void delete(int userId, int rentHouseId);
	public int selectByUserIdRentHouseId(int userId, int rentHouseId);
}
