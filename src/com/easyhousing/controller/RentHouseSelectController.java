package com.easyhousing.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.RentHousePicDao;
import com.easyhousing.model.RentHouse;
import com.easyhousing.model.RentHousePic;
import com.easyhousing.service.RentHouseSearch;

import jdk.internal.dynalink.linker.LinkerServices;

/**
 * 
 * @author 王辰辰
 * 按条件搜索租房
 */
@Controller
public class RentHouseSelectController {
	
	//对前端传的中文字符进行escape解码
	private final static String[] hex = {  
	        "00","01","02","03","04","05","06","07","08","09","0A","0B","0C","0D","0E","0F",  
	        "10","11","12","13","14","15","16","17","18","19","1A","1B","1C","1D","1E","1F",  
	        "20","21","22","23","24","25","26","27","28","29","2A","2B","2C","2D","2E","2F",  
	        "30","31","32","33","34","35","36","37","38","39","3A","3B","3C","3D","3E","3F",  
	        "40","41","42","43","44","45","46","47","48","49","4A","4B","4C","4D","4E","4F",  
	        "50","51","52","53","54","55","56","57","58","59","5A","5B","5C","5D","5E","5F",  
	        "60","61","62","63","64","65","66","67","68","69","6A","6B","6C","6D","6E","6F",  
	        "70","71","72","73","74","75","76","77","78","79","7A","7B","7C","7D","7E","7F",  
	        "80","81","82","83","84","85","86","87","88","89","8A","8B","8C","8D","8E","8F",  
	        "90","91","92","93","94","95","96","97","98","99","9A","9B","9C","9D","9E","9F",  
	        "A0","A1","A2","A3","A4","A5","A6","A7","A8","A9","AA","AB","AC","AD","AE","AF",  
	        "B0","B1","B2","B3","B4","B5","B6","B7","B8","B9","BA","BB","BC","BD","BE","BF",  
	        "C0","C1","C2","C3","C4","C5","C6","C7","C8","C9","CA","CB","CC","CD","CE","CF",  
	        "D0","D1","D2","D3","D4","D5","D6","D7","D8","D9","DA","DB","DC","DD","DE","DF",  
	        "E0","E1","E2","E3","E4","E5","E6","E7","E8","E9","EA","EB","EC","ED","EE","EF",  
	        "F0","F1","F2","F3","F4","F5","F6","F7","F8","F9","FA","FB","FC","FD","FE","FF"  
	    };  
	    private final static byte[] val = {  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,  
	        0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F  
	    };  
	    public static String escape(String s) {  
	        StringBuffer sbuf = new StringBuffer();  
	        int len = s.length();  
	        for (int i = 0; i < len; i++) {  
	            int ch = s.charAt(i);  
	            if (ch == ' ') {                        // space : map to '+'   
	                sbuf.append('+');  
	            } else if ('A' <= ch && ch <= 'Z') {    // 'A'..'Z' : as it was  
	                sbuf.append((char)ch);  
	            } else if ('a' <= ch && ch <= 'z') {    // 'a'..'z' : as it was  
	                sbuf.append((char)ch);  
	            } else if ('0' <= ch && ch <= '9') {    // '0'..'9' : as it was  
	                sbuf.append((char)ch);  
	            } else if (ch == '-' || ch == '_'       // unreserved : as it was  
	                || ch == '.' || ch == '!'  
	                || ch == '~' || ch == '*'  
	                || ch == '\'' || ch == '('  
	                || ch == ')') {  
	                sbuf.append((char)ch);  
	            } else if (ch <= 0x007F) {              // other ASCII : map to %XX  
	                sbuf.append('%');  
	                sbuf.append(hex[ch]);  
	            } else {                                // unicode : map to %uXXXX  
	                sbuf.append('%');  
	                sbuf.append('u');  
	                sbuf.append(hex[(ch >>> 8)]);  
	                sbuf.append(hex[(0x00FF & ch)]);  
	            }  
	        }  
	        return sbuf.toString();  
	    }  
	    public static String unescape(String s) {  
	        StringBuffer sbuf = new StringBuffer();  
	        int i = 0;  
	        int len = s.length();  
	        while (i < len) {  
	            int ch = s.charAt(i);  
	            if (ch == '+') {                        // + : map to ' '   
	                sbuf.append(' ');  
	            } else if ('A' <= ch && ch <= 'Z') {    // 'A'..'Z' : as it was  
	                sbuf.append((char)ch);  
	            } else if ('a' <= ch && ch <= 'z') {    // 'a'..'z' : as it was  
	                sbuf.append((char)ch);  
	            } else if ('0' <= ch && ch <= '9') {    // '0'..'9' : as it was  
	                sbuf.append((char)ch);  
	            } else if (ch == '-' || ch == '_'       // unreserved : as it was  
	                || ch == '.' || ch == '!'  
	                || ch == '~' || ch == '*'  
	                || ch == '\'' || ch == '('  
	                || ch == ')') {  
	                sbuf.append((char)ch);  
	            } else if (ch == '%') {  
	                int cint = 0;  
	                if ('u' != s.charAt(i+1)) {         // %XX : map to ascii(XX)  
	                    cint = (cint << 4) | val[s.charAt(i+1)];  
	                    cint = (cint << 4) | val[s.charAt(i+2)];  
	                    i+=2;  
	                } else {                            // %uXXXX : map to unicode(XXXX)  
	                    cint = (cint << 4) | val[s.charAt(i+2)];  
	                    cint = (cint << 4) | val[s.charAt(i+3)];  
	                    cint = (cint << 4) | val[s.charAt(i+4)];  
	                    cint = (cint << 4) | val[s.charAt(i+5)];  
	                    i+=5;  
	                }  
	                sbuf.append((char)cint);  
	            }  
	            i++;  
	        }  
	        return sbuf.toString();  
	    }  
	
	
	@Autowired
	private RentHouseSearch rentHouseSearch;
	
