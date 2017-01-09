package com.board.dao.mapper;


import java.util.List;

import com.board.DTO.Page;
import com.board.DTO.Post;


public interface PostMapper {
	
	List<Post> listPost(Page pv);
	int addPost(Post post);
	int updatePost(Post post);
	int delPost(Post post);
	int maxPost();
	Post viewPost(int pNo);
	int totalCount();
	void depthCount(Post post);
}
