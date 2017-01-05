package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.DTO.User;
import com.board.service.UserService;

@Controller
public class ViewController {

	@Autowired private UserService userService;
	
		@RequestMapping("/")
		public String index(){
			return "index";
		}
		
		@RequestMapping("userAdd")
		public String userAdd(){
			return "userAdd";
		}
		
		@RequestMapping("userInfo")
		public String userInfo(HttpSession session){
			User user=(User)session.getAttribute("user");
			session.removeAttribute("user");
			try{
			session.setAttribute("user", userService.getUser(user.getUserId()));
			System.out.println((User)session.getAttribute("user"));
			}catch(Exception e){
			}finally{
				
				}
			return "userInfo";
			}
		
		@RequestMapping("boardList")
		public String boardList(){
			return "boardList";
		}
		
		@RequestMapping("postAdd")
		public String postAdd(){
			return "postAdd";
		}
}
