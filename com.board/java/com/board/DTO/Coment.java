package com.board.DTO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Coment {
	private int spNo=0;
	private int pNo=0;
	private int scNo=0;
	private int cNo=0;
	private String userId;
	private String content;
	private Date dateIn;
	private Date dateUp;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getDateIn() {
		return dateIn;
	}
	public void setDateIn(Date dateIn) {
		this.dateIn = dateIn;
	}
	public Date getDateUp() {
		return dateUp;
	}
	public void setDateUp(Date dateUp) {
		this.dateUp = dateUp;
	}
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
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Coment [spNo=" + spNo + ", pNo=" + pNo + ", scNo=" + scNo
				+ ", cNo=" + cNo + ", userId=" + userId + ", content="
				+ content + ", dateIn=" + dateIn + ", dateUp=" + dateUp + "]";
	}
	
}
