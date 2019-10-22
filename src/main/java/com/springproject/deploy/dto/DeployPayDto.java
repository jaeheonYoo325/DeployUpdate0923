package com.springproject.deploy.dto;

public class DeployPayDto {
	private Long deployNo;
	private String deployDrafter;
	private String deployDraftDate;
	private String deployPayDetail;
	private String deployPayer;
	private String DeployPayRequestDate;
	private String deployPayDate;
	private String employeeName;
	private String deployDoingPayer;

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

	public String getDeployPayDetail() {
		return deployPayDetail;
	}

	public void setDeployPayDetail(String deployPayDetail) {
		this.deployPayDetail = deployPayDetail;
	}

	public String getDeployPayer() {
		return deployPayer;
	}

	public void setDeployPayer(String deployPayer) {
		this.deployPayer = deployPayer;
	}

	public String getDeployPayRequestDate() {
		return DeployPayRequestDate;
	}

	public void setDeployPayRequestDate(String deployPayRequestDate) {
		DeployPayRequestDate = deployPayRequestDate;
	}

	public String getDeployPayDate() {
		return deployPayDate;
	}

	public void setDeployPayDate(String deployPayDate) {
		this.deployPayDate = deployPayDate;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getDeployDoingPayer() {
		return deployDoingPayer;
	}

	public void setDeployDoingPayer(String deployDoingPayer) {
		this.deployDoingPayer = deployDoingPayer;
	}

}
