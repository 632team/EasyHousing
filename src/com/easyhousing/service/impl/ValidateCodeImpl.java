package com.easyhousing.service.impl;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.service.ValidateCode;

import java.awt.image.BufferedImage;
import java.awt.Graphics;
import java.awt.Font;
import java.awt.Color;

@Service("validateCode")
public class ValidateCodeImpl implements ValidateCode{
	
	@Override
	public String generateTextCode() {
		StringBuffer code = new StringBuffer();
		int i = 0;
		Random r = new Random();

		while (i < 4) {
			int t = r.nextInt(200);
			if (t >= 'a' && t <= 'z') {
				code.append((char) t);
				i++;
			} else if (t >= 'A' && t <= 'Z') {
				code.append((char) t);
				i++;
			}
		}
		return code.toString();
	}

	@Override
	public BufferedImage generateImageCode(String textCode, int width, int height, int interLine,
			boolean randomLocation, Color backColor, Color foreColor, Color lineColor) {
		//创建内存图像
		BufferedImage bim = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//获取图形上下文 
		Graphics g = bim.getGraphics();

		//画背景图
		g.setColor(backColor == null ? getRandomColor() : backColor);
		g.fillRect(0, 0, width, height);

		//画干扰线 
		Random r = new Random();
		int x = 0, y = 0, x1 = width, y1 = 0;
		for (int i = 0; i < interLine; i++) {
			g.setColor(lineColor == null ? getRandomColor() : lineColor);
			y = r.nextInt(height);
			y1 = r.nextInt(height);
			g.drawLine(x, y, x1, y1);
		}

		// д��֤��

		// g.setColor(getRandomColor());
		// g.setColor(isSimpleColor?Color.BLACK:Color.WHITE);

		//字体大小为图片高度的80% 
		int fsize = (int) (height * 0.8);
		int fx = height - fsize;
		int fy = fsize;

		g.setFont(new Font("Default", Font.PLAIN, fsize));

		//写验证码字符 
		for (int i = 0; i < textCode.length(); i++) {
			fy = randomLocation ? (int) ((Math.random() * 0.3 + 0.6) * height) : fy;// ÿ���ַ��ߵ��Ƿ����
			g.setColor(foreColor == null ? getRandomColor() : foreColor);
			g.drawString(textCode.charAt(i) + "", fx, fy);
			fx += fsize * 0.9;
		}

		g.dispose();

		return bim;
	}
	
	@Override
	public Color getRandomColor() {
		Random r = new Random();
		Color c = new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255));
		return c;
	}
}
