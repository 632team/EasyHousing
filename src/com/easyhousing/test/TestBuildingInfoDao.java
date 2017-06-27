package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.BuildingInfoDao;
import com.easyhousing.model.BuildingInfo;

public class TestBuildingInfoDao {
	
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingInfoDao buildingInfoDao = (BuildingInfoDao) ac.getBean("buildingInfoDao");
		BuildingInfo u = new BuildingInfo();
		u.setBuildingAddress("CQU");
		u.setBuildingDecoration("jing xiu");
		u.setBuildingMaxArea(111);
		u.setBuildingMinArea(110);
		u.setBuildingName("mei yuan");
		u.setBuildingNeighbourhood("huxi");
		u.setBuildingReferencePrice(1);
		u.setBuildingSaleState("you");
		u.setBuildingTimeHanded(new Date());
		
		buildingInfoDao.insertBuildingInfo(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingInfoDao buildingInfoDao = (BuildingInfoDao) ac.getBean("buildingInfoDao");
		BuildingInfo u = new BuildingInfo();
		u.setBuildingAddress("CQU");
		u.setBuildingDecoration("jing xiu");
		u.setBuildingMaxArea(111);
		u.setBuildingMinArea(110);
		u.setBuildingName("mei yuan");
		u.setBuildingNeighbourhood("huxi");
		u.setBuildingReferencePrice(1);
		u.setBuildingSaleState("me");
		u.setBuildingId(1); //****************************
		u.setBuildingTimeHanded(new Date());
		
		buildingInfoDao.updateBuildingInfo(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingInfoDao buildingInfoDao = (BuildingInfoDao) ac.getBean("buildingInfoDao");
		BuildingInfo u = new BuildingInfo();
		u.setBuildingAddress("CQU");
		u.setBuildingDecoration("jing xiu");
		u.setBuildingMaxArea(111);
		u.setBuildingMinArea(110);
		u.setBuildingName("mei yuan");
		u.setBuildingNeighbourhood("huxi");
		u.setBuildingReferencePrice(1);
		u.setBuildingSaleState("you");
		u.setBuildingId(1); //****************************
		u.setBuildingTimeHanded(new Date());
		
		u = buildingInfoDao.selectBuildingInfo(u);
		
		System.out.println(u.getBuildingSaleState());
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingInfoDao buildingInfoDao = (BuildingInfoDao) ac.getBean("buildingInfoDao");
		BuildingInfo u = new BuildingInfo();
		u.setBuildingAddress("CQU");
		u.setBuildingDecoration("jing xiu");
		u.setBuildingMaxArea(111);
		u.setBuildingMinArea(110);
		u.setBuildingName("mei yuan");
		u.setBuildingNeighbourhood("huxi");
		u.setBuildingReferencePrice(1);
		u.setBuildingSaleState("you");
		u.setBuildingId(1); //****************************
		u.setBuildingTimeHanded(new Date());
		
		buildingInfoDao.deleteBuildingInfo(u);
		
		System.out.println(u.getBuildingSaleState());
	}

}
