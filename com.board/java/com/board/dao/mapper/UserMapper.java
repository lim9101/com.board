package com.board.dao.mapper;

import com.board.DTO.User;
//마이바티스mapper 클래스 생성 interface
public interface UserMapper {
	
	User getUser(User user);
	int addUser(User user);
	int updateUser(User user);
	int delUser(User user);
	int checkId(String userId);
}
