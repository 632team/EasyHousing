package com.easyhousing.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.easyhousing.dao.OrderRentHouseDao;
import com.easyhousing.model.OrderRentHouse;

/**
 * 
 * @author 王辰辰
 * 插入租房信息
 */
@Controller
public class RentHouseController {
	
	@Autowired
	private OrderRentHouseDao orderRentHouseDao;
	
	@RequestMapping(value="rentHouse.do", method={RequestMethod.GET,RequestMethod.POST})
	public String rentHouse() {
		return "rentWindow";
	}
	
	//插入租房信息
	@RequestMapping(value="sendRentHouseOrder.do", method={RequestMethod.GET,RequestMethod.POST})
	public String sendRentHouseOrder(@RequestParam(value ="date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date, OrderRentHouse u) {
		u.setOrderTime(date);
		orderRentHouseDao.insertOrderRentHouse(u);
		return "rentWindow";
	}
}
