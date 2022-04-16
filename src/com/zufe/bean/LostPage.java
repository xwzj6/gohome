package com.zufe.bean;

import java.util.ArrayList;
import java.util.List;

import com.zufe.dao.LostDao;

public class LostPage {
	private int pageSize = 10;
	// 当前页码
	private int pageNo = 1;
	// 总页数
	private int totalPages;
	// 每页数据记录集合
	private List<Lost> pageData = new ArrayList<Lost>();
	private boolean hasNextPage;
	private boolean hasPreviousPage;
	private int isCheck = 0;
	private String key = null;
	private int provinceId = 0;

	public int getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

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
		LostDao lostDao = new LostDao();
		int recordCount = lostDao.getRecordCount();
		this.totalPages = (recordCount + pageSize - 1) / pageSize;
		return totalPages;
	}
/*
	public int getTotalPagesByUserId(int userId) {
		LostDao lostDao = new LostDao();
		int recordCount = lostDao.getRecordCountByUserId(userId);
		this.totalPages = (recordCount + pageSize - 1) / pageSize;
		return totalPages;
	}
*/
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<Lost> getPageData() {
		LostDao lostDao = new LostDao();
		this.pageData = lostDao.getLostPageList(pageNo, pageSize, isCheck, key,
				provinceId);
		return pageData;
	}

	public List<Lost> getPageDataWaitCheck() {
		LostDao lostDao = new LostDao();
		this.pageData = lostDao.getLostPageListWaitCheck(pageNo, pageSize);
		return pageData;
	}

	public List<Lost> getPageDataHaveCheck() {
		LostDao lostDao = new LostDao();
		this.pageData = lostDao.getLostPageListHaveCheck(pageNo, pageSize);
		return pageData;
	}

	public void setPageData(List<Lost> pageData) {
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
