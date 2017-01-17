package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.DTO.AttFile;
import com.board.DTO.Coment;
import com.board.DTO.User;
import com.board.service.AttFileService;
import com.board.service.ComentService;
import com.board.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PostController postController;
	
	@Autowired
	private AttFileService attFileService;
	
	@Autowired
	private ComentService comentService;
	
	//회원가입 기능
	//ParameterType:User,HttpSession resultType:boolean
	@RequestMapping("signIn")
	@ResponseBody
	public boolean signIn(User user,HttpSession session){
		int pNo=0;
		session.setAttribute("pNo", pNo);
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
		int pNo=0;
		session.setAttribute("pNo", pNo);
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
	@RequestMapping(value="delUser", method=RequestMethod.POST)
	@ResponseBody
	public boolean delUser(User user,HttpSession session){
		boolean result=false;
		if(userService.check(user,session)){
			User sessionUser = (User)session.getAttribute("user");
			user.setUserId(sessionUser.getUserId());
			System.out.println(attFileService.getAttFiles(user.getUserId()));
			for(AttFile attFile : attFileService.getAttFiles(user.getUserId())){
				attFileService.fileDelete(attFile.getFile_no(), attFile.getpNo());
			}
			Coment coment=new Coment();
			coment.setUserId(user.getUserId());
			result=comentService.delComent(coment);
			System.out.println("댓글삭제여부:"+result);
			result=postController.userDelPost(user.getUserId());
			System.out.println("글삭제여부:"+result);
			result=userService.delUser(user);
			System.out.println("회원탈퇴:"+result);
		}
		else{
			System.out.println("성공여부:"+result);
		}
		return result;
	}
	
	//회원정보수정
	@RequestMapping(value="updateUser", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateUser(User user,HttpSession session){
		return userService.updateUser(user,session);
	}
	
	//널갑들어갔을때 defind success미처리
	@RequestMapping(value="findId", method=RequestMethod.POST)
	@ResponseBody
	public User findId(User user){
		try{
			user = userService.getUser(user);
		}catch(Exception e){
			user.setUserId("");
		}
 		return user;
	}
	
	
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	@ResponseBody
	public boolean findPw(User user,HttpSession session){
		boolean result=false;
		try{
			user = userService.getUser(user);
			if(user!=null){
				session.setAttribute("user",user);
				result = true;
			}else{
			}
		}catch(Exception e){
		}
 		return result;
	}
}
