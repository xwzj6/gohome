package com.zufe.bean;

import java.util.ArrayList;
import java.util.List;

import com.zufe.dao.RecordDao;

public class RecordPage {

	private int pageSize = 10;
	// 当前页码
	private int pageNo = 1;
	// 总页数
	private int totalPages;
	// 每页数据记录集合
	private List<Record> pageData = new ArrayList<Record>();
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
		RecordDao recordDao = new RecordDao();
		int recordCount = recordDao.getRecordCount();
		this.totalPages = (recordCount + pageSize - 1) / pageSize;
		return totalPages;
	}

	public int getTotalPages(String userId) {
		RecordDao recordDao = new RecordDao();
		int recordCount = recordDao.getRecordCount(userId);
		this.totalPages = (recordCount + pageSize - 1) / pageSize;
		return totalPages;
	}

	public int getTotalPages(int lostId) {
		RecordDao recordDao = new RecordDao();
		int recordCount = recordDao.getRecordCount(lostId);
		this.totalPages = (recordCount + pageSize - 1) / pageSize;
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<Record> getPageData() {
		RecordDao recordDao = new RecordDao();
		this.pageData = recordDao.getRecordPageList(pageNo, pageSize);
		return pageData;
	}

	public List<Record> getPageData(String userId) {
		RecordDao recordDao = new RecordDao();
		this.pageData = recordDao.getUserPageList(pageNo, pageSize, userId);
		return pageData;
	}

	public List<Record> getPageData(int lostId) {
		RecordDao recordDao = new RecordDao();
		this.pageData = recordDao.getUserPageList(pageNo, pageSize, lostId);
		return pageData;
	}

	public void setPageData(List<Record> pageData) {
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
