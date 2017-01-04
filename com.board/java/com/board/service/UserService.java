package com.board.service;

import com.board.DTO.User;

public interface UserService {
	User getUser(String userId);
	boolean signIn(User user);
	boolean updateUser(User user);
	boolean delUser(User user);
	boolean check(User user);
}
