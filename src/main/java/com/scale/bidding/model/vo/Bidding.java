package com.scale.bidding.model.vo;

public class Bidding {
	
	private int bNo;
	private int pSize;
	private int pType;
	private String bPrice;
	private String bDate;
	private String inspectionCost;
	private String commition;
	private String deliveryFee;
	private String bStatus;
	private String dCheck;
	private String dStep;
	private String dDate;
	private String pCode;
	private int userNo;
	
	private int count;
	
	public Bidding() {
		
	}


	public Bidding(int bNo, int pSize, int pType, String bPrice, String bDate, String inspectionCost, String commition,
			String deliveryFee, String bStatus, String dCheck, String dStep, String dDate, String pCode, int userNo) {
		super();
		this.bNo = bNo;
		this.pSize = pSize;
		this.pType = pType;
		this.bPrice = bPrice;
		this.bDate = bDate;
		this.inspectionCost = inspectionCost;
		this.commition = commition;
		this.deliveryFee = deliveryFee;
		this.bStatus = bStatus;
		this.dCheck = dCheck;
		this.dStep = dStep;
		this.dDate = dDate;
		this.pCode = pCode;
		this.userNo = userNo;
	}
	
	


	public Bidding(int bNo, int pSize, String bPrice, String dDate) {
		super();
		this.bNo = bNo;
		this.pSize = pSize;
		this.bPrice = bPrice;
		this.dDate = dDate;
	}

	
	
	
	
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Bidding(int pSize, String bPrice, int count) {
		super();
		this.pSize = pSize;
		this.bPrice = bPrice;
		this.count = count;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public int getpSize() {
		return pSize;
	}


	public void setpSize(int pSize) {
		this.pSize = pSize;
	}


	public int getpType() {
		return pType;
	}


	public void setpType(int pType) {
		this.pType = pType;
	}


	public String getbPrice() {
		return bPrice;
	}


	public void setbPrice(String bPrice) {
		this.bPrice = bPrice;
	}


	public String getbDate() {
		return bDate;
	}


	public void setbDate(String bDate) {
		this.bDate = bDate;
	}


	public String getInspectionCost() {
		return inspectionCost;
	}


	public void setInspectionCost(String inspectionCost) {
		this.inspectionCost = inspectionCost;
	}


	public String getCommition() {
		return commition;
	}


	public void setCommition(String commition) {
		this.commition = commition;
	}


	public String getDeliveryFee() {
		return deliveryFee;
	}


	public void setDeliveryFee(String deliveryFee) {
		this.deliveryFee = deliveryFee;
	}


	public String getbStatus() {
		return bStatus;
	}


	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}


	public String getdCheck() {
		return dCheck;
	}


	public void setdCheck(String dCheck) {
		this.dCheck = dCheck;
	}


	public String getdStep() {
		return dStep;
	}


	public void setdStep(String dStep) {
		this.dStep = dStep;
	}


	public String getdDate() {
		return dDate;
	}


	public void setdDate(String dDate) {
		this.dDate = dDate;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Bidding [bNo=" + bNo + ", pSize=" + pSize + ", pType=" + pType + ", bPrice=" + bPrice + ", bDate="
				+ bDate + ", inspectionCost=" + inspectionCost + ", commition=" + commition + ", deliveryFee="
				+ deliveryFee + ", bStatus=" + bStatus + ", dCheck=" + dCheck + ", dStep=" + dStep + ", dDate=" + dDate
				+ ", pCode=" + pCode + ", userNo=" + userNo + "]";
	}
	
	
	
	
}

