package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.BuildingDealDao;
import com.easyhousing.model.BuildingDeal;


public class TestBuildingDealDao {
	
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingDealDao buildingDealDao = (BuildingDealDao) ac.getBean("buildingDealDao");
		BuildingDeal u = new BuildingDeal();
		u.setAgentId(2);
		u.setBuildingDealPerPrice(100);
		u.setBuildingDealTime(new Date());
		u.setBuildingDealTotalPrice(100);
		u.setBuildingId(1);
		u.setBuildingLayout("一室一厅");
		u.setUserId(1);
		buildingDealDao.insertBuildingDeal(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingDealDao buildingDealDao = (BuildingDealDao) ac.getBean("buildingDealDao");
		BuildingDeal u = new BuildingDeal();
		u.setAgentId(2);
		u.setBuildingDealPerPrice(100);
		u.setBuildingDealTime(new Date());
		u.setBuildingDealTotalPrice(100);
		u.setBuildingId(1);
		u.setBuildingLayout("两室一厅");
		u.setUserId(1);
		u.setBuildingDealId(1);
		buildingDealDao.updateBuildingDeal(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingDealDao buildingDealDao = (BuildingDealDao) ac.getBean("buildingDealDao");
		BuildingDeal u = new BuildingDeal();
		u.setAgentId(2);
		u.setBuildingDealPerPrice(100);
		u.setBuildingDealTime(new Date());
		u.setBuildingDealTotalPrice(100);
		u.setBuildingId(1);
		u.setBuildingLayout("111室一厅");
		u.setUserId(1);
		u.setBuildingDealId(1);
		u = buildingDealDao.selectBuildingDeal(u);
		System.out.println(u.getBuildingLayout());
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingDealDao buildingDealDao = (BuildingDealDao) ac.getBean("buildingDealDao");
		BuildingDeal u = new BuildingDeal();
		u.setAgentId(2);
		u.setBuildingDealPerPrice(100);
		u.setBuildingDealTime(new Date());
		u.setBuildingDealTotalPrice(100);
		u.setBuildingId(1);
		u.setBuildingLayout("111室一厅");
		u.setUserId(1);
		u.setBuildingDealId(1);
		buildingDealDao.deleteBuildingDeal(u);
		System.out.println(u.getBuildingLayout());
	}

}
