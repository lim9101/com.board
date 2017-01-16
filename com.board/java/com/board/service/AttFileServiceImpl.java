package com.board.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.DTO.AttFile;
import com.board.dao.AttFileDao;
import com.board.dao.PostDao;

@Service
public class AttFileServiceImpl implements AttFileService {
	
	@Autowired
	private PostDao postDao;
	
	@Autowired
	private AttFileDao fileDao;

	@Override
	public String fileName(int pNo) {
		return fileDao.fileName(pNo);
	}

	@Override
	public void fileDelete(int fileNo, int pNo) {
		String fileName = fileDao.fileName(pNo);
		
		String saveDirectory ="C:\\" + "temp" + File.separator;
		File fe = new File(saveDirectory, fileName);
		fe.delete();
		
		fileDao.delFile(fileNo);
	}
	
	public List<AttFile> getAttFiles(String user_id){
		return fileDao.getAttFiles(user_id);
	}
}
