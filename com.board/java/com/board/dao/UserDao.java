package com.board.dao;

import com.board.DTO.User;

public interface UserDao {
	User getUser(User user);
	int addUser(User user);
	int updateUser(User user);
	int delUser(User user);
}
