package com.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.ReportDetails;

public class ReportDetailsRM implements RowMapper<ReportDetails>{

	@Override
	public ReportDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReportDetails rd = new ReportDetails();
		rd.setReport_id(rs.getInt("reportId"));
		rd.setWriter_names(rs.getString("writerNames"));
		rd.setEmails(rs.getString("emails"));
		rd.setInstitution_name(rs.getString("institutionName"));
		rd.setReport_title(rs.getString("reportTitle"));
		rd.setReport_abstract(rs.getString("reportAbstract"));
		rd.setKeywords(rs.getString("keywords"));
		rd.setReport_topics(rs.getString("reportTopics"));
		rd.setReport(rs.getString("report"));
		rd.setUser_id(rs.getInt("userId"));
		rd.setSend_date(rs.getDate("sendDate"));
		rd.setResult_date(rs.getDate("resultDate"));
		rd.setStatus(rs.getString("status"));
		return rd;
	}

}
