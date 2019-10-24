package com.springproject.deploy.dto;

import javax.validation.constraints.NotEmpty;

public class DeployRequestDto {

	private Long deployNo;
	
	@NotEmpty(message = "부문은 필수 입력 값입니다.")
	private String chainId;
	
//	@NotEmpty(message = "작업유형은 필수 입력 값입니다.")
	private String workType;
//	@NotEmpty(message = "요청날짜는 필수 입력 값입니다.")
	private String requestDate;
//	@NotEmpty(message = "요청시간은 필수 입력 값입니다.")
	private String requestTime;
	private String serviceRequestId;
//	@NotEmpty(message = "요청자는 필수 입력 값입니다.")
	private String worker;
//	@NotEmpty(message = "변경내역은 필수 입력 값입니다.")
	private String modifiedContents;
	private String requester;
	private String deployer;
	private String developConfirmer;
	private String testConfirmer;
	private String productionConfirmer;
//	@NotEmpty(message = "구분은 필수 입력 값입니다.")
	private String division;
	private String chainName;
	private String statusCode;
	private String employeeName;

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

	public String getChainId() {
		return chainId;
	}

	public void setChainId(String chainId) {
		this.chainId = chainId;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public String getServiceRequestId() {
		return serviceRequestId;
	}

	public void setServiceRequestId(String serviceRequestId) {
		this.serviceRequestId = serviceRequestId;
	}

	public String getWorker() {
		return worker;
	}

	public void setWorker(String worker) {
		this.worker = worker;
	}

	public String getModifiedContents() {
		return modifiedContents;
	}

	public void setModifiedContents(String modifiedContents) {
		this.modifiedContents = modifiedContents;
	}

	public String getRequester() {
		return requester;
	}

	public void setRequester(String requester) {
		this.requester = requester;
	}

	public String getDeployer() {
		return deployer;
	}

	public void setDeployer(String deployer) {
		this.deployer = deployer;
	}

	public String getDevelopConfirmer() {
		return developConfirmer;
	}

	public void setDevelopConfirmer(String developConfirmer) {
		this.developConfirmer = developConfirmer;
	}

	public String getTestConfirmer() {
		return testConfirmer;
	}

	public void setTestConfirmer(String testConfirmer) {
		this.testConfirmer = testConfirmer;
	}

	public String getProductionConfirmer() {
		return productionConfirmer;
	}

	public void setProductionConfirmer(String productionConfirmer) {
		this.productionConfirmer = productionConfirmer;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getChainName() {
		return chainName;
	}

	public void setChainName(String chainName) {
		this.chainName = chainName;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

}
