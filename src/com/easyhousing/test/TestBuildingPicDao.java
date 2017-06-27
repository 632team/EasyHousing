package com.easyhousing.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.model.BuildingPic;


public class TestBuildingPicDao {
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingPicDao buildingPicDao = (BuildingPicDao) ac.getBean("buildingPicDao");
		BuildingPic u = new BuildingPic();
		
		u.setBuildingId(2);
		u.setBuildingPicType("wai guan");
		u.setBuildingPicInsertTime(new Date());
		u.setBuildingPicUrl("17472189741289");
		
		buildingPicDao.insertBuildingPic(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingPicDao buildingPicDao = (BuildingPicDao) ac.getBean("buildingPicDao");
		BuildingPic u = new BuildingPic();
		
		u.setBuildingId(2);
		u.setBuildingPicType("nei zhi");
		u.setBuildingPicInsertTime(new Date());
		u.setBuildingPicUrl("17472189741289");
		
		buildingPicDao.updateBuildingPic(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingPicDao buildingPicDao = (BuildingPicDao) ac.getBean("buildingPicDao");
		BuildingPic u = new BuildingPic();
		
		u.setBuildingId(2);
		u.setBuildingPicType("wai guan");
		u.setBuildingPicInsertTime(new Date());
		u.setBuildingPicUrl("17472189741289");
		
		u = buildingPicDao.selectBuildingPic(u);
		
		System.out.println(u.getBuildingPicType());
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingPicDao buildingPicDao = (BuildingPicDao) ac.getBean("buildingPicDao");
		BuildingPic u = new BuildingPic();
		
		u.setBuildingId(2);
		u.setBuildingPicType("wai guan");
		u.setBuildingPicInsertTime(new Date());
		u.setBuildingPicUrl("17472189741289");
		
		buildingPicDao.deleteBuildingPic(u);
	}
}
