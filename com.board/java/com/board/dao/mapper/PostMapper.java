package com.board.dao.mapper;

import java.util.List;

import com.board.DTO.Files;
import com.board.DTO.Post;
import com.board.DTO.Search;

public interface PostMapper {
	List<Post> getPosts(int spNo);
	Post getPost(int pno);
	int addPost(Post post);
	int updatePost(Post post);
	int delPost(Post post);
	int maxPost();
	void addFile(Files file);
}
