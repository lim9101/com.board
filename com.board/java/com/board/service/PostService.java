package com.board.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.board.DTO.Page;
import com.board.DTO.Post;


public interface PostService {
	List<Post> postList(Page pv);
	boolean postWrite(Post post);
	void postUpdate(Post post, int fileNo);
	Post postView(int pNo);
	int totalCount();
	void delPost(int pNo, int spNo, int depth);
	int searchCount(Page pv);
}
