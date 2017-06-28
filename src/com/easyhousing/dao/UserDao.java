package com.easyhousing.dao;

import com.easyhousing.model.User;

public interface UserDao {
	public void insertUser(User u);
	public int deleteUser(User u);
	public int updateUser(User u);
	public User selectUserByUserId(User u);
	public User selectUserByUserNameAndPassword(User u);
}
