package com.easyhousing.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.dao.UserCollectBuildingDao;
import com.easyhousing.dao.UserCollectRentHouseDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.Collect;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.User;
import com.easyhousing.model.UserCollectBuilding;
import com.easyhousing.model.UserCollectRentHouse;
import com.easyhousing.service.UserCollectService;

@Service("userCollectService")
public class UserCollectServiceImpl implements UserCollectService {
	
	@Autowired
	UserCollectRentHouseDao userCollectRentHouseDao;
	@Autowired
	RentHouseDao rentHouseDao;
	@Autowired
	RentHousePicDao rentHousePicDao;
	
	@Autowired
	UserCollectBuildingDao userCollectBuildingDao;
	@Autowired
	BuildingInfoDao buildingInfoDao;
	@Autowired
	BuildingPicDao buildingPicDao;
	
	// Collect用于将相关ID得到的信息记录下来用于后期页面展示
	@Override
	public List<Collect> selectUserCollectRentHouse(User u) {
		UserCollectRentHouse r = new UserCollectRentHouse();
		r.setUserId(u.getUserId());
		List<UserCollectRentHouse> li = userCollectRentHouseDao.selectAllByUserId(r);
		List<Collect> ret = new ArrayList<>();
		for (UserCollectRentHouse i: li) {
			Collect c = new Collect();
			RentHouse rentHouse = rentHouseDao.selectRentHouseById(i.getRentHouseId());
			c.province = rentHouse.getRentHouseProvince();
			c.region = rentHouse.getRentHouseRegion();
			c.name = rentHouse.getRentHouseAddress();
			c.houseId = rentHouse.getRentHouseId();
			c.price = rentHouse.getRentHousePrice();
			c.room = rentHouse.getRentHouseRoom();
			List<String> lp = rentHousePicDao.selectRentHousePicByRentHouseId(c.houseId);
			if (lp.size() != 0)
				c.picUrl = lp.get(0);
			else c.picUrl = "";
			ret.add(c);
		}
		return ret;
	}
	
	// Collect用于将相关ID得到的信息记录下来用于后期页面展示
	@Override
	public List<Collect> selectUserCollectBuilding(User u) {
		UserCollectBuilding b = new UserCollectBuilding();
		b.setUserId(u.getUserId());
		List<UserCollectBuilding> li = userCollectBuildingDao.selectAllByUserId(b);
		List<Collect> ret = new ArrayList<>();
		for (UserCollectBuilding i: li) {
			Collect c = new Collect();
			
			BuildingInfo bi = new BuildingInfo();
			bi.setBuildingId(i.getBuildingId());
			bi = buildingInfoDao.selectBuildingInfo(bi);
			
			c.decoration = bi.getBuildingDecoration();
			c.name = bi.getBuildingName();
			c.houseAddress = bi.getBuildingAddress();
			c.price = bi.getBuildingReferencePrice();
			c.houseId = bi.getBuildingId();
			List<String> lp = buildingPicDao.selectBuildingPicByBuildingId(c.houseId);
			if (lp.size() != 0)
				c.picUrl = lp.get(0);
			else c.picUrl = "";
			ret.add(c);
		}
		return ret;
	}
	
}
