package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.UserDao;
import com.easyhousing.model.User;

public class UserTest {
	@Test
	public void insert() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		UserDao dao = (UserDao) ac.getBean("userDao");
		User c = new User();
		c.setUsername("gzy");
		c.setUserPassword("632");
		c.setUserPhoto("www.baidu.com");
		dao.insertUser(c);
		c.setUsername("ggggzzzzyyyy");
		dao.insertUser(c);
	}
	
	@Test
	public void delete() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		UserDao dao = (UserDao) ac.getBean("userDao");
		User c = new User();
		c.setUserId(1);
		System.out.println(dao.deleteUser(c));
	}
	
	@Test
	public void update() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		UserDao dao = (UserDao) ac.getBean("userDao");
		User c = new User();
		c.setUserId(2);
		c.setUsername("gzy");
		c.setUserPassword("632");
		c.setUserPhoto("www.baidu.com");
		System.out.println(dao.updateUser(c));
	}
	
	@Test
	public void select() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
		UserDao dao = (UserDao) ac.getBean("userDao");
		User c = new User();
		c.setUserId(2);
		System.out.println(dao.selectUserByUserId(c).getUsername());
	}
}
