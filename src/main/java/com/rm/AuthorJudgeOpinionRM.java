package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.JudgeRating;

public class AuthorJudgeOpinionRM implements RowMapper<JudgeRating>{

	@Override
	public JudgeRating mapRow(ResultSet rs, int rowNum) throws SQLException {
		JudgeRating judgeRating = new JudgeRating();
		judgeRating.setUser_opinion_1(rs.getString("userOpinion_1"));
		judgeRating.setUser_opinion_2(rs.getString("userOpinion_2"));
		judgeRating.setUser_rate(rs.getInt("userRate"));
		judgeRating.setOcc_rate(rs.getInt("occRate"));
		judgeRating.setStatus(rs.getString("status"));
		return judgeRating;
	}
	
}
