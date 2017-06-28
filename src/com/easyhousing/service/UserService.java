package com.easyhousing.service;

import com.easyhousing.model.User;

public interface UserService {
	public User login(User u);
	public void insertUser(User u);
}
