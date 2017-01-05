package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.DTO.User;
import com.board.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("signIn")
	@ResponseBody
	public boolean signIn(User user,HttpSession session){
		boolean result=false;
		try{
			result=userService.signIn(user);
		}catch(Exception e){
			System.err.print(e);
		}finally{
			System.out.println(result);
		}
		return result;
	}
	
	@RequestMapping("check")
	@ResponseBody
	public boolean check(User user,HttpSession session){
		session.setAttribute("user", user);
		boolean result=false;
		try{
			result=userService.check(user);
		}catch(Exception e){
			System.err.print(e);
		}finally{
			System.out.println(result);
		}
		return result;
	}
	
	
	//로그인사용자 정보조회
	@RequestMapping("userIde")
	@ResponseBody
	public boolean userInfo(HttpSession session){
		boolean result=false;
		User user=(User)session.getAttribute("user");
		session.removeAttribute("user");
		try{
		session.setAttribute("user", userService.getUser(user.getUserId()));
		System.out.println((User)session.getAttribute("user"));
		result=true;
		}catch(Exception e){
			System.err.println(e);
		}finally{
			if(result == true)
			System.out.println(result);
			else{
				System.out.println(false);
			}
		}
		return result;
	}
	
	
	
}
