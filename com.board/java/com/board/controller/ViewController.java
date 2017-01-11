package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.UserService;

@Controller
public class ViewController {

	@Autowired private UserService userService;
	
		@RequestMapping("/")
		public String index(){
			return "index";
		}
		
		@RequestMapping("index")
		public String index(HttpSession session){
			session.removeAttribute("user");
			session.removeAttribute("pNo");
			return "index";
		}
		
		@RequestMapping("userAdd")
		public String userAdd(){
			return "userAdd";
		}
		
		@RequestMapping("userInfo")
		public String userInfo(HttpSession session){
			return "userInfo";
			}
		
		@RequestMapping("postAdd")
		public String postAdd(){
			return "postAdd";
		}
		
		@RequestMapping("userDel")
		public String delUser(){
			return "userDel";
		}
		
		@RequestMapping("userCheck")
		public String userCheck(String checkPoint,HttpSession session){
			return "userCheck";
		}
		
		@RequestMapping("userUpdate")
		public String userUpdate(){
			return "userUpdate";
		}
		
		@RequestMapping("idFind")
		public String idFind(){
			return "idFind";
		}
		
		@RequestMapping("pwFind")
		public String pwFind(){
			return "pwFind";
		}
		
		@RequestMapping("rePw")
		public String rePw(){
			return "rePw";
		}
}
