package com.entity;

public class JudgeRating extends Report {
	private String user_opinion_1;
	private String user_opinion_2;
	private int user_rate;
	
	public String getUser_opinion_1() {
		return user_opinion_1;
	}
	public void setUser_opinion_1(String user_opinion_1) {
		this.user_opinion_1 = user_opinion_1;
	}
	public String getUser_opinion_2() {
		return user_opinion_2;
	}
	public void setUser_opinion_2(String user_opinion_2) {
		this.user_opinion_2 = user_opinion_2;
	}
	public int getUser_rate() {
		return user_rate;
	}
	public void setUser_rate(int user_rate) {
		this.user_rate = user_rate;
	}
	
}
