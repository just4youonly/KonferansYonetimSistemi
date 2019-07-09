package com.entity;

public class ReportDetails extends Report{
	
	private String writer_names;
	private String emails;
	private String institution_name;
	private String report_title;
	private String report_abstract;
	private String keywords;
	private String report_topics;
	private String report;
	
	public ReportDetails() {}
	
	public String getWriter_names() {
		return writer_names;
	}
	public void setWriter_names(String writer_names) {
		this.writer_names = writer_names;
	}
	public String getEmails() {
		return emails;
	}
	public void setEmails(String emails) {
		this.emails = emails;
	}
	public String getInstitution_name() {
		return institution_name;
	}
	public void setInstitution_name(String institution_name) {
		this.institution_name = institution_name;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	public String getReport_abstract() {
		return report_abstract;
	}
	public void setReport_abstract(String report_abstract) {
		this.report_abstract = report_abstract;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getReport_topics() {
		return report_topics;
	}
	public void setReport_topics(String report_topics) {
		this.report_topics = report_topics;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	
}
