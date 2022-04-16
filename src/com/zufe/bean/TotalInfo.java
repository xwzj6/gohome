package com.zufe.bean;

import com.zufe.dao.LostDao;
import com.zufe.dao.PeopleDao;
import com.zufe.dao.RecordDao;
import com.zufe.dao.TeamDao;
import com.zufe.dao.UserDao;

public class TotalInfo {
	private int totalUser = 0;
	private int totalTeam = 0;

	private int totalLostNotFind = 0;
	private int totalLostHasFind = 0;
	private int totalPeople = 0;
	private int totalRecord = 0;

	public TotalInfo() {
		UserDao userDao = new UserDao();
		TeamDao teamDao = new TeamDao();
		LostDao lostDao = new LostDao();
		PeopleDao peopleDao = new PeopleDao();
		RecordDao recordDao = new RecordDao();

		totalUser = userDao.getRecordCount();
		totalTeam = teamDao.getRecordCount();
		totalLostNotFind = lostDao.getRecordCountNotFind();
		totalLostHasFind = lostDao.getRecordCountHasFind();
		totalPeople = peopleDao.getRecordCount();
		totalRecord = recordDao.getRecordCount();
	}

	public int getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}

	public int getTotalTeam() {
		return totalTeam;
	}

	public void setTotalTeam(int totalTeam) {
		this.totalTeam = totalTeam;
	}

	public int getTotalLostNotFind() {
		return totalLostNotFind;
	}

	public void setTotalLostNotFind(int totalLostNotFind) {
		this.totalLostNotFind = totalLostNotFind;
	}

	public int getTotalLostHasFind() {
		return totalLostHasFind;
	}

	public void setTotalLostHasFind(int totalLostHasFind) {
		this.totalLostHasFind = totalLostHasFind;
	}

	public int getTotalPeople() {
		return totalPeople;
	}

	public void setTotalPeople(int totalPeople) {
		this.totalPeople = totalPeople;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
}
