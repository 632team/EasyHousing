package com.easyhousing.dao;

import com.easyhousing.model.Administrator;

public interface AdministratorDao {
	
	public void insertAdministrator(Administrator u);
	public int deleteAdministrator(Administrator u);
	public int updateAdministrator(Administrator u);
	public Administrator selectAdministrator(Administrator u);
}
