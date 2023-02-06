package com.scale.style.model.vo;

import java.sql.Date;

public class StyleReport {
	
	private int reportNo;
	private int reportedUser;
	private int reportingUser;
	private String title;
	private String content;
	private Date reportedDate;
	private int styleNo;
	private String reportCheck;
	private String reportedId;
	private String reportingId;

	public StyleReport() {}

	public StyleReport(int reportNo, int reportedUser, int reportingUser, String title, String content,
			Date reportedDate, int styleNo, String reportCheck, String reportedId, String reportingId) {
		super();
		this.reportNo = reportNo;
		this.reportedUser = reportedUser;
		this.reportingUser = reportingUser;
		this.title = title;
		this.content = content;
		this.reportedDate = reportedDate;
		this.styleNo = styleNo;
		this.reportCheck = reportCheck;
		this.reportedId = reportedId;
		this.reportingId = reportingId;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportedUser() {
		return reportedUser;
	}

	public void setReportedUser(int reportedUser) {
		this.reportedUser = reportedUser;
	}

	public int getReportingUser() {
		return reportingUser;
	}

	public void setReportingUser(int reportingUser) {
		this.reportingUser = reportingUser;
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

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	public String getReportingId() {
		return reportingId;
	}

	public void setReportingId(String reportingId) {
		this.reportingId = reportingId;
	}

	@Override
	public String toString() {
		return "StyleReport [reportNo=" + reportNo + ", reportedUser=" + reportedUser + ", reportingUser="
				+ reportingUser + ", title=" + title + ", content=" + content + ", reportedDate=" + reportedDate
				+ ", styleNo=" + styleNo + ", reportCheck=" + reportCheck + ", reportedId=" + reportedId
				+ ", reportingId=" + reportingId + "]";
	}

}
