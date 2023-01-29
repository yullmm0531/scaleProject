package com.scale.customerCenter.model.vo;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private String modifyDate;
	private int count;
	private String displayStatus;
	private String deleteStatus;
	private String noticeWriter;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, String createDate, String modifyDate, int count,
			String displayStatus, String deleteStatus, String noticeWriter) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.displayStatus = displayStatus;
		this.deleteStatus = deleteStatus;
		this.noticeWriter = noticeWriter;
	}

	public Notice(int noticeNo, String noticeTitle, String createDate, int count) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
		this.count = count;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", count=" + count + ", displayStatus="
				+ displayStatus + ", deleteStatus=" + deleteStatus + ", noticeWriter=" + noticeWriter + "]";
	}
	
	
}
