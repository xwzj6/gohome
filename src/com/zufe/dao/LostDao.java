package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zufe.bean.Lost;
import com.zufe.bean.LostTeam;
import com.zufe.bean.User;
import com.zufe.util.DBUtil;

public class LostDao {

	public Lost updatePeopleIsLost(Lost lost) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE people SET is_lost = ? " + "WHERE people_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (lost.getIsFind() == 1) ? 0 : 1);
			pstmt.setInt(2, lost.getPeopleId());
			int number = pstmt.executeUpdate();
			if (number > 0) {
				return lost;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}
		return null;
	}

	public Lost addLost(Lost lost) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into lost (people_id,lost_addr,lost_time,lost_date,lost_description,relatives_phone,relatives_name,relatives_sex,relatives_relationship,is_find,finish_hour,province_id,is_check) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, lost.getPeopleId());
			pstmt.setString(2, lost.getLostAddr());
			pstmt.setTime(3, lost.getLostTime());
			pstmt.setDate(4, lost.getLostDate());
			pstmt.setString(5, lost.getLostDescription());
			pstmt.setString(6, lost.getRelativesPhone());
			pstmt.setString(7, lost.getRelativesName());
			pstmt.setString(8, lost.getRelativesSex());
			pstmt.setString(9, lost.getRelativesRelationship());
			pstmt.setInt(10, lost.getIsFind());
			pstmt.setInt(11, lost.getFinishHour());
			pstmt.setInt(12, lost.getProvinceId());
			pstmt.setInt(13, lost.getIsCheck());
			int number = pstmt.executeUpdate();
			if (number > 0) {
				if (lost.getIsCheck() == 1 && lost.getIsFind() == 0) {
					this.updatePeopleIsLost(lost);
				}
				return lost;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}
		return null;
	}

	public int getRecordCount() {
		// TODO Auto-generated method stub
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from lost";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				recordCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return recordCount;
	}

	public int getRecordCountNotFind() {
		// TODO Auto-generated method stub
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from lost where is_find=0";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				recordCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return recordCount;
	}

	public int getRecordCountHasFind() {
		// TODO Auto-generated method stub
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from lost where is_find=1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				recordCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return recordCount;
	}

	public List<Lost> getLostPageList(int pageNo, int pageSize, int isCheck,
			String key, int provinceId) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Lost> lostList = new ArrayList<Lost>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql;
		try {
			if (provinceId == 0) {
				sql = "select * from lost where is_check="
						+ isCheck
						+ " and people_id in "
						+ "(select people_id from people where people_name like '%"
						+ key + "%') " + " limit " + firstIndex + ","
						+ pageSize;
			} else {
				sql = "select * from lost where is_check="
						+ isCheck
						+ " and province_id="
						+ provinceId
						+ " and people_id in "
						+ "(select people_id from people where people_name like '%"
						+ key + "%') " + " limit " + firstIndex + ","
						+ pageSize;
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Lost lost = new Lost();
				lost.setLostId(rs.getInt(1));
				lost.setPeopleId(rs.getInt(2));
				lost.setLostAddr(rs.getString(3));
				lost.setLostTime(rs.getTime(4));
				lost.setLostDate(rs.getDate(5));
				lost.setLostDescription(rs.getString(6));
				lost.setRelativesPhone(rs.getString(7));
				lost.setRelativesName(rs.getString(8));
				lost.setRelativesSex(rs.getString(9));
				lost.setRelativesRelationship(rs.getString(10));
				lost.setIsFind(rs.getInt(11));
				lost.setFinishHour(rs.getInt(12));
				lost.setProvinceId(rs.getInt(13));
				lost.setIsCheck(rs.getInt(14));
				lostList.add(lost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return lostList;
	}

	public List<Lost> getLostPageListWaitCheck(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Lost> lostList = new ArrayList<Lost>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from lost where is_check=0 limit " + firstIndex
				+ "," + pageSize;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Lost lost = new Lost();
				lost.setLostId(rs.getInt(1));
				lost.setPeopleId(rs.getInt(2));
				lost.setLostAddr(rs.getString(3));
				lost.setLostTime(rs.getTime(4));
				lost.setLostDate(rs.getDate(5));
				lost.setLostDescription(rs.getString(6));
				lost.setRelativesPhone(rs.getString(7));
				lost.setRelativesName(rs.getString(8));
				lost.setRelativesSex(rs.getString(9));
				lost.setRelativesRelationship(rs.getString(10));
				lost.setIsFind(rs.getInt(11));
				lost.setFinishHour(rs.getInt(12));
				lost.setProvinceId(rs.getInt(13));
				lost.setIsCheck(rs.getInt(14));
				lostList.add(lost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return lostList;
	}

	public List<Lost> getLostPageListHaveCheck(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Lost> lostList = new ArrayList<Lost>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from lost where is_check=1 limit " + firstIndex
				+ "," + pageSize;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Lost lost = new Lost();
				lost.setLostId(rs.getInt(1));
				lost.setPeopleId(rs.getInt(2));
				lost.setLostAddr(rs.getString(3));
				lost.setLostTime(rs.getTime(4));
				lost.setLostDate(rs.getDate(5));
				lost.setLostDescription(rs.getString(6));
				lost.setRelativesPhone(rs.getString(7));
				lost.setRelativesName(rs.getString(8));
				lost.setRelativesSex(rs.getString(9));
				lost.setRelativesRelationship(rs.getString(10));
				lost.setIsFind(rs.getInt(11));
				lost.setFinishHour(rs.getInt(12));
				lost.setProvinceId(rs.getInt(13));
				lost.setIsCheck(rs.getInt(14));
				lostList.add(lost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return lostList;
	}

	public Lost getLostByLostId(int lostId) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from lost " + "where lost_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lostId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Lost lost = new Lost();
				lost.setLostId(rs.getInt(1));
				lost.setPeopleId(rs.getInt(2));
				lost.setLostAddr(rs.getString(3));
				lost.setLostTime(rs.getTime(4));
				lost.setLostDate(rs.getDate(5));
				lost.setLostDescription(rs.getString(6));
				lost.setRelativesPhone(rs.getString(7));
				lost.setRelativesName(rs.getString(8));
				lost.setRelativesSex(rs.getString(9));
				lost.setRelativesRelationship(rs.getString(10));
				lost.setIsFind(rs.getInt(11));
				lost.setFinishHour(rs.getInt(12));
				lost.setProvinceId(rs.getInt(13));
				lost.setIsCheck(rs.getInt(14));
				return lost;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return null;
	}

	public Lost toShowType(Lost lost) {
		String str = "Œ¥ÃÓ–¥";
		// if(lost.setLostId);
		// if(lost.setPeopleId);
		if (lost.getLostAddr() == null)
			;
		// if(lost.getLostTime());
		// if(lost.getLostDate();
		if (lost.getLostDescription() == null)
			lost.setLostDescription(str);
		if (lost.getRelativesPhone() == null)
			lost.setRelativesPhone(str);
		if (lost.getRelativesName() == null)
			lost.setRelativesName(str);
		if (lost.getRelativesSex() == null)
			lost.setRelativesSex(str);
		if (lost.getRelativesRelationship() == null)
			lost.setRelativesRelationship(str);
		// if(lost.setIsFind());
		// if(lost.setFinishHour());
		// if(lost.setProvinceId());
		// if(lost.setIsCheck());
		return lost;
	}

}
