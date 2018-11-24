package com.bit.bnb.host.model;

import java.util.Date;

public class CommentModel {
	
	 private int cno;
	 private int bId;
	 private String content;
	 private String writer;
	 private Date reg_date;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "CommentModel [cno=" + cno + ", bId=" + bId + ", content=" + content + ", writer=" + writer
				+ ", reg_date=" + reg_date + "]";
	}
	 

}