	@Autowired
	private RentHousePicDao rentHousePicDao;
	
	//租房显示跳转初始化
	@RequestMapping(value="rentHouseSelect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView rentHouseSelect(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		String strAddress = (String)session.getAttribute("address");
		String strlowPrice = (String)session.getAttribute("lowPrice");
		String strhighPrice = (String)session.getAttribute("highPrice");
		String strlowRoomNum = (String)session.getAttribute("lowRoomNum");
		String strhighRoomNum = (String)session.getAttribute("highRoomNum");
		String strclass1 = (String)session.getAttribute("class1");
		String strclass2 = (String)session.getAttribute("class2");
		String strclass3 = (String)session.getAttribute("class3");
		if(strAddress == null) {
			session.setAttribute("address", "");
		}
		if(strlowPrice == null) {
			session.setAttribute("lowPrice", "0");
		}
		if(strhighPrice == null) {
			session.setAttribute("highPrice", "1000000000");
		}
		if(strlowRoomNum == null) {
			session.setAttribute("lowRoomNum", "0");
		}
		if(strhighRoomNum == null) {
			session.setAttribute("highRoomNum", "1000000000");
		}
		if(strclass1 == null) {
			session.setAttribute("class1", "0");
		}
		if(strclass2 == null) {
			session.setAttribute("class2", "11");
		}
		if(strclass3 == null) {
			session.setAttribute("class3", "21");
		}
		String address = (String)session.getAttribute("address");
		int lowPrice = Integer.parseInt((String)session.getAttribute("lowPrice"));
		int highPrice = Integer.parseInt((String)session.getAttribute("highPrice"));
		int lowRoomNum = Integer.parseInt((String)session.getAttribute("lowRoomNum"));
		int highRoomNum = Integer.parseInt((String)session.getAttribute("highRoomNum"));
		List<RentHouse>list = rentHouseSearch.searchRentHouse(address, lowPrice, highPrice, lowRoomNum, highRoomNum);
		
		List<String> rentHousePicList = new ArrayList<>();
		for (RentHouse i : list) {
			List<String> t = rentHousePicDao.selectRentHousePicByRentHouseId(i.getRentHouseId());
			if (t.size() == 0) {
				rentHousePicList.add("");
			}
			else rentHousePicList.add(t.get(0));
		}
		session.setAttribute("rentHousePicList", rentHousePicList);
		
		session.setAttribute("list", list);
		session.setAttribute("st", 0);
		session.setAttribute("listSize", list.size());
		for(RentHouse i : list) {
			System.err.println(i.getRentHouseAddress());
			System.err.println(list.size());
		}
		modelAndView.setViewName("rentWindow");
		return modelAndView;
	}
	
