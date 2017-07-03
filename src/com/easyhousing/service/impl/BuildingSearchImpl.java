package com.easyhousing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.service.BuildingSearch;

@Service("buildingSearch")
public class BuildingSearchImpl implements BuildingSearch {
	
	@Autowired
	private BuildingInfoDao buildingInfoDao;

	@Override
	public List<BuildingInfo> searchBuilding(String Address, int lowPrice, int highPrice) {
		return buildingInfoDao.selectBuilding(Address, lowPrice, highPrice);
	}

	@Override
	public BuildingInfo searchBuildingById(int id) {
		return buildingInfoDao.selectBuildingById(id);
	}

}
