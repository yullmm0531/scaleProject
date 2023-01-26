package com.scale.product.model.vo;

import java.sql.Date;

public class Product {

	private String productCode;
	private String productNameKo;
	private String productNameEng;
	private String modelCode;
	private String blindCheck;
	private String productImgM;
	private Date enrollDate;
	private String productCategory;
	private String productSize;
	private int brandCode;
	
	private String brandName;

	private String color;
	private Date releaseDate;
	private int releasePrice;
	
	private String releasePriceView;
	
	
	
	public String getBrandName() {
		return brandName;
	}


	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}


	public Product() {}


	public Product(String productCode, String productNameKo, String productNameEng, String modelCode, String blindCheck,
			String productImgM, Date enrollDate, String productCategory, String productSize, int brandCode,
			String color, Date releaseDate, int releasePrice) {
		super();
		this.productCode = productCode;
		this.productNameKo = productNameKo;
		this.productNameEng = productNameEng;
		this.modelCode = modelCode;
		this.blindCheck = blindCheck;
		this.productImgM = productImgM;
		this.enrollDate = enrollDate;
		this.productCategory = productCategory;
		this.productSize = productSize;
		this.brandCode = brandCode;
		this.color = color;
		this.releaseDate = releaseDate;
		this.releasePrice = releasePrice;
	}

	public Product(String productCode, String productNameKo, String productNameEng, String modelCode,
			String productImgM, String productSize, String brandName, String color, Date releaseDate,
			String releasePriceView) {
		super();
		this.productCode = productCode;
		this.productNameKo = productNameKo;
		this.productNameEng = productNameEng;
		this.modelCode = modelCode;
		this.productImgM = productImgM;
		this.productSize = productSize;
		this.brandName = brandName;
		this.color = color;
		this.releaseDate = releaseDate;
		this.releasePriceView = releasePriceView;
	}
	

	public String getProductCode() {
		return productCode;
	}


	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}


	public String getProductNameKo() {
		return productNameKo;
	}


	public void setProductNameKo(String productNameKo) {
		this.productNameKo = productNameKo;
	}


	public String getProductNameEng() {
		return productNameEng;
	}


	public void setProductNameEng(String productNameEng) {
		this.productNameEng = productNameEng;
	}


	public String getModelCode() {
		return modelCode;
	}


	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}


	public String getBlindCheck() {
		return blindCheck;
	}


	public void setBlindCheck(String blindCheck) {
		this.blindCheck = blindCheck;
	}


	public String getProductImgM() {
		return productImgM;
	}


	public void setProductImgM(String productImgM) {
		this.productImgM = productImgM;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getProductCategory() {
		return productCategory;
	}


	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	public String getProductSize() {
		return productSize;
	}


	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}


	public int getBrandCode() {
		return brandCode;
	}


	public void setBrandCode(int brandCode) {
		this.brandCode = brandCode;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public Date getReleaseDate() {
		return releaseDate;
	}


	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}


	public int getReleasePrice() {
		return releasePrice;
	}


	public void setReleasePrice(int releasePrice) {
		this.releasePrice = releasePrice;
	}
	
	

	public String getReleasePriceView() {
		return releasePriceView;
	}


	public void setReleasePriceView(String releasePriceView) {
		this.releasePriceView = releasePriceView;
	}


	@Override
	public String toString() {
		return "Product [productCode=" + productCode + ", productNameKo=" + productNameKo + ", productNameEng="
				+ productNameEng + ", modelCode=" + modelCode + ", blindCheck=" + blindCheck + ", productImgM="
				+ productImgM + ", enrollDate=" + enrollDate + ", productCategory=" + productCategory + ", productSize="
				+ productSize + ", brandCode=" + brandCode + ", color=" + color + ", releaseDate=" + releaseDate
				+ ", releasePrice=" + releasePrice + "]";
	}
	
	
	
	
}
