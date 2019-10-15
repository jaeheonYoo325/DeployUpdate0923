package com.springproject.deploy.dto;

public class DeployCateListDto {

	private String cateChain;
	private String cateWtype;
	private String cateReqDate;
	private String cateDivision;
	private String cateStatus;

	public String getCateChain() {
		return cateChain;
	}

	public void setCateChain(String cateChain) {
		this.cateChain = cateChain;
	}

	public String getCateWtype() {
		return cateWtype;
	}

	public void setCateWtype(String cateWtype) {
		this.cateWtype = cateWtype;
	}

	public String getCateReqDate() {
		return cateReqDate;
	}

	public void setCateReqDate(String cateReqDate) {
		this.cateReqDate = cateReqDate;
	}

	public String getCateDivision() {
		return cateDivision;
	}

	public void setCateDivision(String cateDivision) {
		this.cateDivision = cateDivision;
	}

	public String getCateStatus() {
		return cateStatus;
	}

	public void setCateStatus(String cateStatus) {
		this.cateStatus = cateStatus;
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
