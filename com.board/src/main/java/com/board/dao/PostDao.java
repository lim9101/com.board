package com.board.dao;

import java.util.List;

import com.board.DTO.Post;
import com.board.DTO.Search;

public interface PostDao {
	List<Post> getPosts(int spNo);
	Post getPost(int pno);
	int addPost(Post post);
	int updatePost(Post post);
	int delPost(Post post);
	}
