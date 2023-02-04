package com.scale.style.model.vo;

import java.sql.Date;

public class StyleImg {
	
	private int imgNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private int styleNo;
	private int fileLevel;

	public StyleImg() {}

	public StyleImg(int imgNo, String originName, String changeName, String filePath, Date uploadDate, String status,
			int styleNo, int fileLevel) {
		super();
		this.imgNo = imgNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.styleNo = styleNo;
		this.fileLevel = fileLevel;
	}

	public StyleImg(int imgNo, String changeName, String filePath, int styleNo, int fileLevel) {
		super();
		this.imgNo = imgNo;
		this.changeName = changeName;
		this.filePath = filePath;
		this.styleNo = styleNo;
		this.fileLevel = fileLevel;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "StyleImg [imgNo=" + imgNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", status=" + status + ", styleNo=" + styleNo
				+ ", fileLevel=" + fileLevel + "]";
	}

	
	
}
