package com.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.DTO.User;
import com.board.dao.UserDao;
import com.board.util.password.AES256;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;//DB SQL연결관리
	@Autowired
	private AES256 entool;//암호화 클래스
	
	//get,add,update,del
	public User getUser(String userId){
		return userDao.getUser(userId);
	}
	public boolean updateUser(User user){
		return userDao.updateUser(user)>0;
	}
	
	
	//check(사용자정보 체크)
	//parameter:User result:boolean
	public boolean check(User user,HttpSession session){
		boolean result=false;
		user.setUserPw(entool.encode(user.getUserPw()));
		User sessionUser = (User)session.getAttribute("user");
		if(user.getUserId()==null){//받은user값에 비밀번호정보뿐이면 세션에 있는 id갑과 비교
			if(sessionUser.getUserPw().equals(user.getUserPw())){
				result=true;
			}else{
				
			}
		}else{
			if(userDao.getUser(user.getUserId()).getUserPw().equals(user.getUserPw())){//로그인시 비교
				result=true;
			}else{
				
			}
		}
		return result;
	}
	
	//회원가입
	//parameter:User result:boolean
	public boolean signIn(User user){
		user.setUserPw(entool.encode(user.getUserPw()));
		System.out.println(user);
		return userDao.addUser(user)>0;
	}
	
	//session에 사용자 정보저장
	//parameter:HttpSession return:boolean
	public boolean userInfo(HttpSession session){
		boolean result=false;
		User user=(User)session.getAttribute("user");
		session.removeAttribute("user");
		try{
		session.setAttribute("user", getUser(user.getUserId()));
		System.out.println((User)session.getAttribute("user"));
		result=true;
		}catch(Exception e){
		}finally{
			System.out.println("저장성공여부:"+result);
			}
		return result;
	}
	
	//사용자삭제기능
	//ParameterType:User resultType:boolean
	public boolean delUser(User user){
		boolean result=false;
		try{
			result=userDao.delUser(user)>0;
		}catch(Exception e){}finally{};
		return result;
	}
	
}
