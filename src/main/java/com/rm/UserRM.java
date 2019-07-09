package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.User;

public class UserRM implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new User();
		u.setUser_id(rs.getInt("userId"));
		u.setUser_name(rs.getString("userName"));
		u.setUser_surname(rs.getString("userSurname"));
		u.setUser_password(rs.getString("userPassword"));
		u.setUser_email(rs.getString("userEmail"));
		u.setRole_id(rs.getInt("roleId"));
		return u;
	}
	
}
