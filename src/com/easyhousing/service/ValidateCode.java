package com.easyhousing.service;

import java.awt.Color;
import java.awt.image.BufferedImage;

public interface ValidateCode {
	
	 public String generateTextCode();
	 /**
	  * ������֤�룬������֤��ͼƬ
	  * 
	  * @param textCode
	  *            �ı���֤��
	  * @param width
	  *            ͼƬ���
	  * @param height
	  *            ͼƬ�߶�
	  * @param interLine
	  *            ͼƬ�и����ߵ�����
	  * @param randomLocation
	  *            ÿ���ַ��ĸߵ�λ���Ƿ����
	  * @param backColor
	  *            ͼƬ��ɫ����Ϊnull������������ɫ
	  * @param foreColor
	  *            ������ɫ����Ϊnull������������ɫ
	  * @param lineColor
	  *            ��������ɫ����Ϊnull������������ɫ
	  * @return ͼƬ�������
	 */
	 public BufferedImage generateImageCode(String textCode, int width, int height, int interLine,
	            boolean randomLocation, Color backColor, Color foreColor, Color lineColor);
	 
	 public Color getRandomColor();
}
