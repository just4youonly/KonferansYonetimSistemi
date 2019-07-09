package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.ReportDetails;

public class JudgeReportRM implements RowMapper<ReportDetails>{

	@Override
	public ReportDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReportDetails rd = new ReportDetails();
		rd.setReport_id(rs.getInt("reportId"));
		rd.setReport_title(rs.getString("reportTitle"));
		rd.setResult_date(rs.getDate("resultDate"));
		rd.setUser_name(rs.getString("userName"));
		rd.setUser_surname(rs.getString("userSurname"));
		return rd;
	}

}
