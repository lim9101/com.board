package com.board.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.board.DTO.AttFile;
import com.board.DTO.Post;
import com.board.DTO.Search;

public interface PostService {
	List<Post> postList();
	boolean postWrite(Post post, HttpServletRequest request);
	boolean postUpdate(Post post);
	Post postView(HashMap<String, Integer> map);
}
