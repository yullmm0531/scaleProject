package com.scale.style.model.vo;

public class Hashtag {
	
	private int hashtagNo;
	private String keyword;
	private int count;

	public Hashtag() {}

	public Hashtag(int hashtagNo, String keyword, int count) {
		super();
		this.hashtagNo = hashtagNo;
		this.keyword = keyword;
		this.count = count;
	}

	public int getHashtagNo() {
		return hashtagNo;
	}

	public void setHashtagNo(int hashtagNo) {
		this.hashtagNo = hashtagNo;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Hashtag [hashtagNo=" + hashtagNo + ", keyword=" + keyword + ", count=" + count + "]";
	}
	
}
