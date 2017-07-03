package com.easyhousing.service.impl;

import java.util.List;

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
		return userDao.selectUserByUserNameAndPassword(u);
	}
	
	@Override
	public void insertUser(User u) {
		userDao.insertUser(u);
	}
	
	@Override
	public void updateUser(User u) {
		userDao.updateUser(u);
	}

	@Override
	public User selectUserByName(User u) {
		return userDao.selectUserByUserName(u);
	}

	@Override
	public List<User> selectAllUser() {
		return userDao.selectAllUser();
	}

	@Override
	public void delete(User u) {
		userDao.deleteUser(u);
	}

}
