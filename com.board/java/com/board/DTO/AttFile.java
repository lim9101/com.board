package com.board.DTO;

import org.springframework.web.multipart.MultipartFile;

public class AttFile {
	private int file_no;
	private int spNo;
	private int pNo;
	private String file_name;
	private MultipartFile upload;
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
}
