package com.zufe.bean;

public class ProvinceInfo {
	private int men = 0;
	private int women = 0;
	private int admin = 0;
	private int volunteer = 0;
	private int lostFound = 0;
	private int lost_Men = 0;
	private int lost_Women = 0;
	private int team = 0;
	private int lost = 0;

	public int getLost() {
		return lost;
	}

	public void setLost(int lost) {
		this.lost = lost;
	}

	public int getLost_Men() {
		return lost_Men;
	}

	public void setLost_Men(int lost_Men) {
		this.lost_Men = lost_Men;
	}

	public int getLost_Women() {
		return lost_Women;
	}

	public void setLost_Women(int lost_Women) {
		this.lost_Women = lost_Women;
	}

	private String provinceName = null;

	public int getMen() {
		return men;
	}

	public void setMen(int men) {
		this.men = men;
	}

	public int getWomen() {
		return women;
	}

	public void setWomen(int women) {
		this.women = women;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public int getVolunteer() {
		return volunteer;
	}

	public void setVolunteer(int volunteer) {
		this.volunteer = volunteer;
	}

	public int getLostFound() {
		return lostFound;
	}

	public void setLostFound(int lostFound) {
		this.lostFound = lostFound;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
}
