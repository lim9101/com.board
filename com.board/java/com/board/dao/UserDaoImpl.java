package com.board.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.DTO.User;
import com.board.dao.mapper.UserMapper;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private UserMapper userMapper;
	
	public User getUser(User user){
		return userMapper.getUser(user);
	}
	public int addUser(User user){
		return userMapper.addUser(user);
	}
	public int updateUser(User user){
		return userMapper.updateUser(user);
	}
	public int delUser(User user){
		return userMapper.delUser(user);
	}
	@Override
	public int checkId(String userId) {
		return userMapper.checkId(userId);
	}
	
}
