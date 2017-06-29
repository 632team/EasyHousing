package com.easyhousing.model;

public class Register {
	private String username;
	private String userPassword;
	private String confirmPassword;
	private String registerValidateCode;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getRegisterValidateCode() {
		return registerValidateCode;
	}
	public void setRegisterValidateCode(String registerValidateCode) {
		this.registerValidateCode = registerValidateCode;
	}
	
	
}
