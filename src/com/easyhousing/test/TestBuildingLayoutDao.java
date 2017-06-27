package com.easyhousing.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.BuildingLayoutDao;
import com.easyhousing.model.BuildingLayout;


public class TestBuildingLayoutDao {
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingLayoutDao buildingLayoutDao = (BuildingLayoutDao) ac.getBean("buildingLayoutDao");
		BuildingLayout u = new BuildingLayout();
		
		u.setBuildingId(2);
		u.setBuildingLayout("一室一厅");
		u.setBuildingLayoutPerPrice(1);
		u.setBuildingLayoutPicUrl("2112512");
		u.setBuildingLayoutReferencePrice(1);
		u.setBuildingLayoutSoldOut(1);
		
		buildingLayoutDao.insertBuildingLayout(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingLayoutDao buildingLayoutDao = (BuildingLayoutDao) ac.getBean("buildingLayoutDao");
		BuildingLayout u = new BuildingLayout();
		
		u.setBuildingId(2);
		u.setBuildingLayout("一室一厅");
		u.setBuildingLayoutPerPrice(2);
		u.setBuildingLayoutPicUrl("2112512");
		u.setBuildingLayoutReferencePrice(2);
		u.setBuildingLayoutSoldOut(2);
		
		buildingLayoutDao.updateBuildingLayout(u);
		
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingLayoutDao buildingLayoutDao = (BuildingLayoutDao) ac.getBean("buildingLayoutDao");
		BuildingLayout u = new BuildingLayout();
		
		u.setBuildingId(2);
		u.setBuildingLayout("一室一厅");
		u.setBuildingLayoutPerPrice(1);
		u.setBuildingLayoutPicUrl("2112512");
		u.setBuildingLayoutReferencePrice(1);
		u.setBuildingLayoutSoldOut(1);
		
		u = buildingLayoutDao.selectBuildingLayout(u);
		
		System.out.println(u.getBuildingLayoutPerPrice());
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		BuildingLayoutDao buildingLayoutDao = (BuildingLayoutDao) ac.getBean("buildingLayoutDao");
		BuildingLayout u = new BuildingLayout();
		
		u.setBuildingId(2);
		u.setBuildingLayout("一室一厅");
		u.setBuildingLayoutPerPrice(1);
		u.setBuildingLayoutPicUrl("2112512");
		u.setBuildingLayoutReferencePrice(1);
		u.setBuildingLayoutSoldOut(1);
		
		buildingLayoutDao.deleteBuildingLayout(u);
		
		System.out.println(u.getBuildingLayoutPerPrice());
	}
}
