package com.easyhousing.test;

import java.util.Date;
import java.util.List;

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
		c.setRentHouseAddress("重庆市渝北区北城国际中心");
		c.setRentHousePrice(2500);
		c.setRentHouseArea(83);
		c.setRentHouseRoom(2);
		c.setRentHouseHall(1);
		c.setRentHouseToilet(1);
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
		c.setRentHouseAddress("632����С��");
		c.setRentHousePrice(123);
		c.setRentHouseRoom(12);
		System.out.println(dao.updateRentHouse(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDao dao = (RentHouseDao) ac.getBean("rentHouseDao");
		List<RentHouse> list;
		list = dao.selectRentHouse("渝北区", 0, 9999, 0, 9999);
		for(RentHouse i :list) {
			System.out.println(i.getRentHouseAddress());
		}
	}
}
