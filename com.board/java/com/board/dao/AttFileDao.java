package com.board.dao;

import com.board.DTO.AttFile;

public interface AttFileDao {
	void addFile(AttFile file);
	String fileName(int pNo);
	void updateFile(AttFile file);
	void delFile(int fileNo);
}
