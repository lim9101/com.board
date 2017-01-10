package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.DTO.Coment;
import com.board.service.ComentService;

@Controller
public class ComentController {

	@Autowired
	private ComentService comentService;
	
	@RequestMapping("getComents")
	public List<Coment> getComents(int pNo){
		return comentService.getComents(pNo);
	}
	
	@RequestMapping("addComent")
	public boolean addComent(Coment coment){
		return comentService.addComent(coment);
	}
	
	@RequestMapping("updateComent")
	public boolean updateComent(Coment coment){
		return comentService.updateComent(coment);
	}
	
	@RequestMapping("delComent")
	public boolean delComent(Coment coment){
		return comentService.delComent(coment);
	}
}
