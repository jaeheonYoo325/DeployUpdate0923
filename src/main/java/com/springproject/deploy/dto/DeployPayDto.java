package com.springproject.deploy.dto;

public class DeployPayDto {
	private Long deployNo;
	private String deployDrafter;
	private String deployDraftDate;
	private String deployPayRequestDate;
	private String deployPayLine;
	private String deployPayDescription;
	private String deployPayDate;
	private String deployPayLineConfirm;
	private String employeeName;
	private String codeName;
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public Long getDeployNo() {
		return deployNo;
	}
	public void setDeployNo(Long deployNo) {
		this.deployNo = deployNo;
	}
	public String getDeployDrafter() {
		return deployDrafter;
	}
	public void setDeployDrafter(String deployDrafter) {
		this.deployDrafter = deployDrafter;
	}
	public String getDeployDraftDate() {
		return deployDraftDate;
	}
	public void setDeployDraftDate(String deployDraftDate) {
		this.deployDraftDate = deployDraftDate;
	}
	public String getDeployPayRequestDate() {
		return deployPayRequestDate;
	}
	public void setDeployPayRequestDate(String deployPayRequestDate) {
		this.deployPayRequestDate = deployPayRequestDate;
	}
	public String getDeployPayLine() {
		return deployPayLine;
	}
	public void setDeployPayLine(String deployPayLine) {
		this.deployPayLine = deployPayLine;
	}
	public String getDeployPayDescription() {
		return deployPayDescription;
	}
	public void setDeployPayDescription(String deployPayDescription) {
		this.deployPayDescription = deployPayDescription;
	}
	public String getDeployPayDate() {
		return deployPayDate;
	}
	public void setDeployPayDate(String deployPayDate) {
		this.deployPayDate = deployPayDate;
	}
	public String getDeployPayLineConfirm() {
		return deployPayLineConfirm;
	}
	public void setDeployPayLineConfirm(String deployPayLineConfirm) {
		this.deployPayLineConfirm = deployPayLineConfirm;
	}
}
