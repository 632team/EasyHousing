package com.easyhousing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.easyhousing.dao.RentHouseDao;
import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.dao.RentHouse_CharacteristicsDao;
import com.easyhousing.dao.UserCollectBuildingDao;
import com.easyhousing.model.Application;
import com.easyhousing.model.Collect;
import com.easyhousing.model.Deal;
import com.easyhousing.model.Order;
import com.easyhousing.model.Register;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHousePic;
import com.easyhousing.model.RentHouse_Characteristics;
import com.easyhousing.model.User;
import com.easyhousing.model.UserCollectBuilding;
import com.easyhousing.service.CommentService;
import com.easyhousing.service.DealService;
import com.easyhousing.service.OrderService;
import com.easyhousing.service.RentHouseCollect;
import com.easyhousing.service.UserCollectService;
import com.easyhousing.service.UserService;
import com.easyhousing.util.Tool;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserCollectBuildingDao userCollectBuildingDao;
	
	@Autowired
	private UserCollectService userCollectService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private DealService dealService;
	
	@Autowired
	private RentHouseDao rentHouseDao;
	
	@Autowired
	private RentHouse_CharacteristicsDao rentHouse_CharacteristicsDao;
	
	@Autowired
	private RentHousePicDao rentHousePicDao;
	
	@Autowired
	private RentHouseCollect rentHouseCollect;
	
	@RequestMapping(value="login.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(User u, HttpSession httpSession) {
		ModelAndView modelAndView = new ModelAndView();
		if (u.getUsername() == null && u.getUserPassword() == null) {
			modelAndView.setViewName("logIn");
			return modelAndView;
		}
		User user = userService.login(u);
		if (user == null) {
			modelAndView.addObject("message", "登录失败，用户名或密码错误！");
			modelAndView.setViewName("logIn");
		}
		else {
			//modelAndView.addObject("message", ");
			httpSession.setAttribute("user", user);
			modelAndView.setViewName("homepage");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "register.do", method={RequestMethod.GET,RequestMethod.POST}, produces = "text/html; charset=utf-8")
    public ModelAndView register(HttpServletRequest request, Register u) {
		ModelAndView modelAndView = new ModelAndView();
		
		String username = u.getUsername();
		String userPassword = u.getUserPassword();
		String confirmPassword = u.getConfirmPassword();
		
		modelAndView.addObject("username", username);
		modelAndView.addObject("userPassword", userPassword);
		modelAndView.addObject("confirmPassword", confirmPassword);
		modelAndView.addObject("registerValidateCode", u.getRegisterValidateCode());
		
		String correctValidateCode = (String)request.getSession().getAttribute("validateCode");
		if(!correctValidateCode.equals(u.getRegisterValidateCode())) {
			modelAndView.addObject("failuremessage", "验证码错误！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		if(username == null || username.length() < 5) {
			modelAndView.addObject("failuremessage", "用户名至少为五位！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		if(userPassword == null || confirmPassword == null) {
			modelAndView.addObject("failuremessage", "请输入密码！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		if(!userPassword.equals(confirmPassword)) {
			modelAndView.addObject("failuremessage", "密码不一致！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		boolean ok = true;
		for(int i = 0; i < username.length(); i++) {
			if(username.charAt(i) >= 'a' && username.charAt(i) <= 'z') continue;
			if(username.charAt(i) >= 'A' && username.charAt(i) <= 'Z') continue;
			if(username.charAt(i) >= '0' && username.charAt(i) <= '9') continue;
			ok = false; break;
		}
		if(!ok) {
			modelAndView.addObject("failuremessage", "密码只由大小字母及数字组成！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		
		User nowu = new User();
		nowu.setUsername(u.getUsername());
		nowu.setUserPassword(u.getUserPassword());
		nowu.setUserPhoto("http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png");
		
		User user = userService.login(nowu);
		if (user == null) {
			userService.insertUser(nowu);
			modelAndView.addObject("message", "注册成功！");
			modelAndView.setViewName("logIn");
			return modelAndView;
		}
		else {
			modelAndView.addObject("failuremessage", "注册失败，已存在用户名！");
			modelAndView.setViewName("register");
			return modelAndView;
		}
    }
	
	@RequestMapping(value="userCenter.do", method={RequestMethod.GET,RequestMethod.POST})
	public String userCenter(HttpSession s) {
		User user = (User) s.getAttribute("user");
		
		// 我的收藏
		List<Collect> userCollectBuilding = userCollectService.selectUserCollectBuilding(user);
		List<Collect> userCollectRentHouse = userCollectService.selectUserCollectRentHouse(user);
		s.setAttribute("userCollectBuilding", userCollectBuilding);
		s.setAttribute("userCollectRentHouse", userCollectRentHouse);
		
		// 我的房子
		List<RentHouse_Characteristics> rentHouse_Characteristics = rentHouse_CharacteristicsDao.selectAllByUserId(user.getUserId());
		List<Application> rentHouseApplication = new ArrayList<>();
		for (RentHouse_Characteristics i: rentHouse_Characteristics) {
			RentHouse tmp = rentHouseDao.selectRentHouseById(i.getRentHouseId());
			Application in = new Application();
			in.date = tmp.getRentHousePublishTime();
			in.address = tmp.getRentHouseAddress();
			in.houseId = tmp.getRentHouseId();
			in.phone = user.getUserPhoneNumber();
			in.hall = tmp.getRentHouseHall();
			in.room = tmp.getRentHouseRoom();
			in.toilet = tmp.getRentHouseToilet();
			in.price = tmp.getRentHousePrice();
			rentHouseApplication.add(in);
		}
		s.setAttribute("rentHouseApplication", rentHouseApplication);
		
		// 我的评论
		List<Collect> rentHouseComment = commentService.selectAllRentHouseCommentByUserId(user);
		List<Collect> buyHouseComment = commentService.selectAllBuildingCommentByUserId(user);
		s.setAttribute("rentHouseComment", rentHouseComment);
		s.setAttribute("buyHouseComment", buyHouseComment);
		
		// 我的申请
		// List<Order> orderBuilding = orderService.selectAllBuildingByUserId(user);
//		List<Order> orderRentHouse = orderService.selectAllRentHouseByUserId(user);
//		s.setAttribute("orderBuilding", orderBuilding);
//		s.setAttribute("orderRentHouse", orderRentHouse);
		
		// 成交记录
		List<Deal> buildingDeal = dealService.selectAllBuildingDeal(user);
		List<Deal> rentHouseDeal = dealService.selectAllRentHouseDeal(user);
		s.setAttribute("buildingDeal", buildingDeal);
		s.setAttribute("rentHouseDeal", rentHouseDeal);
		
		return "/MyHome/userCenter";
	}
	
	@RequestMapping(value="sendRentHouse.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView sendRentHouse(HttpServletRequest request, RentHouse u) throws IllegalStateException, IOException {
		HttpSession s = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/MyHome/myHouse");
		modelAndView.addObject("rentMessage", "委托成功。");
		try {
			u.setRentHousePublishTime(new Date());
			rentHouseDao.insertRentHouse(u);
			RentHouse_Characteristics tmp = new RentHouse_Characteristics();
			tmp.setCharacteristicsId(((User)s.getAttribute("user")).getUserId());
			tmp.setRentHouseId(u.getRentHouseId());
			rentHouse_CharacteristicsDao.insertRentHouse_Characteristics(tmp);
			
			Application in = new Application();
			List<Application> lap = (List<Application>)s.getAttribute("rentHouseApplication");
			in.date = u.getRentHousePublishTime();
			in.address = u.getRentHouseAddress();
			in.houseId = tmp.getRentHouseId();
			in.phone = ((User)s.getAttribute("user")).getUserPhoneNumber();
			in.hall = u.getRentHouseHall();
			in.room = u.getRentHouseRoom();
			in.toilet = u.getRentHouseToilet();
			in.price = u.getRentHousePrice();
			lap.add(in);
			s.setAttribute("rentHouseApplication", lap);
			
			//得到文件
			String path = request.getSession().getServletContext().getRealPath("upload");  
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
			Iterator iter=multiRequest.getFileNames(); 
			while (iter.hasNext()) {
				MultipartFile file=multiRequest.getFile(iter.next().toString()); 
				String fileName = file.getOriginalFilename();    
				File dir = new File(path,fileName);          
				if(!dir.exists()){  
					dir.mkdirs();  
				}  
				//MultipartFile自带的解析方法  
				file.transferTo(dir); 
	        
		        String filePath = path + "\\" + fileName;
	        	System.err.println(filePath);
	        	String name = new Date().toInstant().toString();
	        	new Tool().upload(filePath, name);
	        	
	        	RentHousePic rhp = new RentHousePic();
	        	rhp.setPicUrl(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
	        	rhp.setInsertTime(new Date());
	        	rhp.setRentHouseId(u.getRentHouseId());
	        	rentHousePicDao.insertRentHousePic(rhp);
			}
		} catch (Exception e) {
			modelAndView.addObject("rentMessage", "委托失败。");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="changeInfo.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView changeInfo(HttpSession s, User u) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/MyHome/userCenter");
		User user = (User) s.getAttribute("user");
		
		u.setUserPassword(user.getUserPassword());
		u.setUserPhoto(user.getUserPhoto());
		u.setUserId(user.getUserId());
		
		try {
			userService.updateUser(u);
		} catch (Exception e) {
			modelAndView.addObject("infoMessage", "修改失败，昵称或邮箱或手机号已被使用。");
			return modelAndView;
		}
		
		s.setAttribute("user", u);
		modelAndView.addObject("infoMessage", "修改个人成功！");
		
		return modelAndView;
	}
	
	@RequestMapping(value="changePwd.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView changePwd(HttpSession s, User u) { // 使用User u的name作为密码，username作为新密码，useremail作为确认新密码
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/MyHome/userCenter");
		User user = (User) s.getAttribute("user");
		String password = u.getName();
		String newPwd = u.getUsername();
		String confim = u.getUserEmail();
		if (!user.getUserPassword().equals(password)) {
			modelAndView.addObject("infoMessage", "修改失败，原密码错误。");
		}
		else if (!newPwd.equals(confim)) {
			modelAndView.addObject("infoMessage", "修改失败，两次密码不一致。");
		}
		else {
			modelAndView.addObject("infoMessage", "修改密码成功。");
			user.setUserPassword(newPwd);
			userService.updateUser(user);
			s.setAttribute("user", user);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="changePhoto.do", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelAndView changePhoto(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/MyHome/userCenter");
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("user");
		
		// 得到文件
		String path = request.getSession().getServletContext().getRealPath("upload");  
		MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
		Iterator iter=multiRequest.getFileNames(); 
		MultipartFile file=multiRequest.getFile(iter.next().toString()); 
        String fileName = file.getOriginalFilename();    
        File dir = new File(path,fileName);          
        if(!dir.exists()){  
        	dir.mkdirs();  
        }  
        //MultipartFile自带的解析方法  
        file.transferTo(dir); 
		
        try {
        	String filePath = path + "\\" + fileName;
        	System.err.println(filePath);
        	String name = new Date().toInstant().toString();
        	new Tool().upload(filePath, name);
        	user.setUserPhoto(String.valueOf("http://os8z6i0zb.bkt.clouddn.com/" + name));
        	userService.updateUser(user);
        } catch (Exception e) {
        	modelAndView.addObject("infoMessage", "上传头像失败TAT");
        	return modelAndView;
        }
        modelAndView.addObject("infoMessage", "上传头像成功！");
		return modelAndView;
	}
	
	
	@RequestMapping(value="logout.do", method={RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpSession s) {
		s.removeAttribute("user");
		return "homepage";
	}
	
	@RequestMapping(value="userCancelRentCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public String userCancelRentCollect(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int rentHouseId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("rentHouseId")) {
				rentHouseId = Integer.parseInt(value);
			}
		}
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		rentHouseCollect.delete(userId, rentHouseId);
		
		List<Collect> userCollectRentHouse = userCollectService.selectUserCollectRentHouse(user);
		session.setAttribute("userCollectRentHouse", userCollectRentHouse);
		
		return "/MyHome/userCenter";
	}
	
	@RequestMapping(value="userCancelBuildingCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public String userCancelBuildingCollect(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int buildingId = 0;
		for(Cookie iCookie : cookies) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("buildingId")) {
				buildingId = Integer.parseInt(value);
			}
		}
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		UserCollectBuilding ucb = new UserCollectBuilding();
		ucb.setUserId(userId);
		ucb.setBuildingId(buildingId);
		userCollectBuildingDao.deleteUserCollectBuilding(ucb);
		
		List<Collect> userCollectBuilding = userCollectService.selectUserCollectBuilding(user);
		session.setAttribute("userCollectBuilding", userCollectBuilding);
		
		return "/MyHome/userCenter";
	}
}
