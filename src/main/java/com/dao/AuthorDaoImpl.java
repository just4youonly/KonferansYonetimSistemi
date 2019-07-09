package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.entity.JudgeRating;
import com.entity.ReportDetails;
import com.entity.User;
import com.rm.AuthorJudgeOpinionRM;
import com.rm.OCCJudgeOpinionRM;
import com.rm.ReportDetailsRM;

public class AuthorDaoImpl extends BaseDao implements AuthorDao{

	@Override
	public void saveReport(ReportDetails reportDetails) {
		String sql = "Insert into report (userId) values(:ui)";
		Map m = new HashMap();
		m.put("ui", reportDetails.getUser_id());
		KeyHolder kh = new GeneratedKeyHolder();
		SqlParameterSource ps = new MapSqlParameterSource(m);
		super.getNamedParameterJdbcTemplate().update(sql, ps, kh);

		String sql1 = "Insert into report_details (reportId, writerNames, emails, institutionName, reportTitle, reportAbstract, keywords, reportTopics, report)"
				+ " values (:ri, :wn, :em, :in, :rtit, :rabs, :kw, :rtop, :rep)";
		m = new HashMap();
		m.put("ri", kh.getKey());
		m.put("wn", reportDetails.getWriter_names());
		m.put("em", reportDetails.getEmails());
		m.put("in", reportDetails.getInstitution_name());
		m.put("rtit", reportDetails.getReport_title());
		m.put("rabs", reportDetails.getReport_abstract());
		m.put("kw", reportDetails.getKeywords());
		m.put("rtop", reportDetails.getReport_topics());
		m.put("rep", reportDetails.getReport());
		super.getNamedParameterJdbcTemplate().update(sql1, m);
	}
	
	@Override
	public List<ReportDetails> listReportsForUser(int user_id) {
		String sql = "select report_details.reportId, report_details.writerNames, "
				+ "report_details.emails, report_details.institutionName, report_details.reportTitle, "
				+ "report_details.reportAbstract, report_details.keywords, report_details.reportTopics, report_details.report, "
				+ "report.userId, report.sendDate, report.resultDate, report.status from report_details \r\n" 
				+ "inner join report on report_details.reportId = report.reportId inner join users "
				+ "on report.userId = users.userId where report.userId = ?";
		List<ReportDetails> reportDetails = getJdbcTemplate().query(sql, new ReportDetailsRM(), user_id);
		return reportDetails;
	}
	
	@Override
	public List<JudgeRating> getOpinionList(int report_id) {
		String sql = "select judge_rating.userOpinion_1, judge_rating.userOpinion_2, "
				+ "judge_rating.userRate, report.occRate, report.status from judge_rating inner join report on "
				+ "judge_rating.reportId = report.reportId where judge_rating.reportId = ?";
		List<JudgeRating> opinionList = getJdbcTemplate().query(sql, new AuthorJudgeOpinionRM(), report_id);
		return opinionList;
	}
	
	
	@Override
	public void updateAuthor(User user) {
		String sql = "Update users set userName = :un, userSurname = :us, userPassword = :up, "
				+ "userEmail = :um where userId = :ui";
		Map m = new HashMap();
		m.put("un", user.getUser_name());
		m.put("us", user.getUser_surname());
		m.put("up", user.getUser_password());
		m.put("um", user.getUser_email());
		m.put("ui", user.getUser_id());
		getNamedParameterJdbcTemplate().update(sql, m);
	}

	
}
