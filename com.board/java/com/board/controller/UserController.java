package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.DTO.User;
import com.board.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	//회원가입 기능
	//ParameterType:User,HttpSession resultType:boolean
	@RequestMapping("signIn")
	@ResponseBody
	public boolean signIn(User user,HttpSession session){
		session.setAttribute("user",user);
		boolean result=false;
		try{
			result=userService.signIn(user,session);
		}catch(Exception e){
			System.err.print(e);
		}finally{
			System.out.println(result);
		}
		
		return result;
	}
	
	//사용자 정보 check
	//ParameterType:User,HttpSession resultType:boolean
	@RequestMapping("check")
	@ResponseBody
	public boolean check(User user,HttpSession session){
		boolean result=false;
		try{
			result=userService.check(user,session);
		}catch(Exception e){
			System.err.print(e);
		}finally{
		}
		return result;
	}
	
	//사용자 회원탈퇴기능URL
	//ParameterType:User,HttpSession resultType:boolean
	@RequestMapping("delUser")
	@ResponseBody
	public boolean delUser(User user,HttpSession session){
		boolean result=false;
		User sessionUser = (User)session.getAttribute("user");
		user.setUserId(sessionUser.getUserId());
		if(userService.check(user,session)){
			result=userService.delUser(user);
		}else{
			System.out.println("성공여부:"+result);
		}
		return result;
	}
	
	@RequestMapping(value="updateUser", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateUser(User user,HttpSession session){
		User sessionUser = (User)session.getAttribute("user"); 
		user.setUserPw(sessionUser.getUserPw());
		return userService.updateUser(user);
	}
	
	
}
