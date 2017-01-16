package com.board.service;

import java.util.List;

import com.board.DTO.AttFile;


public interface AttFileService {
	String fileName(int file_no);
	void fileDelete(int fileNo, int pNo);
	List<AttFile> getAttFiles(String user_id);
	List<AttFile> getFiles(int pNo);
	void delFile(int fileNo);
}
