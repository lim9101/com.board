package com.board.service;

import java.util.List;

import com.board.DTO.AttFile;


public interface AttFileService {
	String fileName(int pNo);
	void fileDelete(int fileNo, int pNo);
	List<AttFile> getAttFiles(String user_id);
}
