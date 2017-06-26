package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.model.RentHouse;

public class RentHouseTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDao dao = (RentHouseDao) ac.getBean("rentHouseDao");
		RentHouse c = new RentHouse();
		c.setRentHouseAddress("632");
		c.setRentHousePrice(123);
		c.setRentHouseRoom(12);
		dao.insertRentHouse(c);
		c.setRentHouseRoom(6);
		dao.insertRentHouse(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDao dao = (RentHouseDao) ac.getBean("rentHouseDao");
		RentHouse c = new RentHouse();
		c.setRentHouseId(1);
		System.out.println(dao.deleteRentHouse(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDao dao = (RentHouseDao) ac.getBean("rentHouseDao");
		RentHouse c = new RentHouse();
		c.setRentHouseId(2);
		c.setRentHouseAddress("632技术小组");
		c.setRentHousePrice(123);
		c.setRentHouseRoom(12);
		System.out.println(dao.updateRentHouse(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDao dao = (RentHouseDao) ac.getBean("rentHouseDao");
		RentHouse c = new RentHouse();
		c.setRentHouseId(2);
		System.out.println(dao.selectRentHouse(c).getRentHouseAddress());
	}
}
