package com.board.dao;


import java.util.List;

import com.board.DTO.Page;
import com.board.DTO.Post;

public interface PostDao {
	
	List<Post> listPost(Page pv);
	int addPost(Post post);
	void updatePost(Post post);
	void delPost(int pNo);
	void delUpdatePost(int pNo);
	int maxPost();
	Post viewPost(int pNo);
	int totalCount();
	void depthCount(Post post);
	int spnoCount(int spNo);
	int searchCount(Page pv);
	int maxDepth(int spNo);
	}
