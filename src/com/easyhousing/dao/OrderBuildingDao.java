package com.easyhousing.dao;

import com.easyhousing.model.OrderBuilding;

public interface OrderBuildingDao {
	public void insertOrderBuilding(OrderBuilding u);
	public int deleteOrderBuilding(OrderBuilding u);
	public int updateOrderBuilding(OrderBuilding u);
	public OrderBuilding selectOrderBuilding(OrderBuilding u);
}
