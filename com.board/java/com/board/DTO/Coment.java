package com.board.DTO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Coment {
	private int spNo=0;
	private int pNo=0;
	private int scNo=0;
	private int cNo=0;
	private String user_id;
	private String content;
	private Date date_in;
	private Date date_up;
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
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
}
