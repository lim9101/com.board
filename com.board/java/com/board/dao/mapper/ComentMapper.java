<<<<<<< HEAD
package com.board.dao.mapper;

import java.util.List;

import com.board.DTO.Coment;

public interface ComentMapper {
	List<Coment> getComents(Coment coment);
	int addComent(Coment coment);
	int updateComent(Coment coment);
	int delComent(Coment coment);
	void allDelComent(int pNo);
	int countComent(int pNo);
}
=======
package com.board.dao.mapper;

import java.util.List;

import com.board.DTO.Coment;

public interface ComentMapper {
	List<Coment> getComents(Coment coment);
	int addComent(Coment coment);
	int updateComent(Coment coment);
	int delComent(Coment coment);
}
>>>>>>> branch 'master' of https://github.com/lim9101/com.board.git
