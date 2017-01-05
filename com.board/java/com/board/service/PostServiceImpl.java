package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public boolean postWrite(Post post){
		
		List<Post> post2=postDao.getPosts(post.getSpNo());
		System.out.println(post2);
		if(post2.size()==0){
			post.setpNo(1);
		}else{
		post.setpNo(post2.get(0).getpNo()+1);
		System.out.println(post.getpNo());
		}
		return postDao.addPost(post)>0;
	}
	
	public boolean postUpdate(Post post){
		
		return postDao.updatePost(post)>0;
	}
}
