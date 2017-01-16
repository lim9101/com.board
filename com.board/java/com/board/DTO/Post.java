/*package com.board.DTO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Post {
	private int spNo=0;
	private int pNo;
	private String user_id;
	private String title;
	private String content;
	private Date date_in;
	private Date date_up;
	private int count;
	private int plevel=0;
	private int depth=0;
	private int kind=0;
	private int tspNo=0;
	private MultipartFile upload;
	private AttFile attFile;
	private User user;

	public int getTspNo() {
		return tspNo;
	}
	public void setTspNo(int tspNo) {
		this.tspNo = tspNo;
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
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public AttFile getAttFile() {
		return attFile;
	}
	public void setAttFile(AttFile attFile) {
		this.attFile = attFile;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getPlevel() {
		return plevel;
	}
	public void setPlevel(int plevel) {
		this.plevel = plevel;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "Post [spNo=" + spNo + ", pNo=" + pNo + ", user_id=" + user_id
				+ ", title=" + title + ", content=" + content + ", date_in="
				+ date_in + ", date_up=" + date_up + ", count=" + count
				+ ", plevel=" + plevel + ", depth=" + depth + ", kind=" + kind
				+ ", tspNo=" + tspNo + ", upload=" + upload + ", attFile="
				+ attFile + ", user=" + user + "]";
	}
	
	
}*/

package com.board.DTO;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Post {
	private int spNo=0;
	private int pNo;
	private String user_id;
	private String title;
	private String content;
	private Date date_in;
	private Date date_up;
	private int count;
	private int plevel=0;
	private int depth=0;
	private int kind=0;
	private int tspNo=0;
	private List<MultipartFile> upload;
	private AttFile attFile;
	private User user;

	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
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
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	
	public AttFile getAttFile() {
		return attFile;
	}
	public void setAttFile(AttFile attFile) {
		this.attFile = attFile;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getPlevel() {
		return plevel;
	}
	public void setPlevel(int plevel) {
		this.plevel = plevel;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getTspNo() {
		return tspNo;
	}
	public void setTspNo(int tspNo) {
		this.tspNo = tspNo;
	}
	@Override
	public String toString() {
		return "Post [spNo=" + spNo + ", pNo=" + pNo + ", user_id=" + user_id
				+ ", title=" + title + ", content=" + content + ", date_in="
				+ date_in + ", date_up=" + date_up + ", count=" + count
				+ ", plevel=" + plevel + ", depth=" + depth + ", kind=" + kind
				+ ", tspNo=" + tspNo + ", upload=" + upload + ", attFile="
				+ attFile + ", user=" + user + "]";
	}
	
}
