package com.board.dao.mapper;

import java.util.List;
import com.board.DTO.Coment;

public interface ComentMapper {
	List<Coment> getComents(int pNo);
	int addComent(Coment coment);
	int updateComent(Coment coment);
	int delComent(Coment coment);
}
