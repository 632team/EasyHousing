package com.easyhousing.service;

import java.awt.Color;
import java.awt.image.BufferedImage;

public interface ValidateCode {
	
	 public String generateTextCode();
	 /**
	  * 已有验证码，生成验证码图片
	  * 
	  * @param textCode
	  *            文本验证码
	  * @param width
	  *            图片宽度
	  * @param height
	  *            图片高度
	  * @param interLine
	  *            图片中干扰线的条数
	  * @param randomLocation
	  *            每个字符的高低位置是否随机
	  * @param backColor
	  *            图片颜色，若为null，则采用随机颜色
	  * @param foreColor
	  *            字体颜色，若为null，则采用随机颜色
	  * @param lineColor
	  *            干扰线颜色，若为null，则采用随机颜色
	  * @return 图片缓存对象
	 */
	 public BufferedImage generateImageCode(String textCode, int width, int height, int interLine,
	            boolean randomLocation, Color backColor, Color foreColor, Color lineColor);
	 
	 public Color getRandomColor();
}
