package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.Deal;
import com.easyhousing.model.User;

public interface DealService {
	public List<Deal> selectAllBuildingDeal(User u);
	public List<Deal> selectAllRentHouseDeal(User u);
}
