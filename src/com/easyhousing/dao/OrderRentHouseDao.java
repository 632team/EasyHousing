package com.easyhousing.dao;

import java.util.List;

import com.easyhousing.model.OrderRentHouse;

public interface OrderRentHouseDao {
	public void insertOrderRentHouse(OrderRentHouse u);
	public int deleteOrderRentHouse(OrderRentHouse u);
	public int updateOrderRentHouse(OrderRentHouse u);
	public OrderRentHouse selectOrderRentHouse(OrderRentHouse u);
	public List<OrderRentHouse> selectAllByUserId(OrderRentHouse u);
}
