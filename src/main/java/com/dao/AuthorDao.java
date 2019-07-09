package com.dao;

import java.util.List;

import com.entity.JudgeRating;
import com.entity.ReportDetails;
import com.entity.User;

public interface AuthorDao {
	public void saveReport(ReportDetails reportDetails);
	public List<ReportDetails> listReportsForUser(int user_id);
	public List<JudgeRating> getOpinionList(int report_id);
	public void updateAuthor(User user);
}
