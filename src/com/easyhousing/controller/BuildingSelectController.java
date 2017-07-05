package com.easyhousing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.service.BuildingSearch;

/**
 * 
 * @author 王辰辰
 * 楼盘按条件查询
 */
@Controller
public class BuildingSelectController {
	
	@Autowired
	private BuildingSearch buildingSearch;
	
	@Autowired
	private BuildingPicDao buildingPicDao;
	
	//按条件查询楼盘，初始化跳转
	@RequestMapping(value="buildingSelect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView buildingSelect(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		//地址，最低价格，最高价格，最低卧室数量，最多卧室数量
		String strAddress = (String)session.getAttribute("buildingAddress");
		String strlowPrice = (String)session.getAttribute("buildingLowPrice");
		String strhighPrice = (String)session.getAttribute("buildingHighPrice");

		String strclass1 = (String)session.getAttribute("buildingClass1");
		String strclass2 = (String)session.getAttribute("buildingClass2");

		if(strAddress == null) {
			session.setAttribute("buildingAddress", "");
		}
		if(strlowPrice == null) {
			session.setAttribute("buildingLowPrice", "0");
		}
		if(strhighPrice == null) {
			session.setAttribute("buildingHighPrice", "1000000000");
		}

		if(strclass1 == null) {
			session.setAttribute("buildingClass1", "0");
		}
		if(strclass2 == null) {
			session.setAttribute("buildingClass2", "11");
		}

		String address = (String)session.getAttribute("buildingAddress");
		int lowPrice = Integer.parseInt((String)session.getAttribute("buildingLowPrice"));
		int highPrice = Integer.parseInt((String)session.getAttribute("buildingHighPrice"));
		
		List<BuildingInfo>list = buildingSearch.searchBuilding(address, lowPrice, highPrice);
		
		//查询结果
		List<String> buildingPicList = new ArrayList<>();
		for (BuildingInfo i: list) {
			List<String> t = buildingPicDao.selectBuildingPicByBuildingId(i.getBuildingId());
			if (t.size() == 0) {
				buildingPicList.add("");
			}
			else {
				buildingPicList.add(t.get(0));
				System.err.println(t.get(0));
			}
		}
		
		//返回查询结果
		session.setAttribute("buildingPicList", buildingPicList);
		
		session.setAttribute("buildingList", list);
		session.setAttribute("buildingSt", 0);
		session.setAttribute("buildingListSize", list.size());
		for(BuildingInfo i : list) {
			System.err.println(i.getBuildingAddress());
			System.err.println(list.size());
		}
		
		modelAndView.setViewName("building");
		return modelAndView;
	}
	
	//按条件查询楼盘
	@RequestMapping(value="buildingSelectAjax.do", method={RequestMethod.GET,RequestMethod.POST})
	public void rentHouseSelectAjax(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		if(cookie == null) {
			System.err.println("cnm");
		}
		else {
			System.err.println("yyyyyy");
			//设置属性
			for(Cookie iCookie : cookie) {
					String strtemp = iCookie.getName();
					
					String value;
					if(strtemp.equals("buildingAddress")) {
						value = unescape(iCookie.getValue());
						if (value.equals("不限")) {
							value = "";
						}
						session.setAttribute("buildingAddress", value);
						System.err.println(value);
					}
					else if(strtemp.equals("buildingLowPrice")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("buildingLowPrice", value);
					}
					else if(strtemp.equals("buildingHighPrice")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("buildingHighPrice", value);
					}
					else if(strtemp.equals("buildingClass1")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("buildingClass1", value);
					}
					else if(strtemp.equals("buildingClass2")) {
						value = unescape(iCookie.getValue());
						session.setAttribute("buildingClass2", value);
					}
					System.err.println(iCookie.getName());
			}
		}
		String strAddress = (String)session.getAttribute("buildingAddress");
		String strlowPrice = (String)session.getAttribute("buildingLowPrice");
		String strhighPrice = (String)session.getAttribute("buildingHighPrice");

		if(strAddress == null) {
			session.setAttribute("buildingAddress", "");
		}
		if(strlowPrice == null) {
			session.setAttribute("buildingLowPrice", "0");
		}
		if(strhighPrice == null) {
			session.setAttribute("buildingHighPrice", "1000000000");
		}

		String address = (String)session.getAttribute("buildingAddress");
		int lowPrice = Integer.parseInt((String)session.getAttribute("buildingLowPrice"));
		int highPrice = Integer.parseInt((String)session.getAttribute("buildingHighPrice"));

		List<BuildingInfo> list = buildingSearch.searchBuilding(address, lowPrice, highPrice);
		
		List<String> buildingPicList = new ArrayList<>();
		for (BuildingInfo i: list) {
			List<String> t = buildingPicDao.selectBuildingPicByBuildingId(i.getBuildingId());
			if (t.size() == 0) {
				buildingPicList.add("");
			}
			else buildingPicList.add(t.get(0));
		}
		session.setAttribute("buildingPicList", buildingPicList);
		
		session.setAttribute("buildingList", list);
		session.setAttribute("buildingSt", 0);
		session.setAttribute("buildingListSize", list.size());
		System.err.println(session.getAttribute("buildingClass1"));
	}
	
	//分页显示，前一页
	@RequestMapping(value="buildingPrePage.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView prePage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int st = (Integer)session.getAttribute("buildingSt");
		st = st - 5;
		if(st < 0) st = 0;
		session.setAttribute("buildingSt", st);
		modelAndView.setViewName("building");
		return modelAndView;
	}
	
	//分页显示，后一页
	@RequestMapping(value="buildingNextPage.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView nextPage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int st = (Integer)session.getAttribute("buildingSt");
		int listSize = (Integer)session.getAttribute("buildingListSize");
		st = st + 5;
		if(st > listSize) st = st - 5;
		session.setAttribute("buildingSt", st);
		modelAndView.setViewName("building");
		return modelAndView;
	}
	
	//对前端返回的escape编码进行解码
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
}
