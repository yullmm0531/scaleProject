package com.scale.policy.model.vo;

public class Policy {

	String policyContent;
	String modifyDate;
	String policyType;
	
	public Policy(){}

	public Policy(String policyContent, String modifyDate, String policyType) {
		super();
		this.policyContent = policyContent;
		this.modifyDate = modifyDate;
		this.policyType = policyType;
	}

	public String getPolicyContent() {
		return policyContent;
	}

	public void setPolicyContent(String policyContent) {
		this.policyContent = policyContent;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getPolicyType() {
		return policyType;
	}

	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}

	@Override
	public String toString() {
		return "Policy [policyContent=" + policyContent + ", modifyDate=" + modifyDate + ", policyType=" + policyType
				+ "]";
	}
	
}
