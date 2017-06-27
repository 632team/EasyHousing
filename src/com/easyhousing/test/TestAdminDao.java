package com.easyhousing.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.AdministratorDao;
import com.easyhousing.model.Administrator;


public class TestAdminDao {
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//��ʼ������
		AdministratorDao administratorDao = (AdministratorDao) ac.getBean("administratorDao");
		Administrator u = new Administrator();
		u.setAdministratorDepartment("��̨");
		u.setAdministratorName("fly");
		u.setAdministratorPassword("123456");
		u.setAdministratorSex("��");
		u.setAdministratorId(20141740);
		administratorDao.insertAdministrator(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//��ʼ������
		AdministratorDao administratorDao = (AdministratorDao) ac.getBean("administratorDao");
		Administrator u = new Administrator();
		u.setAdministratorDepartment("��̨");
		u.setAdministratorName("fly");
		u.setAdministratorPassword("123456");
		u.setAdministratorSex("��");
		u.setAdministratorId(0);
		administratorDao.deleteAdministrator(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//��ʼ������
		AdministratorDao administratorDao = (AdministratorDao) ac.getBean("administratorDao");
		Administrator u = new Administrator();
		u.setAdministratorDepartment("��̨");
		u.setAdministratorName("fly");
		u.setAdministratorPassword("1996511");
		u.setAdministratorSex("��");
		u.setAdministratorId(0);
		administratorDao.updateAdministrator(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//��ʼ������
		AdministratorDao administratorDao = (AdministratorDao) ac.getBean("administratorDao");
		Administrator u = new Administrator();
		u.setAdministratorDepartment("��̨");
		u.setAdministratorName("fly");
		u.setAdministratorPassword("1996511");
		u.setAdministratorSex("��");
		u.setAdministratorId(0);
		u = administratorDao.selectAdministrator(u);
		System.out.println(u.toString());
	}
	
	
}
