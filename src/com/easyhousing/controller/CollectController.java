package com.easyhousing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.model.User;
import com.easyhousing.service.RentHouseCollect;
/**
 * 控制租房收藏/取消事件
 */
@Controller
public class CollectController {
	
	@Autowired
	private RentHouseCollect rentHouseCollect;
	
	// 收藏租房
	@RequestMapping(value="rentHouseCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView collect(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int rentHouseId = (Integer)session.getAttribute("rentHouseId"); // 获得租房Id
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		rentHouseCollect.insert(userId, rentHouseId);
		session.setAttribute("haveRent", 1); // haveRent记录是否该房子被收藏过，用于页面文本显示判定
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
	
	// 取消收藏租房
	@RequestMapping(value="calcelRentHouseCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView cancelCollect(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int rentHouseId = (Integer)session.getAttribute("rentHouseId"); // 获得租房Id
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		rentHouseCollect.delete(userId, rentHouseId);
		session.setAttribute("haveRent", 0); // haveRent记录是否该房子被收藏过
		modelAndView.setViewName("rentDetail");
		return modelAndView;
	}
}
