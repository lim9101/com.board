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
	public String fileName(int file_no) {
		return fileDao.fileName(file_no);
	}

	@Override
	public void fileDelete(int fileNo, int pNo) {
		
		List<AttFile> attFile = fileDao.getFiles(pNo);
		for (AttFile dto : attFile) {
			String fileName = fileDao.fileName(dto.getFile_no());
			
			String saveDirectory ="C:\\" + "temp" + File.separator;
			File fe = new File(saveDirectory, fileName);
			fe.delete();
			
			fileDao.delFile(dto.getFile_no());
			
		}
		
	}
	
	public List<AttFile> getAttFiles(String user_id){
		return fileDao.getAttFiles(user_id);
	}

	@Override
	public List<AttFile> getFiles(int pNo) {
		return fileDao.getFiles(pNo);
	}

	@Override
	public void delFile(int fileNo) {
		fileDao.delFile(fileNo);		
	}
}
