package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.DTO.Coment;
import com.board.service.ComentService;

@Controller
public class ComentController {

	@Autowired
	private ComentService comentService;
	
	@Autowired
	ModelAndView mav;
	
	@RequestMapping("getComents")
	@ResponseBody
	public List<Coment> getComents(Coment coment){
		System.out.println(coment);
		return comentService.getComents(coment);
	}
	
	@RequestMapping("addComent")
	@ResponseBody
	public boolean addComent(Coment coment){
		if(coment.getContent()==null){
			coment.setContent("");
		}else{
			
		}
		return comentService.addComent(coment);
	}
	
	@RequestMapping(value="updateComent",method=RequestMethod.POST)
	@ResponseBody
	public boolean updateComent(Coment coment){
		System.out.println(coment);
		return comentService.updateComent(coment);
	}
	
	@RequestMapping(value="delComent",method=RequestMethod.POST)
	@ResponseBody
	public boolean delComent(Coment coment){
		return comentService.delComent(coment);
	}
	
	@RequestMapping(value = "comentAdd", method = RequestMethod.POST)
	@ResponseBody
	public boolean comentAdd(Coment coment){
		System.out.println(coment);
		return comentService.addComent(coment);
	}
}
