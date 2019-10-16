package com.springproject.deploy.dto;

public class CategoryTypeDto {

	private String categoryChain;
	private String categoryWorktype;
	private String categoryRequestDate;
	private String categoryDivision;
	private String categoryStatus;



	public String getCategoryChain() {
		return categoryChain;
	}

	public void setCategoryChain(String catetoryChain) {
		this.categoryChain = catetoryChain;
	}

	public String getCategoryWorktype() {
		return categoryWorktype;
	}

	public void setCategoryWorktype(String categoryWorktype) {
		this.categoryWorktype = categoryWorktype;
	}

	public String getCategoryRequestDate() {
		return categoryRequestDate;
	}

	public void setCategoryRequestDate(String categoryRequestDate) {
		this.categoryRequestDate = categoryRequestDate;
	}

	public String getCategoryDivision() {
		return categoryDivision;
	}

	public void setCategoryDivision(String categoryDivision) {
		this.categoryDivision = categoryDivision;
	}

	public String getCategoryStatus() {
		return categoryStatus;
	}

	public void setCategoryStatus(String categoryStatus) {
		this.categoryStatus = categoryStatus;
	}

	public String getCateWtypeString() {
		return "CTGY_WTYPE";
	}

	public String getCateReqDateString() {
		return "CTGY_REQDATE";
	}

	public String getCateDivisionString() {
		return "CTGY_DIVISION";
	}

	public String getCateStatusString() {
		return "CTGY_STATUS";
	}

	public String getCateChainString() {
		return "CTGY_CHAIN";
	}
}
