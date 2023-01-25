package com.scale.style.model.vo;

import java.sql.Date;

public class StyleLike {
	
	private int userNo;
	private int styleNo;
	private Date likeDate;

	public StyleLike() {}

	public StyleLike(int userNo, int styleNo, Date likeDate) {
		super();
		this.userNo = userNo;
		this.styleNo = styleNo;
		this.likeDate = likeDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "StyleLike [userNo=" + userNo + ", styleNo=" + styleNo + ", likeDate=" + likeDate + "]";
	}
	
}
