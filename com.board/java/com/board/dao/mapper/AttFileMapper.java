package com.board.dao.mapper;

import java.util.HashMap;

import com.board.DTO.AttFile;

public interface AttFileMapper {
	void addFile(AttFile file);
	String fileName(HashMap<String, Integer> map);
}
