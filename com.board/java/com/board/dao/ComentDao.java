package com.board.dao;

import java.util.List;

import com.board.DTO.Coment;

public interface ComentDao {
	List<Coment> getComents(Coment coment);
	int addComent(Coment coment);
	int updateComent(Coment coment);
	int delComent(Coment coment);
}
