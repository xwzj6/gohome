package com.zufe.bean;

import java.sql.Date;
import java.sql.Time;

public class Lost {
	private int lostId;
	private int peopleId;
	private String lostAddr;
	private Time lostTime;
	private Date lostDate;
	private String lostDescription;
	private String relativesPhone;
	private String relativesName;
	private String relativesSex;
	private String relativesRelationship;
	private int isFind;
	private int finishHour;
	private int provinceId;
	private int isCheck;

	public int getLostId() {
		return lostId;
	}

	public void setLostId(int lostId) {
		this.lostId = lostId;
	}

	public int getPeopleId() {
		return peopleId;
	}

	public void setPeopleId(int peopleId) {
		this.peopleId = peopleId;
	}

	public String getLostAddr() {
		return lostAddr;
	}

	public void setLostAddr(String lostAddr) {
		this.lostAddr = lostAddr;
	}

	public Time getLostTime() {
		return lostTime;
	}

	public void setLostTime(Time lostTime) {
		this.lostTime = lostTime;
	}

	public Date getLostDate() {
		return lostDate;
	}

	public void setLostDate(Date lostDate) {
		this.lostDate = lostDate;
	}

	public String getLostDescription() {
		return lostDescription;
	}

	public void setLostDescription(String lostDescription) {
		this.lostDescription = lostDescription;
	}

	public String getRelativesPhone() {
		return relativesPhone;
	}

	public void setRelativesPhone(String relativesPhone) {
		this.relativesPhone = relativesPhone;
	}

	public String getRelativesName() {
		return relativesName;
	}

	public void setRelativesName(String relativesName) {
		this.relativesName = relativesName;
	}

	public String getRelativesSex() {
		return relativesSex;
	}

	public void setRelativesSex(String relativesSex) {
		this.relativesSex = relativesSex;
	}

	public String getRelativesRelationship() {
		return relativesRelationship;
	}

	public void setRelativesRelationship(String relativesRelationship) {
		this.relativesRelationship = relativesRelationship;
	}

	public int getIsFind() {
		return isFind;
	}

	public void setIsFind(int isFind) {
		this.isFind = isFind;
	}

	public int getFinishHour() {
		return finishHour;
	}

	public void setFinishHour(int finishHour) {
		this.finishHour = finishHour;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public int getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}
}
