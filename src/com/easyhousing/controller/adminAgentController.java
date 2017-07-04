package com.easyhousing.controller;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.AgentDao;
import com.easyhousing.model.Agent;
import com.easyhousing.model.User;
import com.easyhousing.util.Tool;

@Controller
public class adminAgentController {

	@Autowired
	private AgentDao agentDao;
	
	@RequestMapping(value="adminAddAgent.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminAddAgent(HttpServletRequest request, Agent agent) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		agent.setPicUrl("http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png");

		try {
			// 得到文件
			String path = request.getSession().getServletContext().getRealPath("upload");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			MultipartFile file = multiRequest.getFile(iter.next().toString());
			String fileName = file.getOriginalFilename();
			File dir = new File(path, fileName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			// MultipartFile自带的解析方法
			file.transferTo(dir);
			
			String filePath = path + "\\" + fileName;
			System.err.println(filePath);
			String name = new Date().toInstant().toString();
			new Tool().upload(filePath, name);
			agent.setPicUrl(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
		} catch (Exception e) {
			
		}
		
		agentDao.insertAgent(agent);
		
		List<Agent> agentList = agentDao.selectAll();
		session.setAttribute("agentList", agentList);
		
		modelAndView.setViewName("SystemUser/managerAgent");
		return modelAndView;
	}
	
	@RequestMapping(value="adminUpdateAgent.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateAgent(HttpServletRequest request, Agent agent) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		int updateAgentId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("updateAgentId")) {
				updateAgentId = Integer.parseInt(value);
			}
		}
		
		try {
			// 得到文件
			String path = request.getSession().getServletContext().getRealPath("upload");
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			MultipartFile file = multiRequest.getFile(iter.next().toString());
			String fileName = file.getOriginalFilename();
			File dir = new File(path, fileName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			// MultipartFile自带的解析方法
			file.transferTo(dir);
			String filePath = path + "\\" + fileName;
			System.err.println(filePath);
			String name = new Date().toInstant().toString();
			new Tool().upload(filePath, name);
			agent.setPicUrl(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
		} catch (Exception e) {
			
		}
		
		agent.setAgentId(updateAgentId);
		agentDao.updateAgent(agent);
		
		List<Agent> agentList = agentDao.selectAll();
		session.setAttribute("agentList", agentList);
		
		modelAndView.setViewName("SystemUser/managerAgent");
		return modelAndView;
	}
	
	@RequestMapping(value = "deleteAgentAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteAgentAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int deleteAgentId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteAgentId")) {
				deleteAgentId = Integer.parseInt(value);
			}
		}

		Agent agent = new Agent();
		agent.setAgentId(deleteAgentId);
		
		agentDao.deleteAgent(agent);
		
		List<Agent> agentList = agentDao.selectAll();
		session.setAttribute("agentList", agentList);
	}
	
	@RequestMapping(value = "deleteAgentPartAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteAgentPartAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		String deleteAgentPart = "";
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deleteAgentPart")) {
				deleteAgentPart = value;
			}
		}
		System.err.println(deleteAgentPart);
		String[] ids = deleteAgentPart.split("\\.");
		Agent agent = new Agent();
		for(String iString : ids) {
			if(iString == null) continue;
			if(iString == "") continue;
			System.err.println(iString);
			agent.setAgentId(Integer.parseInt(iString));
			agentDao.deleteAgent(agent);
		}
		
		List<Agent> agentList = agentDao.selectAll();
		session.setAttribute("agentList", agentList);
	}
	
}
