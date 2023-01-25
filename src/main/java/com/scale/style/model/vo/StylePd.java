package com.scale.style.model.vo;

public class StylePd {
	
	private int styleNo;
	private String pdCode;

	public StylePd() {}

	public StylePd(int styleNo, String pdCode) {
		super();
		this.styleNo = styleNo;
		this.pdCode = pdCode;
	}

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}

	public String getPdCode() {
		return pdCode;
	}

	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}

	@Override
	public String toString() {
		return "StylePd [styleNo=" + styleNo + ", pdCode=" + pdCode + "]";
	}
	
}
