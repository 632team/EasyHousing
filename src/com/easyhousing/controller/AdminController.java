package com.easyhousing.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.AdministratorDao;
import com.easyhousing.model.Administrator;
import com.easyhousing.model.User;
import com.easyhousing.service.UserService;
import com.easyhousing.util.Tool;

/**
 * 
 * @author 王辰辰
 * 用户登录以及增删改查
 */

@Controller
public class AdminController {
	
	@Autowired
	private AdministratorDao administratorDao;
	
	@Autowired
	private UserService userService;
	
	//用户登录
	@RequestMapping(value="adminLogin.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(Administrator u, HttpSession httpSession) {
		ModelAndView modelAndView = new ModelAndView();
		
		//没有输入
		if (u.getAdministratorName() == null && u.getAdministratorPassword() == null) {
			modelAndView.setViewName("logIn");
			return modelAndView;
		}
		//查看用户是否存在
		Administrator adminuser = administratorDao.selectAdministrator(u);
		if (adminuser == null) {
			modelAndView.addObject("message", "登录失败，用户名或密码错误！");
			modelAndView.setViewName("logIn");
		}
		else {
			//modelAndView.addObject("message", ");
			httpSession.setAttribute("adminuser", adminuser);
			modelAndView.setViewName("SystemUser/homepage");
		}
		return modelAndView;
	}
	
	//添加用户
	@RequestMapping(value = "adminAddUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminAddUser(HttpServletRequest request, User u) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		//设置默认头像
		u.setUserPhoto("http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png");

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
			u.setUserPhoto(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
		} catch (Exception e) {
			
		}
		
		User user = userService.selectUserByName(u);
		System.err.println("用户性别");
		System.err.println(u.getUserSex());
		if (session.getAttribute("addFail") == null)
			session.setAttribute("addFail", 0);
		if (user == null) {
			userService.insertUser(u);
			session.setAttribute("addFail", 0);
		} else {
			session.setAttribute("addFail", 1);
		}
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userList", userList);
		modelAndView.setViewName("SystemUser/managerUser");
		return modelAndView;
	}
	
	@RequestMapping(value = "adminUpdateUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminUpdateUser(HttpServletRequest request, User u) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//设置默认头像
		u.setUserPhoto("http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png");
		
		//获取更改的id
		int updateUserId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("updateUserId")) {
				updateUserId = Integer.parseInt(value);
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
			u.setUserPhoto(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
		} catch (Exception e) {
		}
		
		//更新用户
		u.setUserId(updateUserId);
		userService.updateUser(u);
		System.err.println("用户性别update");
		System.err.println(u.getUserSex());
		if (session.getAttribute("addFail") == null)
			session.setAttribute("addFail", 0);
		
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userList", userList);
		modelAndView.setViewName("SystemUser/managerUser");
		return modelAndView;
	}
	
	//删除用户
	@RequestMapping(value = "deleteUserAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteUserAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		//获取删除的id
		int userId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("userId")) {
				userId = Integer.parseInt(value);
			}
		}
		
		//删除
		User u = new User();
		u.setUserId(userId);
		userService.delete(u);
		
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userList", userList);
	}
	
	//批量删除
	@RequestMapping(value = "deleteUserPartAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteUserPartAjax(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		
		///获取批量删除的id
		String deletePart = "";
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("deletePart")) {
				deletePart = value;
			}
		}
		
		//分解字符串
		System.err.println(deletePart);
		String[] ids = deletePart.split("\\.");
		
		//删除
		User u = new User();
		for(String iString : ids) {
			if(iString == null) continue;
			if(iString == "") continue;
			System.err.println(iString);
			u.setUserId(Integer.parseInt(iString));
			userService.delete(u);
		}
		
		List<User> userList = userService.selectAllUser();
		session.setAttribute("userList", userList);
	}
}
