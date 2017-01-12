package com.board.dao.mapper;

import java.util.List;

import com.board.DTO.Coment;

public interface ComentMapper {
	List<Coment> getComents(Coment coment);
	int addComent(Coment coment);
	int updateComent(Coment coment);
	int delComent(Coment coment);
}
