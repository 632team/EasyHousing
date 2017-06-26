package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.RentHouseCommentDao;
import com.easyhousing.model.RentHouseComment;

public class RentHouseCommentTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseCommentDao dao = (RentHouseCommentDao) ac.getBean("rentHouseCommentDao");
		RentHouseComment c = new RentHouseComment();
		c.setRentHouseId(1);
		c.setUserId(1);
		c.setUserComment("ºÜºÃ");
		c.setUserCommentDate(new Date());
		dao.insertRentHouseComment(c);
		c.setUserCommentDate(new Date());
		c.setUserComment("À¬»ø");
		dao.insertRentHouseComment(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseCommentDao dao = (RentHouseCommentDao) ac.getBean("rentHouseCommentDao");
		RentHouseComment c = new RentHouseComment();
		c.setRentHouseCommentId(1);
		System.out.println(dao.deleteRentHouseComment(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseCommentDao dao = (RentHouseCommentDao) ac.getBean("rentHouseCommentDao");
		RentHouseComment c = new RentHouseComment();
		c.setRentHouseCommentId(2);
		c.setUserComment("5ÐÇºÃÆÀ");
		c.setUserCommentDate(new Date());
		System.out.println(dao.updateRentHouseComment(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		RentHouseCommentDao dao = (RentHouseCommentDao) ac.getBean("rentHouseCommentDao");
		RentHouseComment c = new RentHouseComment();
		c.setRentHouseCommentId(2);
		System.out.println(dao.selectRentHouseComment(c).getUserComment());
	}
}
