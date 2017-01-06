package com.board.dao.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.collections.map.HashedMap;

import com.board.DTO.AttFile;
import com.board.DTO.Post;
import com.board.DTO.Search;

public interface PostMapper {
	
	List<Post> listPost();
	int addPost(Post post);
	int updatePost(Post post);
	int delPost(Post post);
	int maxPost();
	Post viewPost(HashMap<String, Integer> viewMap);
}
