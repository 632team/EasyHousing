package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.OrderBuilding;

public interface OrderBuildingDao {
	public void insertOrderBuilding(OrderBuilding u);
	public int deleteOrderBuilding(OrderBuilding u);
	public int updateOrderBuilding(OrderBuilding u);
	public OrderBuilding selectOrderBuilding(OrderBuilding u);
	public List<OrderBuilding> selectAllByUserId(OrderBuilding u);
}
