package com.springproject.wprogramtable.dto;

import java.util.ArrayList;
import java.util.List;

public class WProgramTableDto {
	private String wProNo_pageId;
	private int wProNo_deployNo;
	public String getwProNo_pageId() {
		return wProNo_pageId;
	}
	public void setwProNo_pageId(String wProNo_pageId) {
		this.wProNo_pageId = wProNo_pageId;
	}
	public int getwProNo_deployNo() {
		return wProNo_deployNo;
	}
	public void setwProNo_deployNo(int wProNo_deployNo) {
		this.wProNo_deployNo = wProNo_deployNo;
	}
}
