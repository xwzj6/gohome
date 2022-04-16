package com.zufe.bean;

public class Team {
	private int teamId;
	private String teamName;
	private String teamProvince;
	private String teamLeader = null;
	private int teamMemberNum = 0;
	private int teamTaskNum = 0;
	private int TeamTaskHour = 0;

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamProvince() {
		return teamProvince;
	}

	public void setTeamProvince(String teamProvince) {
		this.teamProvince = teamProvince;
	}

	public String getTeamLeader() {
		return teamLeader;
	}

	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}

	public int getTeamMemberNum() {
		return teamMemberNum;
	}

	public void setTeamMemberNum(int teamMemberNum) {
		this.teamMemberNum = teamMemberNum;
	}

	public int getTeamTaskNum() {
		return teamTaskNum;
	}

	public void setTeamTaskNum(int teamTaskNum) {
		this.teamTaskNum = teamTaskNum;
	}

	public int getTeamTaskHour() {
		return TeamTaskHour;
	}

	public void setTeamTaskHour(int teamTaskHour) {
		TeamTaskHour = teamTaskHour;
	}

}
