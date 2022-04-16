package com.zufe.bean;

public class Record {
	private int recordId;
	private User user;
	private Lost lost;

	public Record() {
		user = new User();
		lost = new Lost();
	}

	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Lost getLost() {
		return lost;
	}

	public void setLost(Lost lost) {
		this.lost = lost;
	}

}
