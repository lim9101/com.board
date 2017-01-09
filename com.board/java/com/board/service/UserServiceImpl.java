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
	public User getUser(User user){
		return userDao.getUser(user);
	}
	public boolean updateUser(User user,HttpSession session){
		boolean result=false;
		String userPw;
		if(user.getUserId()!=null){
		try{
			User sessionUser = (User)session.getAttribute("user"); 
			user.setUserPw(sessionUser.getUserPw());
			session.setAttribute("user",user);
			result = userDao.updateUser(user)>0;
		}catch(Exception e){
			
		}finally{
		}
		}else{
			userPw=entool.encode(user.getUserPw());
			user=userDao.getUser(user);
			user.setUserPw(userPw);
			result = userDao.updateUser(user)>0;
		}
		return result;
	}
	
	
	//check(사용자정보 체크)
	//parameter:User result:boolean
	public boolean check(User user,HttpSession session){
		boolean result=false;
		user.setUserPw(entool.encode(user.getUserPw()));
		User sessionUser = (User)session.getAttribute("user");
		if(sessionUser!=null && user.getUserId()==null){//받은user값에 비밀번호정보뿐이면 세션에 있는 pw갑과 비교
			if(sessionUser.getUserPw().equals(user.getUserPw())){
				System.out.println("in true");
				result=true;
			}else{
				System.out.println("return false");
			}
		}else{
			User daoUser = userDao.getUser(user);
			if(daoUser.getUserPw().equals(user.getUserPw())){//로그인시 비교
				result=true;
				session.setAttribute("user",daoUser);
			}else{
			}
		}
		return result;
	}
	
	//회원가입
	//parameter:User result:boolean
	public boolean signIn(User user,HttpSession session){
		user.setUserPw(entool.encode(user.getUserPw()));
		session.setAttribute("user", user);
		return userDao.addUser(user)>0;
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
