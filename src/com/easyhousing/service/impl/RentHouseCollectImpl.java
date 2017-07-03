package com.easyhousing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.UserCollectRentHouseDao;
import com.easyhousing.model.UserCollectRentHouse;
import com.easyhousing.service.RentHouseCollect;

@Service("rentHouseCollectService")
public class RentHouseCollectImpl implements RentHouseCollect{

	@Autowired
	private UserCollectRentHouseDao userCollectRentHouseDao;
	
	@Override
	public void insert(int userId, int rentHouseId) {
		UserCollectRentHouse userCollectRentHouse = new UserCollectRentHouse();
		userCollectRentHouse.setRentHouseId(rentHouseId);
		userCollectRentHouse.setUserId(userId);
		//userCollectRentHouse.setCollectTime(collectTime);
		userCollectRentHouseDao.insertUserCollectRentHouse(userCollectRentHouse);
		System.err.println("collectrenthouse ok!");
	}

	@Override
	public int selectByUserIdRentHouseId(int userId, int rentHouseId) {
		UserCollectRentHouse userCollectRentHouse = new UserCollectRentHouse();
		userCollectRentHouse.setRentHouseId(rentHouseId);
		userCollectRentHouse.setUserId(userId);
		userCollectRentHouse = userCollectRentHouseDao.selectAllByUserIdRentHouseId(userCollectRentHouse);
		if(userCollectRentHouse == null)
			return 0;
		else
			return 1;
	}

	@Override
	public void delete(int userId, int rentHouseId) {
		UserCollectRentHouse userCollectRentHouse = new UserCollectRentHouse();
		userCollectRentHouse.setRentHouseId(rentHouseId);
		userCollectRentHouse.setUserId(userId);
		userCollectRentHouseDao.deleteUserCollectRentHouse(userCollectRentHouse);
	}
	
	
}
