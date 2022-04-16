package com.zufe.bean;

import java.util.ArrayList;
import java.util.List;

import com.zufe.dao.TeamDao;
import com.zufe.dao.UserDao;

public class TeamPage {
	// Ĭ��ֵ��ÿҳ��ʾ��¼��
	private int pageSize = 10;
	// ��ǰҳ��
	private int pageNo = 1;
	// ��ҳ��
	private int totalPages;
	// ÿҳ���ݼ�¼����
	private List<Team> pageData = new ArrayList<Team>();
	private boolean hasNextPage;
	private boolean hasPreviousPage;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPages() {
		TeamDao teamDao = new TeamDao();
		int recordCount = teamDao.getRecordCount();
		this.totalPages = (recordCount + pageSize - 1) / pageSize;
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<Team> getPageData() {
		TeamDao teamDao = new TeamDao();
		this.pageData = teamDao.getTeamPageList(pageNo, pageSize);
		return pageData;
	}

	public void setPageData(List<Team> pageData) {
		this.pageData = pageData;
	}

	public boolean isHasNextPage() {
		return (this.pageNo < this.getTotalPages());
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public boolean isHasPreviousPage() {
		return this.pageNo > 1;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
}
