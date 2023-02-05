package com.scale.customerCenter.model.vo;

public class Inquire {

	private int inquireNo;
	private String inquireTitle;
	private String inquireContent;
	private String inquireDate;
	private String inquireImg;
	private String answerContent;
	private String answerDate;
	private String answerModifyDate;
	private String answerStatus;
	private String inquireStatus;
	private String inquireUser;
	private String answerUser;
	private String category;
	
	public Inquire() {}

	public Inquire(int inquireNo, String inquireTitle, String inquireContent, String inquireDate, String inquireImg,
			String answerContent, String answerDate, String answerModifyDate, String answerStatus, String inquireStatus,
			String inquireUser, String answerUser, String category) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireDate = inquireDate;
		this.inquireImg = inquireImg;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.answerModifyDate = answerModifyDate;
		this.answerStatus = answerStatus;
		this.inquireStatus = inquireStatus;
		this.inquireUser = inquireUser;
		this.answerUser = answerUser;
		this.category = category;
	}
	
	public Inquire(int inquireNo, String inquireTitle, String inquireContent, String inquireDate, String inquireImg,
			String answerContent, String answerModifyDate, String answerStatus, String category) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireDate = inquireDate;
		this.inquireImg = inquireImg;
		this.answerContent = answerContent;
		this.answerModifyDate = answerModifyDate;
		this.answerStatus = answerStatus;
		this.category = category;
	}
	
	public Inquire(int inquireNo, String inquireTitle, String inquireDate, String answerModifyDate,
			String answerStatus, String inquireUser, String answerUser, String category) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireDate = inquireDate;
		this.answerModifyDate = answerModifyDate;
		this.answerStatus = answerStatus;
		this.inquireUser = inquireUser;
		this.answerUser = answerUser;
		this.category = category;
	}

	public Inquire(int inquireNo, String inquireTitle, String inquireContent, String inquireDate, String inquireImg,
			String answerContent, String answerDate, String answerModifyDate, String answerStatus, String inquireUser,
			String answerUser, String category) {
		super();
		this.inquireNo = inquireNo;
		this.inquireTitle = inquireTitle;
		this.inquireContent = inquireContent;
		this.inquireDate = inquireDate;
		this.inquireImg = inquireImg;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.answerModifyDate = answerModifyDate;
		this.answerStatus = answerStatus;
		this.inquireUser = inquireUser;
		this.answerUser = answerUser;
		this.category = category;
	}

	public Inquire(int inquireNo, String answerContent, String answerUser) {
		super();
		this.inquireNo = inquireNo;
		this.answerContent = answerContent;
		this.answerUser = answerUser;
	}

	public int getInquireNo() {
		return inquireNo;
	}

	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}

	public String getInquireTitle() {
		return inquireTitle;
	}

	public void setInquireTitle(String inquireTitle) {
		this.inquireTitle = inquireTitle;
	}

	public String getInquireContent() {
		return inquireContent;
	}

	public void setInquireContent(String inquireContent) {
		this.inquireContent = inquireContent;
	}

	public String getInquireDate() {
		return inquireDate;
	}

	public void setInquireDate(String inquireDate) {
		this.inquireDate = inquireDate;
	}

	public String getInquireImg() {
		return inquireImg;
	}

	public void setInquireImg(String inquireImg) {
		this.inquireImg = inquireImg;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerModifyDate() {
		return answerModifyDate;
	}

	public void setAnswerModifyDate(String answerModifyDate) {
		this.answerModifyDate = answerModifyDate;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	public String getInquireStatus() {
		return inquireStatus;
	}

	public void setInquireStatus(String inquireStatus) {
		this.inquireStatus = inquireStatus;
	}

	public String getInquireUser() {
		return inquireUser;
	}

	public void setInquireUser(String inquireUser) {
		this.inquireUser = inquireUser;
	}

	public String getAnswerUser() {
		return answerUser;
	}

	public void setAnswerUser(String answerUser) {
		this.answerUser = answerUser;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Inquire [inquireNo=" + inquireNo + ", inquireTitle=" + inquireTitle + ", inquireContent="
				+ inquireContent + ", inquireDate=" + inquireDate + ", inquireImg=" + inquireImg + ", answerContent="
				+ answerContent + ", answerDate=" + answerDate + ", answerModifyDate=" + answerModifyDate
				+ ", answerStatus=" + answerStatus + ", inquireStatus=" + inquireStatus + ", inquireUser=" + inquireUser
				+ ", answerUser=" + answerUser + ", category=" + category + "]";
	}
	
}
