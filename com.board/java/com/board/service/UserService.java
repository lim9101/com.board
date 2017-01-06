package com.board.service;

import javax.servlet.http.HttpSession;

import com.board.DTO.User;

public interface UserService {
	User getUser(String userId);
	boolean signIn(User user);
	boolean updateUser(User user);
	boolean delUser(User user);
	boolean check(User user,HttpSession session);
	boolean userInfo(HttpSession session);
}
