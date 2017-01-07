package com.board.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.board.DTO.AttFile;
import com.board.DTO.Post;
import com.board.dao.AttFileDao;
import com.board.dao.PostDao;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostDao postDao;
	
	@Autowired
	private AttFileDao fileDao;

	
	//공지 글 추가
	@Override
	public boolean postWrite(Post post, HttpServletRequest request){
		int pno = postDao.maxPost()+1;
		//MultipartFile file = post.getUpload();
		post.setpNo(pno);
		postDao.addPost(post);
		
		MultipartFile sendFile = post.getUpload();
		
		//전송하는 파일이 있으면
		if(!sendFile.isEmpty()){
			//getOriginalFilename() 파일명 추출
			String fileName = sendFile.getOriginalFilename();
			//랜덤 수 발생
			UUID random = UUID.randomUUID();
			String saveDirectory ="C:\\" + "temp" + File.separator;
			File fe = new File(saveDirectory);
			
			if (!fe.exists()) {
				fe.mkdirs();
			} // end if
			File ff = new File(saveDirectory, random + "_" + fileName);
			
			try {
				FileCopyUtils.copy(sendFile.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			AttFile file = new AttFile();
			file.setpNo(pno);
			file.setSpNo(0);
			file.setFile_name(random+"_"+fileName);
			fileDao.addFile(file);
		}
		return true;
	}//end postWrite
	
	public boolean postUpdate(Post post){
		
		return postDao.updatePost(post)>0;
	}

	@Override
	public List<Post> postList() {
		return postDao.listPost();
	}

	@Override
	public Post postView(HashMap<String, Integer> map) {
		return postDao.viewPost(map);
	}

}
