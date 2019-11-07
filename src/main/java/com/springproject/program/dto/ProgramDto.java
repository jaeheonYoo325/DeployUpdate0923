package com.springproject.program.dto;

import javax.validation.constraints.NotEmpty;

public class ProgramDto {
	@NotEmpty(message = "프로그램번호는 필수 입력값입니다")
	private String pageId;
	@NotEmpty(message = "프로그램이름은 필수 입력값입니다")
	private String pageName;
	private String chainId;
	private String selectedchainId;

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getChainId() {
		return chainId;
	}

	public void setChainId(String chainId) {
		this.chainId = chainId;
	}

	public String getSelectedchainId() {
		return selectedchainId;
	}

	public void setSelectedchainId(String selectedchainId) {
		this.selectedchainId = selectedchainId;
	}

}
