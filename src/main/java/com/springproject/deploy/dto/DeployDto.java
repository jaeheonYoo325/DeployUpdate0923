package com.springproject.deploy.dto;

import java.util.ArrayList;

public class DeployDto {
	private int deployNo;
	private String d_chainId;
	private String wtype;
	private String reqDate;
	private String reqTime;
	private String reqServiceId;
	private String wEmpNo;
	private String wContent;
	private String reqEmpNo;
	private String deployEmpNo;
	private String devEmpNo;
	private String testEmpNo;
	private String prdEmpNo;
	private String division;
	private String chainName;
	private ArrayList d_status;

	public ArrayList getD_status() {
		return d_status;
	}
	public void setD_status(ArrayList d_status) {
		this.d_status = d_status;
	}
	public String getChainName() {
		return chainName;
	}
	public void setChainName(String chainName) {
		this.chainName = chainName;
	}
	public int getDeployNo() {
		return deployNo;
	}
	public void setDeployNo(int deployNo) {
		this.deployNo = deployNo;
	}
	public String getD_chainId() {
		return d_chainId;
	}
	public void setD_chainId(String d_chainId) {
		this.d_chainId = d_chainId;
	}
	public String getWtype() {
		return wtype;
	}
	public void setWtype(String wtype) {
		this.wtype = wtype;
	}
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}
	public String getReqTime() {
		return reqTime;
	}
	public void setReqTime(String reqTime) {
		this.reqTime = reqTime;
	}
	public String getReqServiceId() {
		return reqServiceId;
	}
	public void setReqServiceId(String reqServiceId) {
		this.reqServiceId = reqServiceId;
	}
	public String getwEmpNo() {
		return wEmpNo;
	}
	public void setwEmpNo(String wEmpNo) {
		this.wEmpNo = wEmpNo;
	}
	public String getwContent() {
		return wContent;
	}
	public void setwContent(String wContent) {
		this.wContent = wContent;
	}
	public String getReqEmpNo() {
		return reqEmpNo;
	}
	public void setReqEmpNo(String reqEmpNo) {
		this.reqEmpNo = reqEmpNo;
	}
	public String getDeployEmpNo() {
		return deployEmpNo;
	}
	public void setDeployEmpNo(String deployEmpNo) {
		this.deployEmpNo = deployEmpNo;
	}
	public String getDevEmpNo() {
		return devEmpNo;
	}
	public void setDevEmpNo(String devEmpNo) {
		this.devEmpNo = devEmpNo;
	}
	public String getTestEmpNo() {
		return testEmpNo;
	}
	public void setTestEmpNo(String testEmpNo) {
		this.testEmpNo = testEmpNo;
	}
	public String getPrdEmpNo() {
		return prdEmpNo;
	}
	public void setPrdEmpNo(String prdEmpNo) {
		this.prdEmpNo = prdEmpNo;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
}
