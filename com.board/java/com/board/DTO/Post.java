package com.board.DTO;

import java.sql.Date;

public class Post {
	private int spNo=0;
	private int pNo=0;
	private String userId;
	private String title;
	private String content;
	private String fileName;
	private Date date_in;
	private Date date_up;
	private int count;

	public int getSpNo() {
		return spNo;
	}
	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getDate_in() {
		return date_in;
	}
	public void setDate_in(Date date_in) {
		this.date_in = date_in;
	}
	public Date getDate_up() {
		return date_up;
	}
	public void setDate_up(Date date_up) {
		this.date_up = date_up;
	}
	@Override
	public String toString() {
		return "Post [spNo=" + spNo + ", pNo=" + pNo + ", userId=" + userId
				+ ", title=" + title + ", content=" + content + ", fileName="
				+ fileName + ", date_in=" + date_in + ", date_up=" + date_up
				+ ", count=" + count + ", getSpNo()=" + getSpNo()
				+ ", getpNo()=" + getpNo() + ", getUserId()=" + getUserId()
				+ ", getTitle()=" + getTitle() + ", getContent()="
				+ getContent() + ", getFileName()=" + getFileName()
				+ ", getCount()=" + getCount() + ", getDate_in()="
				+ getDate_in() + ", getDate_up()=" + getDate_up()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
