package com.board.dao;

import java.util.HashMap;
import java.util.List;

import com.board.DTO.AttFile;
import com.board.DTO.Post;
import com.board.DTO.Search;

public interface PostDao {
	
	List<Post> listPost();
	int addPost(Post post);
	int updatePost(Post post);
	int delPost(Post post);
	int maxPost();
	Post viewPost(HashMap<String, Integer> map);
	}
