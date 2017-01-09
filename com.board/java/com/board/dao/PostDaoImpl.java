package com.board.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.DTO.AttFile;
import com.board.DTO.Page;
import com.board.DTO.Post;
import com.board.DTO.Search;
import com.board.dao.mapper.AttFileMapper;
import com.board.dao.mapper.PostMapper;

@Repository
public class PostDaoImpl implements PostDao{
	
	@Autowired
	private PostMapper postMapper;
	
	
	
	public int addPost(Post post){
		return postMapper.addPost(post);
	}
	
	public int updatePost(Post post){
		return postMapper.updatePost(post);
	}
	
	public int delPost(Post post){
		return postMapper.delPost(post);
	}

	public int maxPost() {
		return postMapper.maxPost();
	}

	@Override
	public List<Post> listPost(Page pv) {
		return postMapper.listPost(pv);
	}

	@Override
	public Post viewPost(int pNo) {
		return postMapper.viewPost(pNo);
	}

	@Override
	public int totalCount() {
		return postMapper.totalCount();
	}

	@Override
	public void depthCount(Post post) {
		postMapper.depthCount(post);
	}
}
