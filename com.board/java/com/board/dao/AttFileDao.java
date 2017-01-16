package com.board.dao;

import java.util.List;

import com.board.DTO.AttFile;

public interface AttFileDao {
	void addFile(AttFile file);
	String fileName(int pNo);
	void updateFile(AttFile file);
	void delFile(int fileNo);
	List<AttFile> getAttFiles(String user_id);
}
