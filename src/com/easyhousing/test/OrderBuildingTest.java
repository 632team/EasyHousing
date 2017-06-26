package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.OrderBuildingDao;
import com.easyhousing.model.OrderBuilding;

public class OrderBuildingTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderBuildingDao dao = (OrderBuildingDao) ac.getBean("orderBuildingDao");
		OrderBuilding c = new OrderBuilding();
		c.setAgentId(1);
		c.setBuildingId(1);
		c.setOrderStatus("未处理");
		c.setOrderTime(new Date());
		c.setUserId(1);
		c.setUserPhoneNumber("18059xxxxxx");
		dao.insertOrderBuilding(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderBuildingDao dao = (OrderBuildingDao) ac.getBean("orderBuildingDao");
		OrderBuilding c = new OrderBuilding();
		c.setOrderId(1);
		System.out.println(dao.deleteOrderBuilding(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderBuildingDao dao = (OrderBuildingDao) ac.getBean("orderBuildingDao");
		OrderBuilding c = new OrderBuilding();
		c.setOrderId(2);
		c.setAgentId(1);
		c.setBuildingId(1);
		c.setOrderStatus("未处理");
		c.setOrderTime(new Date());
		c.setUserId(1);
		c.setUserPhoneNumber("18059xxxxxx");
		System.out.println(dao.updateOrderBuilding(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		OrderBuildingDao dao = (OrderBuildingDao) ac.getBean("orderBuildingDao");
		OrderBuilding c = new OrderBuilding();
		c.setOrderId(2);
		System.out.println(dao.selectOrderBuilding(c).getOrderTime());
	}
}
