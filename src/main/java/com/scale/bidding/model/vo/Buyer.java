package com.scale.bidding.model.vo;

public class Buyer {
	private int bNo;
	private int buyerNo;
	private String recipientName;
	private String recipientPhone;
	private String recipientZipCode;
	private String recipientAddress;
	private String recipientShippingMsg;
	private String paymentNum;
	private String paymentMethod;
	private int paymentPrice;
	
	
	public Buyer() {
		
	}


	public Buyer(int bNo, int buyerNo, String recipientName, String recipientPhone, String recipientZipCode,
			String recipientAddress, String recipientShippingMsg, String paymentNum, String paymentMethod,
			int paymentPrice) {
		super();
		this.bNo = bNo;
		this.buyerNo = buyerNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.paymentNum = paymentNum;
		this.paymentMethod = paymentMethod;
		this.paymentPrice = paymentPrice;
	}
	
	


	public Buyer(int buyerNo, String recipientName, String recipientPhone, String recipientZipCode,
			String recipientAddress, String recipientShippingMsg, String paymentNum, String paymentMethod,
			int paymentPrice) {
		super();
		this.buyerNo = buyerNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.paymentNum = paymentNum;
		this.paymentMethod = paymentMethod;
		this.paymentPrice = paymentPrice;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public int getBuyerNo() {
		return buyerNo;
	}


	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
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


	public String getPaymentNum() {
		return paymentNum;
	}


	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}


	public String getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public int getPaymentPrice() {
		return paymentPrice;
	}


	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}


	@Override
	public String toString() {
		return "Buyer [bNo=" + bNo + ", buyerNo=" + buyerNo + ", recipientName=" + recipientName + ", recipientPhone="
				+ recipientPhone + ", recipientZipCode=" + recipientZipCode + ", recipientAddress=" + recipientAddress
				+ ", recipientShippingMsg=" + recipientShippingMsg + ", paymentNum=" + paymentNum + ", paymentMethod="
				+ paymentMethod + ", paymentPrice=" + paymentPrice + "]";
	}
	
	
	
	
	
}
