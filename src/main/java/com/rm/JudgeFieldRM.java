package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.Fields;

public class JudgeFieldRM implements RowMapper<Fields>{

	@Override
	public Fields mapRow(ResultSet rs, int rowNum) throws SQLException {
		Fields fields = new Fields();
		fields.setField_id(rs.getInt("fieldId"));
		fields.setField_name(rs.getString("fieldName"));
		return fields;
	}

}
