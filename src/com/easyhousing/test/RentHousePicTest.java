package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.model.RentHousePic;

public class RentHousePicTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHousePicDao dao = (RentHousePicDao) ac.getBean("rentHousePicDao");
		RentHousePic c = new RentHousePic();
		c.setInsertTime(new Date());
		c.setPicUrl("www.baidu¡£com");
		c.setRentHouseId(1);
		dao.insertRentHousePic(c);
		c.setPicUrl("www.dubai.cn");
		dao.insertRentHousePic(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHousePicDao dao = (RentHousePicDao) ac.getBean("rentHousePicDao");
		RentHousePic c = new RentHousePic();
		c.setRentHousePicId(1);
		System.out.println(dao.deleteRentHousePic(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHousePicDao dao = (RentHousePicDao) ac.getBean("rentHousePicDao");
		RentHousePic c = new RentHousePic();
		c.setPicUrl("www.baidu¡£com");
		c.setInsertTime(new Date());
		c.setRentHousePicId(2);
		System.out.println(dao.updateRentHousePic(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHousePicDao dao = (RentHousePicDao) ac.getBean("rentHousePicDao");
		RentHousePic c = new RentHousePic();
		c.setRentHousePicId(2);
		System.out.println(dao.selectRentHousePic(c).getPicUrl());
	}
}
