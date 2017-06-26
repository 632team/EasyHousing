package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.OrderRentHouseDao;
import com.easyhousing.model.OrderRentHouse;

public class OrderRentHouseTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderRentHouseDao dao = (OrderRentHouseDao) ac.getBean("orderRentHouseDao");
		OrderRentHouse c = new OrderRentHouse();
		c.setAgentId(1);
		c.setRentHouseId(1);
		c.setOrderStatus("未处理");
		c.setOrderTime(new Date());
		c.setUserId(1);
		c.setUserPhoneNumber("18059xxxxxx");
		dao.insertOrderRentHouse(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderRentHouseDao dao = (OrderRentHouseDao) ac.getBean("orderRentHouseDao");
		OrderRentHouse c = new OrderRentHouse();
		c.setOrderId(1);
		System.out.println(dao.deleteOrderRentHouse(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderRentHouseDao dao = (OrderRentHouseDao) ac.getBean("orderRentHouseDao");
		OrderRentHouse c = new OrderRentHouse();
		c.setOrderId(2);
		c.setAgentId(1);
		c.setRentHouseId(1);
		c.setOrderStatus("未处理");
		c.setOrderTime(new Date());
		c.setUserId(1);
		c.setUserPhoneNumber("18059xxxxxx");
		System.out.println(dao.updateOrderRentHouse(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderRentHouseDao dao = (OrderRentHouseDao) ac.getBean("orderRentHouseDao");
		OrderRentHouse c = new OrderRentHouse();
		c.setOrderId(2);
		System.out.println(dao.selectOrderRentHouse(c).getOrderTime());
	}
}
