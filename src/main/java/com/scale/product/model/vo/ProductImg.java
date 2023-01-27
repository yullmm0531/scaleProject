package com.scale.product.model.vo;

public class ProductImg {
	private int pImgNo;
	private String pOriginName;
	private String pChangeName;
	private String filePath;
	private String fileLevel;
	private String pStatus;
	private String pCode;
	
	
	public ProductImg() {
		
	}


	public ProductImg(int pImgNo, String pOriginName, String pChangeName, String filePath, String fileLevel,
			String pStatus, String pCode) {
		super();
		this.pImgNo = pImgNo;
		this.pOriginName = pOriginName;
		this.pChangeName = pChangeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.pStatus = pStatus;
		this.pCode = pCode;
	}
	
	

	public ProductImg(int pImgNo, String filePath) {
		super();
		this.pImgNo = pImgNo;
		this.filePath = filePath;
	}


	public int getpImgNo() {
		return pImgNo;
	}


	public void setpImgNo(int pImgNo) {
		this.pImgNo = pImgNo;
	}


	public String getpOriginName() {
		return pOriginName;
	}


	public void setpOriginName(String pOriginName) {
		this.pOriginName = pOriginName;
	}


	public String getpChangeName() {
		return pChangeName;
	}


	public void setpChangeName(String pChangeName) {
		this.pChangeName = pChangeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}


	public String getpStatus() {
		return pStatus;
	}


	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	@Override
	public String toString() {
		return "ProductImg [pImgNo=" + pImgNo + ", pOriginName=" + pOriginName + ", pChangeName=" + pChangeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", pStatus=" + pStatus + ", pCode=" + pCode
				+ "]";
	}
	
	
	
}
