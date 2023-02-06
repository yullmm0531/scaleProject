package com.scale.bidding.model.vo;

import java.sql.Date;

public class Bidding {
	
	private int bNo;
	private String pSize;
	private int bType;
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
	private int userNo;
	
	private int count;
	
	private String biddingPrice;
	private String productImg;
	
	private int productSize;
	private Date biddingDate;
	
	private String recipientName;
	private String recipientPhone;
	private String recipientZipCode;
	private String recipientAddress;
	private String recipientShippingMsg;
	private String bankName;
	private String bankAccount;
	private String bankOwnerName;
	private String adjustmentPrice;
	private String productImgM;
	private String productNameEng;
	private String productNameKo;
	private String dealCheck;
	private Date dealDate;
	private String paymentNo;
	private String paymentPrice;
	private String paymentMethod;
	
	public Bidding() {
		
	}


	public Bidding(int bNo, String pSize, int bType, int bPrice, String bDate, int inspectionCost, int commission,
			int deliveryFee, String bStatus, String dCheck, String dStep, String dDate, String pCode, int userNo) {
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
	
	public Bidding(int bNo, String pCode, String pSize, int bPrice, int inspectionCost, int commission) {
		super();
		this.bNo = bNo;
		this.pCode = pCode;
		this.pSize = pSize;
		this.bPrice = bPrice;
		this.inspectionCost = inspectionCost;
		this.commission = commission;
	}
	
	


	public Bidding(int bNo, int bPrice, int inspectionCost, int commission, int deliveryFee, String productImg) {
		super();
		this.bNo = bNo;
		this.bPrice = bPrice;
		this.inspectionCost = inspectionCost;
		this.commission = commission;
		this.deliveryFee = deliveryFee;
		this.productImg = productImg;
	}
	
	
	public Bidding(int bNo, int bPrice, int inspectionCost, int commission, String productImg) {
		super();
		this.bNo = bNo;
		this.bPrice = bPrice;
		this.inspectionCost = inspectionCost;
		this.commission = commission;
		this.productImg = productImg;
	}
	
	



	public Bidding(int productSize, String biddingPrice, Date biddingDate, int inspectionCost, int commission, int deliveryFee,
			int userNo, String recipientName, String recipientPhone, String recipientZipCode, String recipientAddress,
			String recipientShippingMsg, String bankName, String bankAccount, String bankOwnerName,
			String adjustmentPrice, String productImgM, String productNameEng, String productNameKo, String dealCheck) {
		super();
		this.productSize = productSize;
		this.biddingPrice = biddingPrice;
		this.biddingDate = biddingDate;
		this.inspectionCost = inspectionCost;
		this.commission = commission;
		this.deliveryFee = deliveryFee;
		this.userNo = userNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankOwnerName = bankOwnerName;
		this.adjustmentPrice = adjustmentPrice;
		this.productImgM = productImgM;
		this.productNameEng = productNameEng;
		
		this.productNameKo = productNameKo;
		this.dealCheck = dealCheck;
	}
	
	public Bidding(String biddingPrice, Date biddingDate, int inspectionCost, int commission, String recipientName, String recipientPhone, String recipientZipCode,
			String recipientAddress,String recipientShippingMsg, Date dealDate, String bankName, String bankAccount, String bankOwnerName, String adjustmentPrice) {
				super();
				
				this.biddingPrice = biddingPrice;
				this.biddingDate = biddingDate;
				this.inspectionCost = inspectionCost;
				this.commission = commission;
				this.recipientName = recipientName;
				this.recipientPhone = recipientPhone;
				this.recipientZipCode = recipientZipCode;
				this.recipientAddress = recipientAddress;
				this.recipientShippingMsg = recipientShippingMsg;
				this.dealDate = dealDate;
				this.bankName = bankName;
				this.bankAccount = bankAccount;
				this.bankOwnerName = bankOwnerName;
				this.adjustmentPrice = adjustmentPrice;
				
				}
	
	public Bidding(String biddingPrice, Date biddingDate, int inspectionCost, int commission, String recipientName, String recipientPhone, String recipientZipCode,
					String recipientAddress,String recipientShippingMsg, Date dealDate, String bankName, String bankAccount, String bankOwnerName, String adjustmentPrice,
					String paymentNo) {
		super();
		
		this.biddingPrice = biddingPrice;
		this.biddingDate = biddingDate;
		this.inspectionCost = inspectionCost;
		this.commission = commission;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.dealDate = dealDate;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankOwnerName = bankOwnerName;
		this.adjustmentPrice = adjustmentPrice;
		this.paymentNo = paymentNo;
	}
	
	
	

	public Bidding(String paymentPrice, Date dealDate, int deliveryFee, String biddingPrice, String recipientName, String recipientPhone,
			String recipientZipCode, String recipientAddress, String recipientShippingMsg,
			String paymentMethod, String paymentNo) {
		super();
		this.paymentPrice = paymentPrice;
		this.dealDate = dealDate;
		this.deliveryFee = deliveryFee;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.paymentMethod = paymentMethod;
		this.paymentNo = paymentNo;
	}
	
	


	public String getPaymentPrice() {
		return paymentPrice;
	}


	public void setPaymentPrice(String paymentPrice) {
		this.paymentPrice = paymentPrice;
	}


	public String getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public String getPaymentNo() {
		return paymentNo;
	}


	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}


