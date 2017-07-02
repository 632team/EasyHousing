package com.easyhousing.service;

import java.util.List;

import com.easyhousing.model.Collect;
import com.easyhousing.model.User;

public interface CommentService {
	public List<Collect> selectAllRentHouseCommentByUserId(User u);
	public List<Collect> selectAllBuildingCommentByUserId(User u);
}
