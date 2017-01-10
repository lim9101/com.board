package com.board.dao.mapper;

import com.board.DTO.AttFile;

public interface AttFileMapper {
	void addFile(AttFile file);
	String fileName(int pNo);
	void updateFile(AttFile file);
	void delFile(int fileNo);
}
