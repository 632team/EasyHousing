package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.RentHouseDealDao;
import com.easyhousing.model.RentHouseDeal;

public class RentHouseDealTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDealDao dao = (RentHouseDealDao) ac.getBean("rentHouseDealDao");
		RentHouseDeal c = new RentHouseDeal();
		c.setAgentId(1);
		c.setRentHouseId(1);
		c.setRentPrice(123123.1);
		c.setRentTime(new Date());
		c.setUserId(1);
		dao.insertRentHouseDeal(c);
		c.setRentTime(new Date());
		dao.insertRentHouseDeal(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDealDao dao = (RentHouseDealDao) ac.getBean("rentHouseDealDao");
		RentHouseDeal c = new RentHouseDeal();
		c.setRentId(1);
		System.out.println(dao.deleteRentHouseDeal(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDealDao dao = (RentHouseDealDao) ac.getBean("rentHouseDealDao");
		RentHouseDeal c = new RentHouseDeal();
		c.setRentId(2);
		c.setRentTime(new Date());
		System.out.println(dao.updateRentHouseDeal(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseDealDao dao = (RentHouseDealDao) ac.getBean("rentHouseDealDao");
		RentHouseDeal c = new RentHouseDeal();
		c.setRentId(2);
		System.out.println(dao.selectRentHouseDeal(c).getRentTime());
	}
}
