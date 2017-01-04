package com.board.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.DTO.Post;
import com.board.service.PostService;

@Controller
public class PostController {
	//push
	//push
	@Autowired
	private PostService postService;
	
	@RequestMapping("postWrite")
	@ResponseBody
	public boolean postWrite(Post post){
		post.setDate_in(new Date(System.currentTimeMillis()));
		return postService.postWrite(post);
	}
	
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
	//test
	
}
