package com.scale.product.model.vo;

public class Brand {

	private int brandCode;
	private String brandName;
	private String brandImg;

	public Brand() {}

	public Brand(int brandCode, String brandName, String brandImg) {
		super();
		this.brandCode = brandCode;
		this.brandName = brandName;
		this.brandImg = brandImg;
	}

	public int getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(int brandCode) {
		this.brandCode = brandCode;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandImg() {
		return brandImg;
	}

	public void setBrandImg(String brandImg) {
		this.brandImg = brandImg;
	}

	@Override
	public String toString() {
		return "Brand [brandCode=" + brandCode + ", brandName=" + brandName + ", brandImg=" + brandImg + "]";
	}
	
}
