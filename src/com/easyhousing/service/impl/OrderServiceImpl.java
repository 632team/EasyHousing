package com.easyhousing.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.*;
import com.easyhousing.model.*;
import com.easyhousing.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderBuildingDao orderBuildingDao;
	@Autowired
	OrderRentHouseDao orderRentHouseDao;
	@Autowired
	AgentDao agentDao;
	@Autowired
	BuildingInfoDao buildingInfoDao;
	@Autowired
	RentHouseDao rentHouseDao;
	
	// Order记录网页所需展示的信息
	@Override
	public List<Order> selectAllBuildingByUserId(User u) {
		OrderBuilding o = new OrderBuilding();
		o.setUserId(u.getUserId());
		List<OrderBuilding> li = orderBuildingDao.selectAllByUserId(o);
		List<Order> res = new ArrayList<>();
		for (OrderBuilding i: li) {
			Order temp = new Order();
			temp.orderTime = i.getOrderTime();
			temp.phoneNumber = i.getUserPhoneNumber();
			temp.status = i.getOrderStatus();
			temp.userName = u.getUsername();
			temp.id = i.getOrderId();
			
			Agent a = new Agent();
			a.setAgentId(i.getAgentId());
			temp.agentName = agentDao.selectAgent(a).getAgentName();
			
			BuildingInfo b = new BuildingInfo();
			b.setBuildingId(i.getBuildingId());
			b = buildingInfoDao.selectBuildingInfo(b);
			temp.address = b.getBuildingAddress();
			temp.name = b.getBuildingName();
			
			res.add(temp);
		}
		return res;
	}
	
	// Order记录网页所需展示的信息
	@Override
	public List<Order> selectAllRentHouseByUserId(User u) {
		OrderRentHouse o = new OrderRentHouse();
		o.setUserId(u.getUserId());
		List<OrderRentHouse> li = orderRentHouseDao.selectAllByUserId(o);
		List<Order> res = new ArrayList<>();
		for (OrderRentHouse i: li) {
			Order temp = new Order();
			temp.orderTime = i.getOrderTime();
			temp.phoneNumber = i.getUserPhoneNumber();
			temp.status = i.getOrderStatus();
			temp.userName = u.getUsername();
			temp.id = i.getRentHouseId();
			
			Agent a = new Agent();
			a.setAgentId(i.getAgentId());
			if (agentDao.selectAgent(a) != null)
				temp.agentName = agentDao.selectAgent(a).getAgentName();
			else {
				temp.agentName = "无";
			}
			
			temp.address = rentHouseDao.selectRentHouseById(i.getRentHouseId()).getRentHouseAddress();
			
			res.add(temp);
		}
		return res;
	}

}
