package com.dao;

import java.util.List;

import com.entity.Fields;
import com.entity.JudgeRating;
import com.entity.ReportDetails;
import com.entity.User;

public interface JudgeDao {
	public List<ReportDetails> listReportsForJudge(int user_id);
	public ReportDetails findReportById(int report_id);
	public JudgeRating getOpinionForOneJudge(int report_id, int user_id);
	public void sendJudgeRate(JudgeRating judgeRating);
	public List<Fields> getJudgeFields(int user_id);
	public List<Fields> getAllFields();
	public void deleteField(int field_id, int user_id);
	public void addField(int field_id, int user_id);
	public void deleteRole(int user_id);
	public void addRole(int user_id);
	public void updateJudge(User user);
}
