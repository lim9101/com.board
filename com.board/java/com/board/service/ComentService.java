package com.board.service;

import java.util.List;

import com.board.DTO.Coment;

public interface ComentService {
	List<Coment> getComents(int pNo);
	boolean addComent(Coment coment);
	boolean updateComent(Coment coment);
	boolean delComent(Coment coment);
}
