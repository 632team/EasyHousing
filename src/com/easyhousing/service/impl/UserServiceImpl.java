package com.easyhousing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyhousing.dao.UserDao;
import com.easyhousing.model.User;
import com.easyhousing.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(User u) {
		return userDao.selectUserByName(u);
	}

}
