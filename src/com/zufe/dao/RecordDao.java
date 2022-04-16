package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.zufe.bean.Lost;
import com.zufe.bean.Record;
import com.zufe.bean.User;
import com.zufe.util.DBUtil;

public class RecordDao {

	public Record addRecord(Record record) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into record(lost_id,user_id) " + "values(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, record.getLost().getLostId());
			pstmt.setString(2, record.getUser().getUserId());

			int number = pstmt.executeUpdate();
			if (number > 0)

				return record;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}
		return null;
	}

	public Record deleteRecord(Record record) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from record where record_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, record.getRecordId());
			int number = pstmt.executeUpdate();
			if (number > 0)
				return record;
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
		String sql = "select count(*) from record";
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

	public int getRecordCount(String userId) {
		// TODO Auto-generated method stub
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from record where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				recordCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return recordCount;
	}

	public int getRecordCount(int lostId) {
		// TODO Auto-generated method stub
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from record where lost_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lostId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				recordCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return recordCount;
	}
	
	public List<User> getNUser(int n){
		UserDao userDao=new UserDao();
		List<User> userList = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select user_id from record "
					+ " group by user_id " +
					" order by count(record_id) DESC "
					+ " limit " + 0 + "," + n;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			/*
			 * ResultSetMetaData rsmd = rs.getMetaData(); for (int i = 1; i <
			 * rsmd.getColumnCount()+1; i++) { String columnName =
			 * rsmd.getColumnName(i).toLowerCase();
			 * System.out.println(i+" "+columnName); }
			 */
			while (rs.next()) {
				User user=new User();
				user.setUserId(rs.getString(1));
				user=userDao.getUserById(user.getUserId());
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return userList;
	}
	
	public List<Record> getRecordPageList(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Record> recordList = new ArrayList<Record>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from user u,lost l,record r "
				+ "where u.user_id=r.user_id and l.lost_id=r.lost_id "
				+ " limit " + firstIndex + "," + pageSize;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			/*
			 * ResultSetMetaData rsmd = rs.getMetaData(); for (int i = 1; i <
			 * rsmd.getColumnCount()+1; i++) { String columnName =
			 * rsmd.getColumnName(i).toLowerCase();
			 * System.out.println(i+" "+columnName); }
			 */
			while (rs.next()) {

				Record record = new Record();
				record.getUser().setUserId(rs.getString(1));
				record.getUser().setUserName(rs.getString(2));
				record.getUser().setUserPass(rs.getString(3));
				record.getUser().setUserState(rs.getString(4));
				record.getUser().setTeamId(rs.getInt(5));
				record.getUser().setUserAge(rs.getInt(6));
				record.getUser().setUserSex(rs.getString(7));
				record.getUser().setUserPolitics(rs.getString(8));
				record.getUser().setUserJob(rs.getString(9));
				record.getUser().setUserAddress(rs.getString(10));
				record.getUser().setUserPhone(rs.getString(11));
				record.getUser().setUserWechat(rs.getString(12));
				record.getUser().setUserEmail(rs.getString(13));
				record.getUser().setUserRegistDate(rs.getDate(14));
				record.getUser().setUserArea(rs.getString(15));
				record.getUser().setUserId2(rs.getInt(16));

				record.getLost().setLostId(rs.getInt(17));
				record.getLost().setPeopleId(rs.getInt(18));
				record.getLost().setLostAddr(rs.getString(19));
				record.getLost().setLostTime(rs.getTime(20));
				record.getLost().setLostDate(rs.getDate(21));
				record.getLost().setLostDescription(rs.getString(22));
				record.getLost().setRelativesPhone(rs.getString(23));
				record.getLost().setRelativesName(rs.getString(24));
				record.getLost().setRelativesSex(rs.getString(25));
				record.getLost().setRelativesRelationship(rs.getString(26));
				record.getLost().setIsFind(rs.getInt(27));
				record.getLost().setFinishHour(rs.getInt(28));
				record.getLost().setProvinceId(rs.getInt(29));
				record.getLost().setIsCheck(rs.getInt(30));

				record.setRecordId(rs.getInt(31));
				recordList.add(record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return recordList;
	}

	public List<Record> getUserPageList(int pageNo, int pageSize, String userId) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Record> recordList = new ArrayList<Record>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// System.out.println("userNo:"+userNo+",userPass:"+userPass);
		String sql = "select * from user u,lost l,record r "
				+ "where u.user_id=r.user_id and l.lost_id=r.lost_id and u.user_id=? "
				+ " limit " + firstIndex + "," + pageSize;
		try {
			pstmt = conn.prepareStatement(sql);
			;
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				Record record = new Record();
				record.getUser().setUserId(rs.getString(1));
				record.getUser().setUserName(rs.getString(2));
				record.getUser().setUserPass(rs.getString(3));
				record.getUser().setUserState(rs.getString(4));
				record.getUser().setTeamId(rs.getInt(5));
				record.getUser().setUserAge(rs.getInt(6));
				record.getUser().setUserSex(rs.getString(7));
				record.getUser().setUserPolitics(rs.getString(8));
				record.getUser().setUserJob(rs.getString(9));
				record.getUser().setUserAddress(rs.getString(10));
				record.getUser().setUserPhone(rs.getString(11));
				record.getUser().setUserWechat(rs.getString(12));
				record.getUser().setUserEmail(rs.getString(13));
				record.getUser().setUserRegistDate(rs.getDate(14));
				record.getUser().setUserArea(rs.getString(15));
				record.getUser().setUserId2(rs.getInt(16));

				record.getLost().setLostId(rs.getInt(17));
				record.getLost().setPeopleId(rs.getInt(18));
				record.getLost().setLostAddr(rs.getString(19));
				record.getLost().setLostTime(rs.getTime(20));
				record.getLost().setLostDate(rs.getDate(21));
				record.getLost().setLostDescription(rs.getString(22));
				record.getLost().setRelativesPhone(rs.getString(23));
				record.getLost().setRelativesName(rs.getString(24));
				record.getLost().setRelativesSex(rs.getString(25));
				record.getLost().setRelativesRelationship(rs.getString(26));
				record.getLost().setIsFind(rs.getInt(27));
				record.getLost().setFinishHour(rs.getInt(28));
				record.getLost().setProvinceId(rs.getInt(29));
				record.getLost().setIsCheck(rs.getInt(30));

				record.setRecordId(rs.getInt(31));
				recordList.add(record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return recordList;
	}

	public List<Record> getUserPageList(int pageNo, int pageSize, int lostId) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Record> recordList = new ArrayList<Record>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// System.out.println("userNo:"+userNo+",userPass:"+userPass);
		String sql = "select * from user u,lost l,record r "
				+ "where u.user_id=r.user_id and l.lost_id=r.lost_id and l.lost_id=? "
				+ " limit " + firstIndex + "," + pageSize;
		try {
			pstmt = conn.prepareStatement(sql);
			;
			pstmt.setInt(1, lostId);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				Record record = new Record();
				record.getUser().setUserId(rs.getString(1));
				record.getUser().setUserName(rs.getString(2));
				record.getUser().setUserPass(rs.getString(3));
				record.getUser().setUserState(rs.getString(4));
				record.getUser().setTeamId(rs.getInt(5));
				record.getUser().setUserAge(rs.getInt(6));
				record.getUser().setUserSex(rs.getString(7));
				record.getUser().setUserPolitics(rs.getString(8));
				record.getUser().setUserJob(rs.getString(9));
				record.getUser().setUserAddress(rs.getString(10));
				record.getUser().setUserPhone(rs.getString(11));
				record.getUser().setUserWechat(rs.getString(12));
				record.getUser().setUserEmail(rs.getString(13));
				record.getUser().setUserRegistDate(rs.getDate(14));
				record.getUser().setUserArea(rs.getString(15));
				record.getUser().setUserId2(rs.getInt(16));

				record.getLost().setLostId(rs.getInt(17));
				record.getLost().setPeopleId(rs.getInt(18));
				record.getLost().setLostAddr(rs.getString(19));
				record.getLost().setLostTime(rs.getTime(20));
				record.getLost().setLostDate(rs.getDate(21));
				record.getLost().setLostDescription(rs.getString(22));
				record.getLost().setRelativesPhone(rs.getString(23));
				record.getLost().setRelativesName(rs.getString(24));
				record.getLost().setRelativesSex(rs.getString(25));
				record.getLost().setRelativesRelationship(rs.getString(26));
				record.getLost().setIsFind(rs.getInt(27));
				record.getLost().setFinishHour(rs.getInt(28));
				record.getLost().setProvinceId(rs.getInt(29));
				record.getLost().setIsCheck(rs.getInt(30));

				record.setRecordId(rs.getInt(31));
				recordList.add(record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return recordList;
	}

	public Record toShowType(Record record) {
		UserDao userDao = new UserDao();
		LostDao lostDao = new LostDao();
		record.setUser(userDao.toShowType(record.getUser()));
		record.setLost(lostDao.toShowType(record.getLost()));
		return record;
	}
}
