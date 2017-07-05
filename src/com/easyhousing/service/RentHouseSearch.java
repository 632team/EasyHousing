package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.RentHouse;

/**
 * 租房搜索相关服务
 */
public interface RentHouseSearch {
	// 使用地址、最低价、最高价、居室最小值、居室最大值进行搜索
	public List<RentHouse> searchRentHouse(String Address, int lowPrice, int highPrice, int lowRoomNum, int highRoomNum);
	public RentHouse searchRentHouseById(int id);
}
