package com.scale.bidding.model.vo;

public class Seller {
	private int bNo;
	private int sellerNo;
	private String recipientName;
	private String recipientPhone;
	private String recipientZipCode;
	private String recipientAddress;
	private String recipientShippingMsg;
	private String bankName;
	private String bankAccount;
	private String bankAccountOwner;
	private int adjustmentPrice;
	
	public Seller() {
		
	}

	public Seller(int bNo, int sellerNo, String recipientName, String recipientPhone, String recipientZipCode,
			String recipientAddress, String recipientShippingMsg, String bankName, String bankAccount,
			String bankAccountOwner, int adjustmentPrice) {
		super();
		this.bNo = bNo;
		this.sellerNo = sellerNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankAccountOwner = bankAccountOwner;
		this.adjustmentPrice = adjustmentPrice;
	}
	
	

	public Seller(int sellerNo, String recipientName, String recipientPhone, String recipientZipCode,
			String recipientAddress, String recipientShippingMsg, String bankName, String bankAccount,
			String bankAccountOwner, int adjustmentPrice) {
		super();
		this.sellerNo = sellerNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientZipCode = recipientZipCode;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankAccountOwner = bankAccountOwner;
		this.adjustmentPrice = adjustmentPrice;
	}
	
	

	public Seller(String recipientName, String recipientPhone, String recipientAddress, String recipientShippingMsg,
			String bankName, String bankAccount, String bankAccountOwner, int adjustmentPrice) {
		super();
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientAddress = recipientAddress;
		this.recipientShippingMsg = recipientShippingMsg;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.bankAccountOwner = bankAccountOwner;
		this.adjustmentPrice = adjustmentPrice;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
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

	public void setrecipientShippingMsg(String recipientShippingMsg) {
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

	public String getBankAccountOwner() {
		return bankAccountOwner;
	}

	public void setBankAccountOwner(String bankAccountOwner) {
		this.bankAccountOwner = bankAccountOwner;
	}

	public int getAdjustmentPrice() {
		return adjustmentPrice;
	}

	public void setAdjustmentPrice(int adjustmentPrice) {
		this.adjustmentPrice = adjustmentPrice;
	}

	@Override
	public String toString() {
		return "Seller [bNo=" + bNo + ", sellerNo=" + sellerNo + ", recipientName=" + recipientName
				+ ", recipientPhone=" + recipientPhone + ", recipientZipCode=" + recipientZipCode
				+ ", recipientAddress=" + recipientAddress + ", recipientShippingMsg=" + recipientShippingMsg
				+ ", bankName=" + bankName + ", bankAccount=" + bankAccount + ", bankAccountOwner=" + bankAccountOwner
				+ ", adjustmentPrice=" + adjustmentPrice + "]";
	}

	
	
	
}


