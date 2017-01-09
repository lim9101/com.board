package com.board.controller;



import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.DTO.Page;
import com.board.DTO.Post;
import com.board.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	private int currentPage;
	private Page pdto;
	
	
	//글 작성하는 페이지 이동
	@RequestMapping(value = "/postAdd", method = RequestMethod.GET)
	public ModelAndView postWrite(Post dto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", postService.postView(dto.getpNo()));
		
		mav.setViewName("postAdd");
		return mav;
	}//end postWrite
	
	//글 작성 후 처리 메서드
	@RequestMapping(value = "/postAdd", method = RequestMethod.POST)
	public ModelAndView postProWrite(Post post, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		postService.postWrite(post, request);
		mav.setViewName("redirect:/postList");
		return mav;
		/*post.setDate_in(new Date(System.currentTimeMillis()));;*/
	}//end postProWrite
	
	@RequestMapping("postUpdate")
	@ResponseBody
	public boolean postUpdate(Post post){
		post.setDate_up(new Date(System.currentTimeMillis()));
		return postService.postUpdate(post);
	}
	
	@RequestMapping(value = "/postList", method = RequestMethod.GET)
	public ModelAndView postList(Page pv){
		ModelAndView mav = new ModelAndView();
		int totalRecord = postService.totalCount();
		if(totalRecord >=1){
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();
			
			pdto = new Page(currentPage, totalRecord);
			mav.addObject("pv", pdto); // 페이지번호를 출력하기위해 mav에 담음
			mav.addObject("pList", postService.postList(pdto));
			//System.out.println(postService.postList(pdto));
		}
		
		mav.setViewName("postList");
		return mav;
	}
	
	@RequestMapping(value = "/postView", method = RequestMethod.GET)
	public ModelAndView postView(int pNo){
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", postService.postView(pNo));
		mav.setViewName("postView");
		return mav;
	}
}
