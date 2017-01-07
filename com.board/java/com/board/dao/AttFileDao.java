package com.board.dao;

import java.util.HashMap;

import com.board.DTO.AttFile;

public interface AttFileDao {
	void addFile(AttFile file);
	String fileName(HashMap<String, Integer> map);
}
