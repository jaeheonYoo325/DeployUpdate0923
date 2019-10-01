package com.springproject.program.dto;

public class ProgramTableDto {

	private String pageId;
	private String pageName;
	private String p_chainId;
    private String paramChainId;
	public String getParamChainId() {
		return paramChainId;
	}

	public void setParamChainId(String paramChainId) {
		this.paramChainId = paramChainId;
	}

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

	public String getP_chainId() {
		return p_chainId;
	}

	public void setP_chainId(String p_chainId) {
		this.p_chainId = p_chainId;
	}



}
