package com.easyhousing.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.CommunityDao;
import com.easyhousing.model.Community;

public class CommunityTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		CommunityDao dao = (CommunityDao) ac.getBean("communityDao");
		Community c = new Community();
		c.setcommunityPrice(12.5f);
		c.setCommunityName("632小区");
		dao.insertCommunity(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		CommunityDao dao = (CommunityDao) ac.getBean("communityDao");
		Community c = new Community();
		c.setCommunityId(1);
		System.out.println(dao.deleteCommunity(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		CommunityDao dao = (CommunityDao) ac.getBean("communityDao");
		Community c = new Community();
		c.setCommunityId(2);
		c.setCommunityName("66666小区");
		System.out.println(dao.updateCommunity(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		CommunityDao dao = (CommunityDao) ac.getBean("communityDao");
		Community c = new Community();
		c.setCommunityId(2);
		System.out.println(dao.selectCommunity(c).getCommunityName());
	}
}
