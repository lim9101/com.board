package com.board.dao;


import java.util.List;

import com.board.DTO.Page;
import com.board.DTO.Post;

public interface PostDao {
	
	List<Post> listPost(Page pv);
	int addPost(Post post);
	int updatePost(Post post);
	int delPost(Post post);
	int maxPost();
	Post viewPost(int pNo);
	int totalCount();
	void depthCount(Post post);
	}
