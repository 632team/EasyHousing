package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.Deal;
import com.easyhousing.model.User;
/**
 * 交易记录相关服务
 */
public interface DealService {
	public List<Deal> selectAllBuildingDeal(User u);
	public List<Deal> selectAllRentHouseDeal(User u);
}
