package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

		@RequestMapping("/")
		public String index(){
			return "index";
		}
		
		@RequestMapping("userAdd")
		public String userAdd(){
			return "userAdd";
		}
		
		@RequestMapping("userInfo")
		public String userInfo(){
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
