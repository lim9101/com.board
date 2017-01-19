package com.board.service;

import javax.servlet.http.HttpSession;

import com.board.DTO.User;

public interface UserService {
	User getUser(User user);
	boolean signIn(User user,HttpSession session);
	boolean updateUser(User user,HttpSession session);
	boolean delUser(User user);
	boolean check(User user,HttpSession session);
	int checkId(String userId);
}
