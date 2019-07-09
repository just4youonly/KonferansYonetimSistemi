package com.dao;

import java.util.List;

import com.entity.JudgeRating;
import com.entity.Report;
import com.entity.ReportDetails;
import com.entity.User;

public interface OCCDao {
	public List<ReportDetails> listAuthorReports();
	public List<ReportDetails> listSentToJudge();
	public ReportDetails findReportById(int report_id);
	public List<User> findeJudgesByRTopics(List<String> rTopics, int user_id);
	public void sendToJudges(List<Integer> judges, Report report);
	public void doTerminateReport(int report_id);
	public List<JudgeRating> getOpinionList(int report_id);
	public void saveRateForReport(Report report);
	public void updateOCC(User user);
}
