package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.DTO.Coment;
import com.board.dao.ComentDao;

@Service
public class ComentServiceImpl implements ComentService{
	
	@Autowired
	private ComentDao comentDao;

	public List<Coment> getComents(Coment coment){
		return comentDao.getComents(coment);
	}
	
	public boolean addComent(Coment coment){
		return comentDao.addComent(coment)>0;
	}
	public boolean updateComent(Coment coment){
		return comentDao.updateComent(coment)>0;
	}
	public boolean delComent(Coment coment){
		return comentDao.delComent(coment)>0;
	}

	@Override
	public void allDelComent(int pNo) {
		comentDao.allDelComent(pNo);
	}

	@Override
	public int countComent(int pNo) {
		return comentDao.countComent(pNo);
	}
}
