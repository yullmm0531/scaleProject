package com.scale.style.model.vo;

import java.sql.Date;

public class Style {
	
	private int styleNo;
	private String content;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String hashtag;
	private String styleWriter;

	public Style() {}

	public Style(int styleNo, String content, Date enrollDate, Date modifyDate, String status, String hashtag,
			String styleWriter) {
		super();
		this.styleNo = styleNo;
		this.content = content;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.hashtag = hashtag;
		this.styleWriter = styleWriter;
	}

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getStyleWriter() {
		return styleWriter;
	}

	public void setStyleWriter(String styleWriter) {
		this.styleWriter = styleWriter;
	}

	@Override
	public String toString() {
		return "Style [styleNo=" + styleNo + ", content=" + content + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", hashtag=" + hashtag + ", styleWriter=" + styleWriter + "]";
	}
	
}
