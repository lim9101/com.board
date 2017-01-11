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
import com.board.DTO.Page;
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
	public boolean postWrite(Post post){
		
		//답변 글이면
		if(post.getpNo()>0){
			postDao.depthCount(post);
			post.setSpNo(post.getSpNo());
			post.setDepth(post.getDepth()+1);
			post.setPlevel(post.getPlevel()+1);
		}
		postDao.addPost(post);
		
		MultipartFile sendFile = post.getUpload();
		
		//전송하는 파일이 있으면
		if(!sendFile.isEmpty()){
			Post post1 = postDao.viewPost(postDao.maxPost());
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
			file.setpNo(post1.getpNo());
			file.setFile_name(random+"_"+fileName);
			fileDao.addFile(file);
		}
		return true;
	}//end postWrite
	
	//파일 수정
	public void postUpdate(Post post, int fileNo){
		System.out.println("kkjj"+fileNo);
		postDao.updatePost(post);
		String filename = fileDao.fileName(post.getpNo());
		String saveDirectory ="C:\\" + "temp" + File.separator;
		
		MultipartFile sendFile = post.getUpload();
		System.out.println("sendFile:"+sendFile);
		
		//수정할 파일이 있으면
		if(!sendFile.isEmpty()){
			UUID random = UUID.randomUUID();
			
			//기존에 파일이 있으면 기존파일 삭제
			if(filename != null){
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}
			
			String fileName = sendFile.getOriginalFilename();
			System.out.println("fileName:"+fileName);
			
			AttFile file = new AttFile();
			file.setFile_name(random+"_"+fileName);
			System.out.println("random+fileName"+random+"_"+fileName);
			file.setpNo(post.getpNo());
			file.setFile_no(fileNo);
			
			if(fileNo > 0){
				fileDao.updateFile(file);
			}else{
				//기존에 파일에 없던 게시글에 파일 추가
				fileDao.addFile(file);
			}
			
			
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(sendFile.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}// end if
		
	}

	@Override
	public List<Post> postList(Page pv) {
		return postDao.listPost(pv);
	}

	@Override
	public Post postView(int pNo) {
		return postDao.viewPost(pNo);
	}

	@Override
	public int totalCount() {
		return postDao.totalCount();
	}

	@Override
	public void delPost(int pNo, int spNo, int depth) {
		int spNoCount = postDao.spnoCount(spNo);
		
		//제목글에 답변이 없을 경우
		if(spNoCount==1 || depth == postDao.maxDepth(spNo)){
			postDao.delPost(pNo);

		//제목글에 답변이 있는 경우
		}else{
			postDao.delUpdatePost(pNo);
		}
	}

	@Override
	public int searchCount(Page pv) {
		return postDao.searchCount(pv);
	}

	@Override
	public void addCount(int pNo) {
		postDao.addCount(pNo);
	}

}
