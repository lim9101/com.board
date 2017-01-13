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
		User sessionUser = (User)session.getAttribute("user");
		String userPw=entool.encode(user.getUserPw());
		try{
			user.setUserId(sessionUser.getUserId());
			user.setUserPw(userPw);
			session.removeAttribute("user");
			session.setAttribute("user",user);
			result = userDao.updateUser(user)>0;
		}catch(Exception e){
			
		}finally{
		}
		return result;
	}
	
	
	//check(사용자정보 체크)
	//parameter:User result:boolean
	public boolean check(User user,HttpSession session){
		boolean result=false;
		user.setUserPw(entool.encode(user.getUserPw()));
		System.out.println("userIn:"+user.getUserPw());
		User sessionUser = (User)session.getAttribute("user");
		if(sessionUser!=null && user.getUserId()==null){//받은user값에 비밀번호정보뿐이면 세션에 있는 pw갑과 비교
			if(sessionUser.getUserPw().equals(user.getUserPw())){
				result=true;
				System.out.println("first:"+result);
			}else{
			}
		}else{
			User daoUser = userDao.getUser(user);
			System.out.println("daoUser:"+user);
			if(daoUser.getUserPw().equals(user.getUserPw())){//로그인시 비교
				System.out.println("resultIn");
				result=true;
				session.setAttribute("user",daoUser);
			}else{
			}
		}
		System.out.println("end:"+result);
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
