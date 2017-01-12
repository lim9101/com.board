package com.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.DTO.Coment;
import com.board.dao.mapper.ComentMapper;
@Repository
public class ComentDaoImpl implements ComentDao{
	
	@Autowired
	private ComentMapper comentMapper;
	
	public List<Coment> getComents(Coment coment){
		return comentMapper.getComents(coment);
	}
	public int addComent(Coment coment){
		return comentMapper.addComent(coment);
	}
	public int updateComent(Coment coment){
		return comentMapper.updateComent(coment);
	}
	public int delComent(Coment coment){
		return comentMapper.delComent(coment);
	}
}