	//按条件查询
	@RequestMapping(value="rentHouseSelectAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void rentHouseSelectAjax(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		if(cookie == null) {
			System.err.println("cnm");
		}
		else {
			System.err.println("yyyyyy");
			//设置价格，卧室数量，地址查询
			for(Cookie iCookie : cookie) {
					String strtemp = iCookie.getName();
					
					String value;
					if(strtemp.equals("address")) {
						value = unescape(iCookie.getValue());
						if (value.equals("不限")) {
							value = "";
						}
						session.setAttribute("address", value);
						System.err.println(value);
					}
					else if(strtemp.equals("lowPrice")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("lowPrice", value);
					}
					else if(strtemp.equals("highPrice")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("highPrice", value);
					}
					else if(strtemp.equals("highRoomNum")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("highRoomNum", value);
					}
					else if(strtemp.equals("lowRoomNum")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("lowRoomNum", value);
					}
					else if(strtemp.equals("class1")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("class1", value);
					}
					else if(strtemp.equals("class2")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("class2", value);
					}
					else if(strtemp.equals("class3")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("class3", value);
					}
					System.err.println(iCookie.getName());
			}
		}
		String strAddress = (String)session.getAttribute("address");
		String strlowPrice = (String)session.getAttribute("lowPrice");
		String strhighPrice = (String)session.getAttribute("highPrice");
		String strlowRoomNum = (String)session.getAttribute("lowRoomNum");
		String strhighRoomNum = (String)session.getAttribute("highRoomNum");
		if(strAddress == null) {
			session.setAttribute("address", "");
		}
		if(strlowPrice == null) {
			session.setAttribute("lowPrice", "0");
		}
		if(strhighPrice == null) {
			session.setAttribute("highPrice", "1000000000");
		}
		if(strlowRoomNum == null) {
			session.setAttribute("lowRoomNum", "0");
		}
		if(strhighRoomNum == null) {
			session.setAttribute("highRoomNum", "1000000000");
		}
		String address = (String)session.getAttribute("address");
		int lowPrice = Integer.parseInt((String)session.getAttribute("lowPrice"));
		int highPrice = Integer.parseInt((String)session.getAttribute("highPrice"));
		int lowRoomNum = Integer.parseInt((String)session.getAttribute("lowRoomNum"));
		int highRoomNum = Integer.parseInt((String)session.getAttribute("highRoomNum"));
		List<RentHouse>list = rentHouseSearch.searchRentHouse(address, lowPrice, highPrice, lowRoomNum, highRoomNum);
		
		List<String> rentHousePicList = new ArrayList<>();
		for (RentHouse i : list) {
			List<String> t = rentHousePicDao.selectRentHousePicByRentHouseId(i.getRentHouseId());
			if (t.size() == 0) {
				rentHousePicList.add("");
			}
			else rentHousePicList.add(t.get(0));
		}
		session.setAttribute("rentHousePicList", rentHousePicList);
		
		session.setAttribute("list", list);
		session.setAttribute("st", 0);
		session.setAttribute("listSize", list.size());
		System.err.println(session.getAttribute("class1"));
	}
	
	//前一页显示
	@RequestMapping(value="prePage.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView prePage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int st = (Integer)session.getAttribute("st");
		st = st - 5;
		if(st < 0) st = 0;
		session.setAttribute("st", st);
		modelAndView.setViewName("rentWindow");
		return modelAndView;
	}
	
	//后一页显示
	@RequestMapping(value="nextPage.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView nextPage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int st = (Integer)session.getAttribute("st");
		int listSize = (Integer)session.getAttribute("listSize");
		st = st + 5;
		if(st > listSize) st = st - 5;
		session.setAttribute("st", st);
		modelAndView.setViewName("rentWindow");
		return modelAndView;
	}
		
}
