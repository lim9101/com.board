package com.board.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.AttFileDao;

@Service
public class AttFileServiceImpl implements AttFileService {
	
	@Autowired
	private AttFileDao fileDao;

	@Override
	public String fileName(HashMap<String, Integer> map) {
		return fileDao.fileName(map);
	}
}
