package com.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.DTO.AttFile;
import com.board.dao.mapper.AttFileMapper;
@Repository
public class AttFileDaoImpl implements AttFileDao {
	
	@Autowired
	private AttFileMapper fileMapper;
	
	@Override
	public void addFile(AttFile file) {
		fileMapper.addFile(file);
	}

	@Override
	public String fileName(int pNo) {
		return fileMapper.fileName(pNo);
	}

	@Override
	public void updateFile(AttFile file) {
		fileMapper.updateFile(file);		
	}

	@Override
	public void delFile(int fileNo) {
		fileMapper.delFile(fileNo);
	}

	@Override
	public List<AttFile> getAttFiles(String user_id) {
		return fileMapper.getAttFiles(user_id);
	}

	@Override
	public List<AttFile> getFiles(int pNo) {
		return fileMapper.getFiles(pNo);
	}
	
	

}
