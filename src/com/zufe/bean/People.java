package com.zufe.bean;

import java.sql.Date;

public class People {
	private int peopleId;
	private String peopleName;
	private String peopleSex;
	private Date peopleBirth;
	private String peopleHometown;
	private int peopleHeight;// cm
	private String peopleEducation;
	private String peopleHealth;
	private String peopleFigure;
	private String peoplePhoto;
	private int isLost;
	private int provinceId;

	public int getPeopleId() {
		return peopleId;
	}

	public void setPeopleId(int peopleId) {
		this.peopleId = peopleId;
	}

	public String getPeopleName() {
		return peopleName;
	}

	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}

	public String getPeopleSex() {
		return peopleSex;
	}

	public void setPeopleSex(String peopleSex) {
		this.peopleSex = peopleSex;
	}

	public Date getPeopleBirth() {
		return peopleBirth;
	}

	public void setPeopleBirth(Date peopleBirth) {
		this.peopleBirth = peopleBirth;
	}

	public String getPeopleHometown() {
		return peopleHometown;
	}

	public void setPeopleHometown(String peopleHometown) {
		this.peopleHometown = peopleHometown;
	}

	public int getPeopleHeight() {
		return peopleHeight;
	}

	public void setPeopleHeight(int peopleHeight) {
		this.peopleHeight = peopleHeight;
	}

	public String getPeopleEducation() {
		return peopleEducation;
	}

	public void setPeopleEducation(String peopleEducation) {
		this.peopleEducation = peopleEducation;
	}

	public String getPeopleHealth() {
		return peopleHealth;
	}

	public void setPeopleHealth(String peopleHealth) {
		this.peopleHealth = peopleHealth;
	}

	public String getPeopleFigure() {
		return peopleFigure;
	}

	public void setPeopleFigure(String peopleFigure) {
		this.peopleFigure = peopleFigure;
	}

	public String getPeoplePhoto() {
		return peoplePhoto;
	}

	public void setPeoplePhoto(String peoplePhoto) {
		this.peoplePhoto = peoplePhoto;
	}

	public int getIsLost() {
		return isLost;
	}

	public void setIsLost(int isLost) {
		this.isLost = isLost;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
}
