package com.dao;

import java.util.List;

import com.entity.Role;
import com.entity.User;

public interface UserDao {
	public void saveUser(User user);
	public User loginUser(User user);
	public User findUserByEmail(User user);
	public Role checkUserRole(User user, int roleToCheck);
}
