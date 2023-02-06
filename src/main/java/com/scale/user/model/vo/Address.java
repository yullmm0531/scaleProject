package com.scale.user.model.vo;

public class Address {

	private int addresNo;
	private String zipCode;
	private String address1;
	private String address2;
	private String recipient;
	private String phone;
	private String defaultAdd;
	private String addWriter;
	
	private int userNo;
	
	public Address(int addresNo, String zipCode, String address1, String address2, String recipient, int userNo, String defaultAdd) {
		super();
		this.addresNo = addresNo;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.recipient = recipient;
		this.phone = phone;
		this.userNo = userNo;
		this.defaultAdd = defaultAdd;
	}
	
	

	
	public Address(int addresNo, String zipCode, String address1, String address2, String recipient, String phone,
			String defaultAdd, String addWriter) {
		super();
		this.addresNo = addresNo;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.recipient = recipient;
		this.phone = phone;
		this.defaultAdd = defaultAdd;
		this.addWriter = addWriter;
	}




	public Address(String zipCode, String recipient, String phone, String address1, String address2) {
		super();
		this.zipCode = zipCode;
		this.recipient = recipient;
		this.phone = phone;
		this.address1 = address1;
		this.address2 = address2;
	}
	
	

	public Address(int addresNo, String zipCode, String address1, String address2, String recipient, String phone) {
		super();
		this.addresNo = addresNo;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.recipient = recipient;
		this.phone = phone;
	}
	
	

	public Address(String zipCode, String address1, String address2, String recipient, String phone, String defaultAdd,
			int userNo) {
		super();
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.recipient = recipient;
		this.phone = phone;
		this.defaultAdd = defaultAdd;
		this.userNo = userNo;
	}

	
	




	public Address(int addresNo, String zipCode, String address1, String address2, String recipient, String phone
			,int userNo, String defaultAdd) {
		super();
		this.addresNo = addresNo;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.recipient = recipient;
		this.phone = phone;
		this.userNo = userNo;
		this.defaultAdd = defaultAdd;
	}


	

	




	public Address(String zipCode, int addresNo, String address1, String address2, String recipient, String phone, int userNo) {
		super();
		
		this.zipCode = zipCode;
		this.addresNo = addresNo;
		this.address1 = address1;
		this.address2 = address2;
		this.recipient = recipient;
		this.phone = phone;
		this.userNo = userNo;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public int getAddresNo() {
		return addresNo;
	}

	public void setAddresNo(int addresNo) {
		this.addresNo = addresNo;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDefaultAdd() {
		return defaultAdd;
	}

	public void setDefaultAdd(String defaultAdd) {
		this.defaultAdd = defaultAdd;
	}

	public String getAddWriter() {
		return addWriter;
	}

	public void setAddWriter(String addWriter) {
		this.addWriter = addWriter;
	}

	@Override
	public String toString() {
		return "Address [addresNo=" + addresNo + ", zipCode=" + zipCode + ", address1=" + address1 + ", address2="
				+ address2 + ", defaultAdd=" + defaultAdd + ", addWriter=" + addWriter + "]";
	}
	
	
	
	
}
