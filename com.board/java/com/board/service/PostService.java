package com.board.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.board.DTO.Page;
import com.board.DTO.Post;


public interface PostService {
	List<Post> postList(Page pv);
	boolean postWrite(Post post, HttpServletRequest request);
	boolean postUpdate(Post post);
	Post postView(int pNo);
	int totalCount();
	
}
