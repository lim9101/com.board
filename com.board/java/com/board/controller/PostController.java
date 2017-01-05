package com.board.controller;

import java.sql.Date;
import java.util.List;

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
	public ModelAndView postProWrite(Post post){
		ModelAndView mav = new ModelAndView();
		postService.postWrite(post);
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
	
	@RequestMapping("postList")
	public List<Post> postList(){
		return postService.postList(0);
	}
}
