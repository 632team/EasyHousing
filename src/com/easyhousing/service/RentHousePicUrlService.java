package com.easyhousing.service;

import java.util.List;

/**
 * 租房图片相关服务
 */
public interface RentHousePicUrlService {
	// 获得房子对应图片的所有URL
	public List<String> searchRentHousePicByRentHouseId(int rentHouseId);
}
