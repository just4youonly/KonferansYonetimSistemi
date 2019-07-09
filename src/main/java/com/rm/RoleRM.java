package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.Role;

public class RoleRM implements RowMapper<Role>{

	@Override
	public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Role r = new Role();
		r.setRole_id(rs.getInt("roleId"));
		r.setRole_name(rs.getString("roleName"));
		return r;
	}

}
