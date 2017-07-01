package com.easyhousing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.model.RentHouse;
import com.easyhousing.service.RentHouseSearch;

@Service("rentHouseSearch")
public class RentHouseSearchImpl implements RentHouseSearch{

	@Autowired
	private RentHouseDao rentHouseDao;

	@Override
	public List<RentHouse> searchRentHouse(String Address, int lowPrice, int highPrice, int lowRoomNum, int highRoomNum) {
		
		return rentHouseDao.selectRentHouse(Address, lowPrice, highPrice, lowRoomNum, highRoomNum);
	}

	@Override
	public RentHouse searchRentHouseById(int id) {
		return rentHouseDao.selectRentHouseById(id);
	}

}
