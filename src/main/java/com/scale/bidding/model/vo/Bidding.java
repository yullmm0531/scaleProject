package com.scale.bidding.model.vo;

public class Bidding {
	
	private int bNo;
	private String pSize;
	private int pType;
	private int bPrice;
	private String bDate;
	private int inspectionCost;
	private int commition;
	private int deliveryFee;
	private String bStatus;
	private String dCheck;
	private String dStep;
	private String dDate;
	private String pCode;
	private int userNo;
	
	private int count;
	
	private String biddingPrice;
	
	public Bidding() {
		
	}


	public Bidding(int bNo, String pSize, int pType, int bPrice, String bDate, int inspectionCost, int commition,
			int deliveryFee, String bStatus, String dCheck, String dStep, String dDate, String pCode, int userNo) {
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
	
	

	
	public Bidding(String pSize, int bPrice) {
		super();
		this.pSize = pSize;
		this.bPrice = bPrice;
	}


	public Bidding(int bNo, String pSize, int bPrice, String dDate) {
		super();
		this.bNo = bNo;
		this.pSize = pSize;
		this.bPrice = bPrice;
		this.dDate = dDate;
	}

	
	public Bidding(String pSize, String biddingPrice) {
		super();
		this.pSize = pSize;
		this.biddingPrice = biddingPrice;
	}
	


	public Bidding(int bNo, String pCode, String pSize, int bPrice, int deliveryFee) {
		super();
		this.bNo = bNo;
		this.pCode = pCode;
		this.pSize = pSize;
		this.bPrice = bPrice;
		this.deliveryFee = deliveryFee;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Bidding(String pSize, int bPrice, int count) {
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


	public String getpSize() {
		return pSize;
	}


	public void setpSize(String pSize) {
		this.pSize = pSize;
	}


	public int getpType() {
		return pType;
	}


	public void setpType(int pType) {
		this.pType = pType;
	}


	public int getbPrice() {
		return bPrice;
	}


	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}


	public String getbDate() {
		return bDate;
	}


	public void setbDate(String bDate) {
		this.bDate = bDate;
	}


	public int getInspectionCost() {
		return inspectionCost;
	}


	public void setInspectionCost(int inspectionCost) {
		this.inspectionCost = inspectionCost;
	}


	public int getCommition() {
		return commition;
	}


	public void setCommition(int commition) {
		this.commition = commition;
	}


	public int getDeliveryFee() {
		return deliveryFee;
	}


	public void setDeliveryFee(int deliveryFee) {
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

	
	public String getBiddingPrice() {
		return biddingPrice;
	}


	public void setBiddingPrice(String biddingPrice) {
		this.biddingPrice = biddingPrice;
	}


	@Override
	public String toString() {
		return "Bidding [bNo=" + bNo + ", pSize=" + pSize + ", pType=" + pType + ", bPrice=" + bPrice + ", bDate="
				+ bDate + ", inspectionCost=" + inspectionCost + ", commition=" + commition + ", deliveryFee="
				+ deliveryFee + ", bStatus=" + bStatus + ", dCheck=" + dCheck + ", dStep=" + dStep + ", dDate=" + dDate
				+ ", pCode=" + pCode + ", userNo=" + userNo + "]";
	}
	
	
	
	
}

