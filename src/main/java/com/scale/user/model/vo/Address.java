package com.scale.user.model.vo;

public class Address {

	private int addresNo;
	private String zipCode;
	private String address1;
	private String address2;
	private String defaultAdd;
	private String addWriter;
	
	public Address() {}
	
	public Address(int addresNo, String zipCode, String address1, String address2, String defaultAdd,
			String addWriter) {
		super();
		this.addresNo = addresNo;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.defaultAdd = defaultAdd;
		this.addWriter = addWriter;
	}

	
	public Address(String zipCode, String address1, String address2) {
		super();
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
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
