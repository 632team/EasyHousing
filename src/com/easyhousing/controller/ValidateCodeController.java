package com.easyhousing.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.easyhousing.service.ValidateCode;

/**
 * 
 * @author 王辰辰
 * 取得service生成的验证码，并显示
 */

@Controller
public class ValidateCodeController {
	
	@Autowired
	private ValidateCode validateCode;
	
	//取得后台的验证码并显示
	@RequestMapping(value = "validateCode.do", method={RequestMethod.GET, RequestMethod.POST})
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Cache-Control", "no-cache");
        //获得验证码答案
        String verifyCode = validateCode.generateTextCode();
        request.getSession().setAttribute("validateCode", verifyCode);
        //显示验证码
        response.setContentType("image/jpeg");
        BufferedImage bim = validateCode.generateImageCode(verifyCode, 90, 30, 5, true, Color.WHITE, Color.BLUE, null);
        ImageIO.write(bim, "JPEG", response.getOutputStream());
    }
}
