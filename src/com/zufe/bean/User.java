package com.zufe.bean;

import java.sql.Date;

/**
 * @author 学无止尽
 * 
 */
public class User {
	private String userId;
	private String userName;
	private String userPass;
	private String userState;// {志愿者,队长,管理员};
	private int teamId = 0;
	private int userAge = 0;
	private String userSex;// {男,女};
	private String userPolitics;
	private String userJob;
	private String userAddress;
	private String userPhone;
	private String userWechat;
	private String userEmail;
	private Date userRegistDate;
	private String userArea;// admin area
	private int userId2;

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserId2() {
		return userId2;
	}

	public void setUserId2(int userId2) {
		this.userId2 = userId2;
	}

	public User() {

	}

	public User(String userId, String userName, String userPass,
			Date userRegistDate, String userState, int teamId, int userAge,
			String userSex, String userPolitics, String userJob,
			String userAddress, String userPhone, String userWechat,
			String userEmail) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userRegistDate = userRegistDate;
		if (userState == "志愿者" || userState == "队长" || userState == "管理员")
			this.userState = userState;
		this.teamId = teamId;
		this.userAge = userAge;
		if (userSex == "男" || userSex == "女")
			this.userSex = userSex;
		this.userPolitics = userPolitics;
		this.userJob = userJob;
		this.userAddress = userAddress;
		this.userPhone = userPhone;
		this.userWechat = userWechat;
		this.userEmail = userEmail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public Date getUserRegistDate() {
		return userRegistDate;
	}

	public void setUserRegistDate(Date userRegistDate) {
		this.userRegistDate = userRegistDate;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		// if (userState == "志愿者" || userState == "队长" || userState ==
		// "管理员"||userState == "超级管理员")
		this.userState = userState;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserPolitics() {
		return userPolitics;
	}

	public void setUserPolitics(String userPolitics) {
		this.userPolitics = userPolitics;
	}

	public String getUserJob() {
		return userJob;
	}

	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserWechat() {
		return userWechat;
	}

	public void setUserWechat(String userWechat) {
		this.userWechat = userWechat;
	}

	public String getUserArea() {
		return userArea;
	}

	public void setUserArea(String userArea) {
		this.userArea = userArea;
	}

}
