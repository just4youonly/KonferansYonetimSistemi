package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.JudgeRating;

public class JudgeOpinionRM implements RowMapper<JudgeRating>{

	@Override
	public JudgeRating mapRow(ResultSet rs, int rowNum) throws SQLException {
		JudgeRating jr = new JudgeRating();
		jr.setUser_opinion_1(rs.getString("userOpinion_1"));
		jr.setUser_opinion_2(rs.getString("userOpinion_2"));
		jr.setUser_rate(rs.getInt("userRate"));
		return jr;
	}

}
