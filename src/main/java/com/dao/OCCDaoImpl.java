package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;

import com.entity.JudgeRating;
import com.entity.Report;
import com.entity.ReportDetails;
import com.entity.User;
import com.rm.OCCJudgeOpinionRM;
import com.rm.OCCReportRM;
import com.rm.OCCUserRM;
import com.rm.ReportDetailsRM;

public class OCCDaoImpl extends BaseDao implements OCCDao{

	@Override
	public List<ReportDetails> listAuthorReports() {
		String sql = "select report_details.reportId, report_details.reportTitle, "
				+ "report.sendDate, report.resultDate, users.userName, users.userSurname from report_details INNER JOIN "
				+ "report on report_details.reportId = report.reportId inner join users on report.userId = users.userId "
				+ "where report.status = 'OCC'";
		List<ReportDetails> reportDetails = getJdbcTemplate().query(sql, new OCCReportRM());
		return reportDetails;
	}
	
	@Override
	public List<ReportDetails> listSentToJudge() {
		String sql = "select report_details.reportId, report_details.reportTitle, "
				+ "report.sendDate, report.resultDate, users.userName, users.userSurname from report_details INNER JOIN "
				+ "report on report_details.reportId = report.reportId inner join users on report.userId = users.userId "
				+ "where report.status = 'Judge'";
		List<ReportDetails> reportDetails = getJdbcTemplate().query(sql, new OCCReportRM());
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
			System.out.println(reportDetails.getUser_id());
			return reportDetails;
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public List<User> findeJudgesByRTopics(List<String> rTopics, int user_id) {
		String sql = "select Distinct judge_field.userId, users.userName, users.userSurname, users.userEmail, "
				+ "users.userPassword from judge_field inner join fields on judge_field.fieldId = fields.fieldId "
				+ "inner join users on judge_field.userId = users.userId where judge_field.userId != ? and (";
		for(int i = 0; i<rTopics.size(); i++) {
			if(i != (rTopics.size()-1)) {
				sql+= "(fields.fieldName Like '%"+rTopics.get(i)+"%') OR ";
			}else {
				sql+="(fields.fieldName Like '%"+rTopics.get(i)+"%'))";
			}
		}
		List<User> judges = getJdbcTemplate().query(sql, new OCCUserRM(), user_id);
		return judges;
	}

	@Override
	public void sendToJudges(List<Integer> judges, Report report) {
		String sql = "update report set resultDate = :rd, status = :s where reportId = :ri";
		Map m = new HashMap();
		m.put("rd", report.getResult_date());
		m.put("s", "Judge");
		m.put("ri", report.getReport_id());
		getNamedParameterJdbcTemplate().update(sql, m);
		
		String sql1 = "insert into judge_rating (reportId, userId) values(:ri, :ui)";
		m = new HashMap();
		for(int id : judges) {
			m.put("ri", report.getReport_id());
			m.put("ui", id);
			super.getNamedParameterJdbcTemplate().update(sql1, m);
		}
	}

	@Override
	public void doTerminateReport(int report_id) {
		String sql = "update report set occRate = 0, status = 'Author' where reportId = ?";
		super.getJdbcTemplate().update(sql, report_id);
	}
	
	@Override
	public List<JudgeRating> getOpinionList(int report_id) {
		String sql = "select users.userId, users.userName, users.userSurname, judge_rating.userOpinion_1, judge_rating.userOpinion_2, "
				+ "judge_rating.userRate from judge_rating inner join users on judge_rating.userId = users.userId where "
				+ "judge_rating.reportId = ? ORDER BY judge_rating.userRate DESC";
		List<JudgeRating> opinionList = getJdbcTemplate().query(sql, new OCCJudgeOpinionRM(), report_id);
		return opinionList;
	}

	@Override
	public void saveRateForReport(Report report) {
		String sql = "update report set occRate = :or, status = :s where reportId = :ri";
		Map m = new HashMap();
		m.put("or", report.getOcc_rate());
		m.put("s", "Author");
		m.put("ri", report.getReport_id());
		getNamedParameterJdbcTemplate().update(sql, m);
	}
	
	@Override
	public void updateOCC(User user) {
		// TODO Auto-generated method stub
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
