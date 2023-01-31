package com.scale.customerCenter.model.vo;

public class Faq {

	private int faqNo;
	private String faqQuestion;
	private String faqAnswer;
	private String createDate;
	private String modifyDate;
	private String status;
	private String category;
	private int faqWriter;
	
	public Faq() {}

	public Faq(int faqNo, String faqQuestion, String faqAnswer, String createDate, String modifyDate, String status,
			String category, int faqWriter) {
		super();
		this.faqNo = faqNo;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.category = category;
		this.faqWriter = faqWriter;
	}

	public Faq(int faqNo, String faqQuestion, String faqAnswer, String category) {
		super();
		this.faqNo = faqNo;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
		this.category = category;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqQuestion() {
		return faqQuestion;
	}

	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}

	public String getFaqAnswer() {
		return faqAnswer;
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(int faqWriter) {
		this.faqWriter = faqWriter;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqQuestion=" + faqQuestion + ", faqAnswer=" + faqAnswer + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", category=" + category
				+ ", faqWriter=" + faqWriter + "]";
	}
	
	
}
