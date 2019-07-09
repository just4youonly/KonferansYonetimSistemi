package com.entity;

import java.sql.Date;

import com.entity.User;

public class Report extends User{
	private int report_id;
	private Date send_date;
	private Date result_date;
	private int occ_rate;
	private String status;
	
	public Report() {}
	
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public Date getResult_date() {
		return result_date;
	}
	public void setResult_date(Date result_date) {
		this.result_date = result_date;
	}
	
	public int getOcc_rate() {
		return occ_rate;
	}

	public void setOcc_rate(int occ_rate) {
		this.occ_rate = occ_rate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
