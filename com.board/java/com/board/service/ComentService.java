package com.board.service;

import java.util.List;

import com.board.DTO.Coment;

public interface ComentService {
	List<Coment> getComents(Coment coment);
	boolean addComent(Coment coment);
	boolean updateComent(Coment coment);
	boolean delComent(Coment coment);
	void allDelComent(int pNo);
	int countComent(int pNo);
}
