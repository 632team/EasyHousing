package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.BuyHouseCommentDao;
import com.easyhousing.model.BuyHouseComment;


public class TestBuyHouseCommentDao {
	
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuyHouseCommentDao buyHouseCommentDao = (BuyHouseCommentDao) ac.getBean("buyHouseCommentDao");
		BuyHouseComment u = new BuyHouseComment();
		
		u.setBuildingId(2);
		u.setUserComment("excellent!");
		u.setUserId(1);
		u.setUserCommentDate(new Date());
		
		buyHouseCommentDao.insertBuyHouseComment(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuyHouseCommentDao buyHouseCommentDao = (BuyHouseCommentDao) ac.getBean("buyHouseCommentDao");
		BuyHouseComment u = new BuyHouseComment();
		
		u.setBuildingId(2);
		u.setUserComment("la ji!");
		u.setUserId(1);
		u.setUserCommentDate(new Date());
		u.setBuyHouseCommentId(1);
		
		buyHouseCommentDao.updateBuyHouseComment(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuyHouseCommentDao buyHouseCommentDao = (BuyHouseCommentDao) ac.getBean("buyHouseCommentDao");
		BuyHouseComment u = new BuyHouseComment();
		
		u.setBuildingId(2);
		u.setUserComment("excllent!");
		u.setUserId(1);
		u.setUserCommentDate(new Date());
		u.setBuyHouseCommentId(1);
		
		u = buyHouseCommentDao.selectBuyHouseComment(u);
		
		System.out.println(u.getUserComment());
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuyHouseCommentDao buyHouseCommentDao = (BuyHouseCommentDao) ac.getBean("buyHouseCommentDao");
		BuyHouseComment u = new BuyHouseComment();
		
		u.setBuildingId(2);
		u.setUserComment("excllent!");
		u.setUserId(1);
		u.setUserCommentDate(new Date());
		u.setBuyHouseCommentId(1);
		
		buyHouseCommentDao.deleteBuyHouseComment(u);
		
		System.out.println(u.getUserComment());
	}
}
