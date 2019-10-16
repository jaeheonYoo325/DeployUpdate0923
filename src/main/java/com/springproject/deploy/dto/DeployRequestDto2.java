package com.springproject.deploy.dto;

import com.springproject.chain.dto.ChainDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;

public class DeployRequestDto2 {
	private Long deployNo;
//	private String d_chainId;
	private ChainDto chain;
	private ModifiedProgramsDto modifiedPrograms;
	private ModifiedResourcesDto modifiedResources;
	private String workType;
	private String requestDate;
	private String requestTime;
	private String serviceRequestId;
	private String worker;
	private String modifiedContents;
	private String requester;
	private String deployer;
	private String developConfirmer;
	private String testConfirmer;
	private String productionConfirmer;
	private String division;
	private String statusCode;

	public Long getDeployNo() {
		return deployNo;
	}

	public void setDeployNo(Long deployNo) {
		this.deployNo = deployNo;
	}

	public ChainDto getChain() {
		return chain;
	}

	public void setChain(ChainDto chain) {
		this.chain = chain;
	}

	public ModifiedProgramsDto getModifiedPrograms() {
		return modifiedPrograms;
	}

	public void setModifiedPrograms(ModifiedProgramsDto modifiedPrograms) {
		this.modifiedPrograms = modifiedPrograms;
	}

	public ModifiedResourcesDto getModifiedResources() {
		return modifiedResources;
	}

	public void setModifiedResources(ModifiedResourcesDto modifiedResources) {
		this.modifiedResources = modifiedResources;
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

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

}
