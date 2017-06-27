package com.easyhousing.dao;

import com.easyhousing.model.User;

public interface UserDao {
	public void insertUser(User u);
	public int deleteUser(User u);
	public int updateUser(User u);
	public User selectUserById(User u);
	public User selectUserByName(User u);
}
