package com.bit.bnb.host.model;


import java.util.Date;

public class HostModel {
	
	private int bId;
	private String bUserId;
	private String bTitle;
	private String bContent;
	private Date bDate;
	


	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbUserId() {
		return bUserId;
	}

	public void setbUserId(String bUserId) {
		this.bUserId = bUserId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	@Override
	public String toString() {
		return "HostModel [bId=" + bId + ", bUserId=" + bUserId + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bDate=" + bDate + "]";
	}

	
	}
	
	

