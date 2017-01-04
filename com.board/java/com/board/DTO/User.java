package com.board.DTO;

public class User {

	private String userId;
	private String userPw;
	private String userName;
	private String email;
	private String phone;
	private int addNo;
	private String addD;
	private char gender;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public String getAddD() {
		return addD;
	}
	public void setAddD(String addD) {
		this.addD = addD;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName="
				+ userName + ", email=" + email + ", phone=" + phone
				+ ", addNo=" + addNo + ", addD=" + addD + ", gender=" + gender
				+ ", getUserId()=" + getUserId() + ", getUserPw()="
				+ getUserPw() + ", getUserName()=" + getUserName()
				+ ", getEmail()=" + getEmail() + ", getPhone()=" + getPhone()
				+ ", getAddNo()=" + getAddNo() + ", getAddD()=" + getAddD()
				+ ", getGender()=" + getGender() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
