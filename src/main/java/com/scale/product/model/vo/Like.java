package com.scale.product.model.vo;

import java.sql.Date;

public class Like {
	
	private String productCode;
	private int userNo;
	private Date enrollDate;
	
	public Like() {}

	public Like(String productCode, int userNo, Date enrollDate) {
		super();
		this.productCode = productCode;
		this.userNo = userNo;
		this.enrollDate = enrollDate;
	}

	String getProductCode() {
		return productCode;
	}

	void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	int getUserNo() {
		return userNo;
	}

	void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	Date getEnrollDate() {
		return enrollDate;
	}

	void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Like [productCode=" + productCode + ", userNo=" + userNo + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
}
