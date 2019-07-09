package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.JudgeRating;

public class OCCJudgeOpinionRM implements RowMapper<JudgeRating>{

	@Override
	public JudgeRating mapRow(ResultSet rs, int rowNum) throws SQLException {
		JudgeRating judgeRating = new JudgeRating();
		judgeRating.setUser_id(rs.getInt("userId"));
		judgeRating.setUser_name(rs.getString("userName"));
		judgeRating.setUser_surname(rs.getString("userSurname"));
		judgeRating.setUser_opinion_1(rs.getString("userOpinion_1"));
		judgeRating.setUser_opinion_2(rs.getString("userOpinion_2"));
		judgeRating.setUser_rate(rs.getInt("userRate"));
		return judgeRating;
	}

}
