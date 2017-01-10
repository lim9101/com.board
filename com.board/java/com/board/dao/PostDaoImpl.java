package com.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.DTO.Page;
import com.board.DTO.Post;

import com.board.dao.mapper.PostMapper;

@Repository
public class PostDaoImpl implements PostDao{
	
	@Autowired
	private PostMapper postMapper;
	
	
	
	public int addPost(Post post){
		return postMapper.addPost(post);
	}
	
	public void updatePost(Post post){
		postMapper.updatePost(post);
	}
	
	public void delPost(int pNo){
		postMapper.delPost(pNo);
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

	@Override
	public int spnoCount(int spNo) {
		return postMapper.spnoCount(spNo);
	}

	@Override
	public void delUpdatePost(int pNo) {
		postMapper.delUpdatePost(pNo);
	}

	@Override
	public int maxDepth(int spNo) {
		return postMapper.maxDepth(spNo);
	}
}
