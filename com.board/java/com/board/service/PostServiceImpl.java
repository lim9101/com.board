package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.DTO.Files;
import com.board.DTO.Post;
import com.board.DTO.Search;
import com.board.dao.PostDao;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostDao postDao;
	
	public List<Post> postList(int spNo){
		return postDao.getPosts(spNo);
	}
	
	//공지 글 추가
	@Override
	public boolean postWrite(Post post){
		int pno = postDao.maxPost()+1;
		System.out.println(pno+"pno");
		post.setpNo(pno);
		postDao.addPost(post);
		/*Files file = new Files();
		file.setpNo(pno);
		System.out.println("pno:"+file.getpNo());
		file.setSpNo(0);
		System.out.println("spno:"+file.getSpNo());
		file.setFile_name("zzz.txt");
		//System.out.println("파일명:"+post.getUpload().getName());
		
		
		postDao.addFile(file);*/
		return true;
	}//end postWrite
	
	public boolean postUpdate(Post post){
		
		return postDao.updatePost(post)>0;
	}
}
