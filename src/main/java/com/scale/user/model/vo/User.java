package com.scale.user.model.vo;

import java.sql.Date;

public class User {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickName;
	private String phone;
	private String email;
	private Date enrollDate;
	private String status;
	private Date deleteDate;
	private String managerCheck;
	private String userAccBank;
	private String userAccNum;
	private Date shopBlockDate;
	private Date styleBlockDate;
	private String introduce;
	private String profileImg;
	
	public User() {}

	public User(int userNo, String userId, String userPwd, String userName, String userNickName, String phone,
			String email, Date enrollDate, String status, Date deleteDate, String managerCheck, String userAccBank,
			String userAccNum, Date shopBlockDate, Date styleBlockDate, String introduce, String profileImg) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.status = status;
		this.deleteDate = deleteDate;
		this.managerCheck = managerCheck;
		this.userAccBank = userAccBank;
		this.userAccNum = userAccNum;
		this.shopBlockDate = shopBlockDate;
		this.styleBlockDate = styleBlockDate;
		this.introduce = introduce;
		this.profileImg = profileImg;
	}

	
	public User(String userId, String userPwd, String userName, String userNickName, String phone, String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.phone = phone;
		this.email = email;
	}
	
	

	public User(int userNo, String userAccBank, String userAccNum, String userName) {
		super();
		this.userNo = userNo;
		this.userAccBank = userAccBank;
		this.userAccNum = userAccNum;
		this.userName = userName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getManagerCheck() {
		return managerCheck;
	}

	public void setManagerCheck(String managerCheck) {
		this.managerCheck = managerCheck;
	}

	public String getUserAccBank() {
		return userAccBank;
	}

	public void setUserAccBank(String userAccBank) {
		this.userAccBank = userAccBank;
	}

	public String getUserAccNum() {
		return userAccNum;
	}

	public void setUserAccNum(String userAccNum) {
		this.userAccNum = userAccNum;
	}

	public Date getShopBlockDate() {
		return shopBlockDate;
	}

	public void setShopBlockDate(Date shopBlockDate) {
		this.shopBlockDate = shopBlockDate;
	}

	public Date getStyleBlockDate() {
		return styleBlockDate;
	}

	public void setStyleBlockDate(Date styleBlockDate) {
		this.styleBlockDate = styleBlockDate;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userNickName=" + userNickName + ", phone=" + phone + ", email=" + email + ", enrollDate="
				+ enrollDate + ", status=" + status + ", deleteDate=" + deleteDate + ", managerCheck=" + managerCheck
				+ ", userAccBank=" + userAccBank + ", userAccNum=" + userAccNum + ", shopBlockDate=" + shopBlockDate
				+ ", styleBlockDate=" + styleBlockDate + ", introduce=" + introduce + ", profileImg=" + profileImg
				+ "]";
	}
	
}
