package com.easyhousing.test;


import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.easyhousing.dao.AgentDao;
import com.easyhousing.model.Agent;

public class TestAgentDao {
	
	@Test
	public void Test1(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//³õÊ¼»¯ÈÝÆ÷
		AgentDao agentDao = (AgentDao) ac.getBean("agentDao");
		Agent u = new Agent();
		u.setAgentName("sbgzy");
		u.setAgentEmail("1231231@qq.com");
		u.setAgentPhoneNumber("123124214");
		u.setAgentSex("ÄÐ");
		u.setPicUrl("1212421");
		agentDao.insertAgent(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//³õÊ¼»¯ÈÝÆ÷
		AgentDao agentDao = (AgentDao) ac.getBean("agentDao");
		Agent u = new Agent();
		u.setAgentName("sbgzy");
		u.setAgentEmail("1231231@qq.com");
		u.setAgentPhoneNumber("123124214");
		u.setAgentSex("ÄÐ");
		u.setPicUrl("1212421");
		u.setAgentId(1);
		agentDao.deleteAgent(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test3(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//³õÊ¼»¯ÈÝÆ÷
		AgentDao agentDao = (AgentDao) ac.getBean("agentDao");
		Agent u = new Agent();
		u.setAgentName("sbgzy");
		u.setAgentEmail("1231231@qq.com");
		u.setAgentPhoneNumber("123124214");
		u.setAgentSex("ÄÐ");
		u.setPicUrl("1421");
		u.setAgentId(2);
		agentDao.updateAgent(u);
		System.out.println("-------");
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");//³õÊ¼»¯ÈÝÆ÷
		AgentDao agentDao = (AgentDao) ac.getBean("agentDao");
		Agent u = new Agent();
		u.setAgentName("sbgzy");
		u.setAgentEmail("1231231@qq.com");
		u.setAgentPhoneNumber("123124214");
		u.setAgentSex("ÄÐ");
		u.setPicUrl("1421");
		u.setAgentId(2);
		u = agentDao.selectAgent(u);
		System.out.println(u.getAgentName());
	}
}
