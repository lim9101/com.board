package com.board.dao.mapper;

import java.util.HashMap;
import java.util.List;

import com.board.DTO.Coment;
import com.board.DTO.Post;

public interface ComentMapper {
	List<Coment> getComents(Post post);
	HashMap<String, Coment> getComent(Post post);
	int addComent(Coment coment);
	int updateComent(Coment coment);
	int delComent(Coment coment);
}
