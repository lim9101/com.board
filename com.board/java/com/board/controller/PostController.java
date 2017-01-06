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

import com.board.DTO.Post;
import com.board.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	
	//글 작성하는 페이지 이동
	@RequestMapping(value = "/postWrite", method = RequestMethod.GET)
	public ModelAndView postWrite(Post post){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("postAdd");
		return mav;
	}//end postWrite
	
	//글 작성 후 처리 메서드
	@RequestMapping(value = "/postWrite", method = RequestMethod.POST)
	public ModelAndView postProWrite(Post post, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		postService.postWrite(post, request);
		mav.setViewName("postList");
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
	public ModelAndView postList(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("pList", postService.postList());
		System.out.println(postService.postList());
		mav.setViewName("postList");
		return mav;
	}
	
	@RequestMapping(value = "/postView", method = RequestMethod.GET)
	public ModelAndView postView(int spNo, int pNo){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("spNo", spNo);
		map.put("pNo", pNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", postService.postView(map));
		mav.setViewName("postView");
		return mav;
	}
}
