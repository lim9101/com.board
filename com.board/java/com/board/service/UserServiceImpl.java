package com.board.service;

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
	public boolean delUser(User user){
		return userDao.delUser(user)>0;
	}
	
	//로그인 check
	//parameter:User result:boolean
	public boolean check(User user){
		boolean result=false;
		user.setUserPw(entool.encode(user.getUserPw()));
		if(userDao.getUser(user.getUserId()).getUserPw().equals(user.getUserPw())){
			result=true;
		}else{
			
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
	
}
