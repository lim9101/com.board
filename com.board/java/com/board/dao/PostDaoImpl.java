package com.board.dao;

import java.util.HashMap;
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

	@Override
	public int searchCount(Page pv) {
		return postMapper.searchCount(pv);
	}

	@Override
	public void addCount(int pNo) {
		postMapper.addCount(pNo);
	}

	@Override
	public int pLevel(HashMap<String, Integer> map) {
		return postMapper.pLevel(map);
	}

	@Override
	public int maxPlevel(int spNo) {
		return postMapper.maxPlevel(spNo);
	}

	@Override
	public List<Post> delSPno(int spNo) {
		return postMapper.delSPno(spNo);
	}

	@Override
	public int searchTspno(int pNo) {
		return postMapper.searchTspno(pNo);
	}

	@Override
	public List<Post> userDelPost(String user_id) {
		return postMapper.userDelPost(user_id);
	}

	@Override
	public void updateCheckFile(HashMap<String, Integer> map) {
		postMapper.updateCheckFile(map);		
	}
	
	

	
}
