package com.scale.style.model.vo;

import java.sql.Date;

public class StyleReport {
	
	private int reportNo;
	private int reportedUserNo;
	private String reportedUserId;
	private int reportingUserNo;
	private String reportingUserId;
	private String title;
	private String content;
	private Date reportedDate;
	private int styleNo;
	private String reportCheck;

	public StyleReport() {}

	public StyleReport(int reportNo, int reportedUserNo, String reportedUserId, int reportingUserNo,
			String reportingUserId, String title, String content, Date reportedDate, int styleNo, String reportCheck) {
		super();
		this.reportNo = reportNo;
		this.reportedUserNo = reportedUserNo;
		this.reportedUserId = reportedUserId;
		this.reportingUserNo = reportingUserNo;
		this.reportingUserId = reportingUserId;
		this.title = title;
		this.content = content;
		this.reportedDate = reportedDate;
		this.styleNo = styleNo;
		this.reportCheck = reportCheck;
	}

	public StyleReport(int reportedUserNo, int reportingUserNo, String title, String content, int styleNo) {
		super();
		this.reportedUserNo = reportedUserNo;
		this.reportingUserNo = reportingUserNo;
		this.title = title;
		this.content = content;
		this.styleNo = styleNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportedUserNo() {
		return reportedUserNo;
	}

	public void setReportedUserNo(int reportedUserNo) {
		this.reportedUserNo = reportedUserNo;
	}

	public String getReportedUserId() {
		return reportedUserId;
	}

	public void setReportedUserId(String reportedUserId) {
		this.reportedUserId = reportedUserId;
	}

	public int getReportingUserNo() {
		return reportingUserNo;
	}

	public void setReportingUserNo(int reportingUserNo) {
		this.reportingUserNo = reportingUserNo;
	}

	public String getReportingUserId() {
		return reportingUserId;
	}

	public void setReportingUserId(String reportingUserId) {
		this.reportingUserId = reportingUserId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReportedDate() {
		return reportedDate;
	}

	public void setReportedDate(Date reportedDate) {
		this.reportedDate = reportedDate;
	}

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}

	public String getReportCheck() {
		return reportCheck;
	}

	public void setReportCheck(String reportCheck) {
		this.reportCheck = reportCheck;
	}

	@Override
	public String toString() {
		return "StyleReport [reportNo=" + reportNo + ", reportedUserNo=" + reportedUserNo + ", reportedUserId="
				+ reportedUserId + ", reportingUserNo=" + reportingUserNo + ", reportingUserId=" + reportingUserId
				+ ", title=" + title + ", content=" + content + ", reportedDate=" + reportedDate + ", styleNo="
				+ styleNo + ", reportCheck=" + reportCheck + "]";
	}
	
}
