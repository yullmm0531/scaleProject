package com.scale.product.model.vo;

import java.sql.Date;

public class Like {
	
	private String productCode;
	private int userNo;
	private Date enrollDate;
	
	private int countLike;
	private int userLike;
	
	public Like() {}

	public Like(String productCode, int userNo, Date enrollDate) {
		super();
		this.productCode = productCode;
		this.userNo = userNo;
		this.enrollDate = enrollDate;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public int getUserLike() {
		return userLike;
	}

	public void setUserLike(int userLike) {
		this.userLike = userLike;
	}

	@Override
	public String toString() {
		return "Like [productCode=" + productCode + ", userNo=" + userNo + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
}
