package com.board.service;

import java.util.List;

import com.board.DTO.Files;
import com.board.DTO.Post;
import com.board.DTO.Search;

public interface PostService {
	List<Post> postList(int spNo);
	boolean postWrite(Post post);
	boolean postUpdate(Post post);
}
