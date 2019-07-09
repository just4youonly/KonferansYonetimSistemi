package com.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.entity.Role;
import com.entity.User;
import com.rm.RoleRM;
import com.rm.UserRM;

@Repository
public class UserDaoImpl extends BaseDao implements UserDao{
	
	
	@Override
	public void saveUser(User user) {
		String sql = "Insert into users (userName, userSurname, userPassword, userEmail) values (:un, :us, :up, :ue)";
		Map m = new HashMap();
		m.put("un", user.getUser_name());
		m.put("us", user.getUser_surname());
		m.put("up", user.getUser_password());
		m.put("ue", user.getUser_email());
		
		KeyHolder kh = new GeneratedKeyHolder();
		SqlParameterSource ps = new MapSqlParameterSource(m);
		super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
		
		String sql1 = "Insert into users_roles (userId, roleId) values (:ui, :ri)";
		m = new HashMap();
		m.put("ui", kh.getKey());
		m.put("ri", user.getRole_id());
		super.getNamedParameterJdbcTemplate().update(sql1, m);
		
	}

	@Override
	public User loginUser(User user) {
		String sql = "select users_roles.roleId, users_roles.userId, users.userName, users.userSurname, users.userPassword, users.userEmail from users_roles inner join users on users_roles.userId = users.userId where users.userEmail = :ue and users.userPassword = :pw and users_roles.roleId = :ri";
		Map m = new HashMap();
		m.put("ue", user.getUser_email());
		m.put("pw", user.getUser_password());
		m.put("ri", user.getRole_id());
		try {
			User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRM());
			return u;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
		
	}

	@Override
	public User findUserByEmail(User user) {
		String sql = "select users_roles.roleId, users_roles.userId, users.userName, users.userSurname, users.userPassword, users.userEmail from users_roles inner join users on users_roles.userId = users.userId where users.userEmail = ?";
		
		try {
			User u = getJdbcTemplate().queryForObject(sql, new UserRM(), user.getUser_email());
			return u;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public Role checkUserRole(User user, int roleToCheck) {
		String sql = "select roles.roleId, roles.roleName from users_roles inner join roles on users_roles.roleId = roles.roleId where "
				+ "roles.roleId = :ri and users_roles.userId = :ui";
		Map m = new HashMap();
		m.put("ri", roleToCheck);
		m.put("ui", user.getUser_id());
		try {
			Role role = getNamedParameterJdbcTemplate().queryForObject(sql, m, new RoleRM());
			return role;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	
}
