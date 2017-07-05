package com.easyhousing.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.AgentDao;
import com.easyhousing.dao.BuildingDealDao;
import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHouseDealDao;
import com.easyhousing.model.Agent;
import com.easyhousing.model.BuildingDeal;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.Deal;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHouseDeal;
import com.easyhousing.model.User;
import com.easyhousing.service.DealService;

@Service("dealService")
public class DealServiceImpl implements DealService {
	
	@Autowired
	private BuildingDealDao buildingDealDao;
	@Autowired
	private BuildingInfoDao buildingInfoDao;
	
	@Autowired
	private RentHouseDealDao rentHouseDealDao;
	@Autowired
	private RentHouseDao rentHouseDao;
	
	@Autowired
	private AgentDao agentDao;
	
	// Deal记录各种id对应的信息，用于后期的网页显示
	@Override
	public List<Deal> selectAllBuildingDeal(User u) {
		List<BuildingDeal> li = buildingDealDao.selectAllByUserId(u.getUserId());
		List<Deal> ret = new ArrayList<>();
		for (BuildingDeal i : li) {
			Deal d = new Deal();
			d.date = i.getBuildingDealTime();
			d.dealId = i.getBuildingDealId();
			d.layout = i.getBuildingLayout();
			d.perPrice = i.getBuildingDealPerPrice();
			d.tolPrice = i.getBuildingDealTotalPrice();
			
			BuildingInfo tmp = new BuildingInfo();
			tmp.setBuildingId(i.getBuildingId());
			d.name = buildingInfoDao.selectBuildingInfo(tmp).getBuildingName();
			
			Agent a = new Agent();
			a.setAgentId(i.getAgentId());
			a = agentDao.selectAgent(a);
			d.agentName = a.getAgentName();
			d.agentPhone = a.getAgentPhoneNumber();
			
			ret.add(d);
		}
		return ret;
	}
	
	// Deal记录各种id对应的信息，用于后期的网页显示
	@Override
	public List<Deal> selectAllRentHouseDeal(User u) {
		List<RentHouseDeal> li = rentHouseDealDao.selectAllByUserId(u.getUserId());
		List<Deal> ret = new ArrayList<>();
		for (RentHouseDeal i : li) {
			Deal d = new Deal();
			d.date = i.getRentTime();;
			d.dealId = i.getRentId();
			d.rentDays = i.getRentHouseDay();
			d.tolPrice = (int)i.getRentPrice();
			
			d.name = rentHouseDao.selectRentHouseById(i.getRentHouseId()).getRentHouseAddress();
			
			Agent a = new Agent();
			a.setAgentId(i.getAgentId());
			a = agentDao.selectAgent(a);
			d.agentName = a.getAgentName();
			d.agentPhone = a.getAgentPhoneNumber();
			
			ret.add(d);
		}
		return ret;
	}

}
