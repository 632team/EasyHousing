package com.easyhousing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.service.RentHousePicUrlService;

@Service("RentHousePicUrlService")
public class RentHousePicUrlServiceImpl implements RentHousePicUrlService{

	@Autowired
	private RentHousePicDao rentHousePicDao;
	
	@Override
	public List<String> searchRentHousePicByRentHouseId(int rentHouseId) {
		return rentHousePicDao.selectRentHousePicByRentHouseId(rentHouseId);
	}

}
