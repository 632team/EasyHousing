package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.User;
/**
 * 用户相关服务
 */
public interface UserService {
	public User login(User u);
	public void insertUser(User u);
	public void updateUser(User u);
	public User selectUserByName(User u);
	public List<User> selectAllUser();
	public void delete(User u);
}
