package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;

import com.entity.Fields;
import com.entity.JudgeRating;
import com.entity.ReportDetails;
import com.entity.User;
import com.rm.JudgeFieldRM;
import com.rm.JudgeOpinionRM;
import com.rm.JudgeReportRM;
import com.rm.OCCReportRM;
import com.rm.ReportDetailsRM;

public class JudgeDaoImpl extends BaseDao implements JudgeDao{

	@Override
	public List<ReportDetails> listReportsForJudge(int user_id) {
		String sql = "select report_details.reportId, report_details.reportTitle, report.resultDate, users.userName, "
				+ "users.userSurname from judge_rating inner JOIN report_details on judge_rating.reportId = report_details.reportId "
				+ "inner join report on judge_rating.reportId = report.reportId inner join users on report.userId = users.userId where "
				+ "report.status = 'Judge' and judge_rating.userId = ?";
		List<ReportDetails> reportDetails = getJdbcTemplate().query(sql, new JudgeReportRM(), user_id);
		return reportDetails;
	}
	
	@Override
	public ReportDetails findReportById(int report_id) {
		String sql = "select report_details.reportId, report_details.writerNames, "
				+ "report_details.emails, report_details.institutionName, report_details.reportTitle, "
				+ "report_details.reportAbstract, report_details.keywords, report_details.reportTopics, report_details.report, "
				+ "report.userId, report.sendDate, report.resultDate, report.status from report_details \r\n" 
				+ "inner join report on report_details.reportId = report.reportId where report_details.reportId = ?";
		try {
			ReportDetails reportDetails = getJdbcTemplate().queryForObject(sql, new ReportDetailsRM(), report_id);
			return reportDetails;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@Override
	public void sendJudgeRate(JudgeRating judgeRating) {
		String sql = "update judge_rating set userOpinion_1 = :up1, userOpinion_2 = :up2, userRate = :ur where reportId = :ri and userId = :ui";
		Map m = new HashMap();
		m.put("up1", judgeRating.getUser_opinion_1());
		m.put("up2", judgeRating.getUser_opinion_2());
		m.put("ur", judgeRating.getUser_rate());
		m.put("ri", judgeRating.getReport_id());
		m.put("ui", judgeRating.getUser_id());
		super.getNamedParameterJdbcTemplate().update(sql, m);
	}
	
	@Override
	public JudgeRating getOpinionForOneJudge(int report_id, int user_id) {
		String sql = "select userOpinion_1, userOpinion_2, userRate from judge_rating where reportId = :ri and userId = :ui";
		Map m = new HashMap();
		m.put("ri", report_id);
		m.put("ui", user_id);
		try {
			JudgeRating judgeRating = getNamedParameterJdbcTemplate().queryForObject(sql, m, new JudgeOpinionRM());
			return judgeRating;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@Override
	public List<Fields> getJudgeFields(int user_id) {
		String sql = "select fields.fieldId, fields.fieldName from judge_field inner join fields on "
				+ "judge_field.fieldId = fields.fieldId where judge_field.userId = ?";
		List<Fields> fieldList = getJdbcTemplate().query(sql, new JudgeFieldRM(), user_id);
		return fieldList;
	}
	
	@Override
	public List<Fields> getAllFields() {
		String sql = "select * from fields";
		List<Fields> fieldList = getJdbcTemplate().query(sql, new JudgeFieldRM());
		return fieldList;
	}
	
	@Override
	public void deleteField(int field_id, int user_id) {
		String sql = "delete from judge_field where fieldId = :fi and userId = :ui";
		Map m = new HashMap();
		m.put("fi", field_id);
		m.put("ui", user_id);
		super.getNamedParameterJdbcTemplate().update(sql, m);
	}
	
	@Override
	public void addField(int field_id, int user_id) {
		String sql = "insert into judge_field (fieldId, userId) values (:fi, :ui)";
		Map m = new HashMap();
		m.put("fi", field_id);
		m.put("ui", user_id);
		super.getNamedParameterJdbcTemplate().update(sql, m);
	}
	
	@Override
	public void deleteRole(int user_id) {
		String sql = "delete from users_roles where roleId = 3 and userId = ?";
		getJdbcTemplate().update(sql, user_id);
	}
	
	@Override
	public void addRole(int user_id) {
		String sql = "insert into users_roles (userId, roleId) values (?, 3)";
		getJdbcTemplate().update(sql, user_id);
	}
	
	@Override
	public void updateJudge(User user) {
		String sql = "Update users set userName = :un, userSurname = :us, userPassword = :up, "
				+ "userEmail = :um where userId = :ui";
		Map m = new HashMap();
		m.put("un", user.getUser_name());
		m.put("us", user.getUser_surname());
		m.put("up", user.getUser_password());
		m.put("um", user.getUser_email());
		m.put("ui", user.getUser_id());
		super.getNamedParameterJdbcTemplate().update(sql, m);
	}

	

	


}
