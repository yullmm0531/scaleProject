package com.scale.admin.bidding.model.vo;

public class Bidding {
	
	private int bNo;
	private String pSize;
	private String bType;
	private int bPrice;
	private String bDate;
	private int inspectionCost;
	private int commission;
	private int deliveryFee;
	private String bStatus;
	private String dCheck;
	private String dStep;
	private String dDate;
	private String pCode;
	private String pNameKo;
	private int userNo;
	private String userId;
	
	private String storeDate;
	private String inspectionDate;
	private String shipDate;
	
	private String buyerId;
	private String sellerId;
	
	public Bidding() {
		
	}


	public Bidding(int bNo, String pSize, String bType, int bPrice, String bDate, int inspectionCost, int commission,
			int deliveryFee, String bStatus, String dCheck, String dStep, String dDate, String pCode, int userNo,
			String userId) {
		super();
		this.bNo = bNo;
		this.pSize = pSize;
		this.bType = bType;
		this.bPrice = bPrice;
		this.bDate = bDate;
		this.inspectionCost = inspectionCost;
		this.commission = commission;
		this.deliveryFee = deliveryFee;
		this.bStatus = bStatus;
		this.dCheck = dCheck;
		this.dStep = dStep;
		this.dDate = dDate;
		this.pCode = pCode;
		this.userNo = userNo;
		this.userId = userId;
	}
	
	


	public Bidding(int bNo, String pSize, String bType, int bPrice, String bDate, String bStatus, String pCode,
			String pNameKo, String userId) {
		super();
		this.bNo = bNo;
		this.pSize = pSize;
		this.bType = bType;
		this.bPrice = bPrice;
		this.bDate = bDate;
		this.bStatus = bStatus;
		this.pCode = pCode;
		this.pNameKo = pNameKo;
		this.userId = userId;
	}

	
	
	
	public Bidding(int bNo, String dStep, String storeDate, String inspectionDate,
			String shipDate, String pCode, String pNameKo, String buyerId, String sellerId) {
		super();
		this.bNo = bNo;
		this.dStep = dStep;
		this.storeDate = storeDate;
		this.inspectionDate = inspectionDate;
		this.shipDate = shipDate;
		this.pCode = pCode;
		this.pNameKo = pNameKo;
		this.buyerId = buyerId;
		this.sellerId = sellerId;
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


	public String getbType() {
		return bType;
	}


	public void setbType(String bType) {
		this.bType = bType;
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


	public int getCommission() {
		return commission;
	}


	public void setCommission(int commission) {
		this.commission = commission;
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


	public String getpNameKo() {
		return pNameKo;
	}


	public void setpNameKo(String pNameKo) {
		this.pNameKo = pNameKo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getStoreDate() {
		return storeDate;
	}


	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}


	public String getInspectionDate() {
		return inspectionDate;
	}


	public void setInspectionDate(String inspectionDate) {
		this.inspectionDate = inspectionDate;
	}


	public String getShipDate() {
		return shipDate;
	}


	public void setShipDate(String shipDate) {
		this.shipDate = shipDate;
	}


	public String getBuyerId() {
		return buyerId;
	}


	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}


	public String getSellerId() {
		return sellerId;
	}


	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}


	@Override
	public String toString() {
		return "Bidding [bNo=" + bNo + ", pSize=" + pSize + ", bType=" + bType + ", bPrice=" + bPrice + ", bDate="
				+ bDate + ", inspectionCost=" + inspectionCost + ", commission=" + commission + ", deliveryFee="
				+ deliveryFee + ", bStatus=" + bStatus + ", dCheck=" + dCheck + ", dStep=" + dStep + ", dDate=" + dDate
				+ ", pCode=" + pCode + ", userNo=" + userNo + ", userId=" + userId + "]";
	}
	
	
	
	
}