	public Date getDealDate() {
		return dealDate;
	}


	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}


	public int getProductSize() {
		return productSize;
	}


	public void setProductSize(int productSize) {
		this.productSize = productSize;
	}


	public Date getBiddingDate() {
		return biddingDate;
	}


	public void setBiddingDate(Date biddingDate) {
		this.biddingDate = biddingDate;
	}


	public String getProductNameKo() {
		return productNameKo;
	}


	public void setProductNameKo(String productNameKo) {
		this.productNameKo = productNameKo;
	}


	public String getDealCheck() {
		return dealCheck;
	}


	public void setDealCheck(String dealCheck) {
		this.dealCheck = dealCheck;
	}


	public String getRecipientName() {
		return recipientName;
	}


	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}


	public String getRecipientPhone() {
		return recipientPhone;
	}


	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}


	public String getRecipientZipCode() {
		return recipientZipCode;
	}


	public void setRecipientZipCode(String recipientZipCode) {
		this.recipientZipCode = recipientZipCode;
	}


	public String getRecipientAddress() {
		return recipientAddress;
	}


	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}


	public String getRecipientShippingMsg() {
		return recipientShippingMsg;
	}


	public void setRecipientShippingMsg(String recipientShippingMsg) {
		this.recipientShippingMsg = recipientShippingMsg;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getBankAccount() {
		return bankAccount;
	}


	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}


	public String getBankOwnerName() {
		return bankOwnerName;
	}


	public void setBankOwnerName(String bankOwnerName) {
		this.bankOwnerName = bankOwnerName;
	}


	public String getAdjustmentPrice() {
		return adjustmentPrice;
	}


	public void setAdjustmentPrice(String adjustmentPrice) {
		this.adjustmentPrice = adjustmentPrice;
	}


	public String getProductImgM() {
		return productImgM;
	}


	public void setProductImgM(String productImgM) {
		this.productImgM = productImgM;
	}


	public String getProductNameEng() {
		return productNameEng;
	}


	public void setProductNameEng(String productNameEng) {
		this.productNameEng = productNameEng;
	}
	public Bidding(int bNo, int bPrice, int deliveryFee, String productImg) {
		super();
		this.bNo = bNo;
		this.bPrice = bPrice;
		this.deliveryFee = deliveryFee;
		this.productImg = productImg;

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


	public int getbType() {
		return bType;
	}


	public void setbType(int bType) {
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
	

	public String getProductImg() {
		return productImg;
	}


	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}


	@Override
	public String toString() {
		return "Bidding [bNo=" + bNo + ", pSize=" + pSize + ", bType=" + bType + ", bPrice=" + bPrice + ", bDate="
				+ bDate + ", inspectionCost=" + inspectionCost + ", commission=" + commission + ", deliveryFee="
				+ deliveryFee + ", bStatus=" + bStatus + ", dCheck=" + dCheck + ", dStep=" + dStep + ", dDate=" + dDate
				+ ", pCode=" + pCode + ", userNo=" + userNo + "]";
	}
	
	
	
	
}

