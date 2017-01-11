package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.DTO.Coment;
import com.board.DTO.User;
import com.board.service.ComentService;

@Controller
public class ComentController {

	@Autowired
	private ComentService comentService;
	
	@Autowired
	ModelAndView mav;
	
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
	
	@RequestMapping(value = "comentAdd", method = RequestMethod.POST)
	@ResponseBody
	public boolean comentAdd(Coment coment,HttpSession session){
		User user =(User)session.getAttribute("user");
		coment.setUserId(user.getUserId());
		System.out.println(coment);
		return comentService.addComent(coment);
	}
}
