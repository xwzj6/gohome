package com.zufe.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.zufe.bean.User;
import com.zufe.util.DBUtil;

public class UserDao {

	/**
	 * 注册用户登陆
	 */
	public String login(String userId, String userPass) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// System.out.println("userNo:"+userNo+",userPass:"+userPass);
		String sql = "select * from user where user_id=? and user_pass=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return userId;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return "";
	}

	public User getUserById(String userId) {
		User user = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				user = new User();

				user.setUserId(rs.getString(1));
				user.setUserName(rs.getString(2));
				user.setUserPass(rs.getString(3));
				user.setUserState(rs.getString(4));
				user.setTeamId(rs.getInt(5));
				user.setUserAge(rs.getInt(6));
				user.setUserSex(rs.getString(7));
				user.setUserPolitics(rs.getString(8));
				user.setUserJob(rs.getString(9));
				user.setUserAddress(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserWechat(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				user.setUserRegistDate(rs.getDate(14));
				user.setUserArea(rs.getString(15));
				user.setUserId2(rs.getInt(16));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return user;
	}

	public User addUser(User user) {
		// 得到userId
		TeamDao teamDao = new TeamDao();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select max(user_id2) from user";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				user.setUserId2(rs.getInt(1) + 1);
				user.setUserId(String.valueOf(user.getUserId2()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}

		conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		sql = "insert into user(user_id,user_name,user_pass,user_state,team_id,user_age,user_sex,user_politics,user_job,user_address,user_phone,user_wechat,user_email,user_regist,user_area,user_id2) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPass());
			pstmt.setString(4, user.getUserState());
			if (user.getUserState().equals("管理员")) {
				pstmt.setInt(5, 0);
			} else
				pstmt.setInt(5, user.getTeamId());
			pstmt.setInt(6, user.getUserAge());
			pstmt.setString(7, user.getUserSex());
			pstmt.setString(8, user.getUserPolitics());
			pstmt.setString(9, user.getUserJob());
			pstmt.setString(10, user.getUserAddress());
			pstmt.setString(11, user.getUserPhone());
			pstmt.setString(12, user.getUserWechat());
			pstmt.setString(13, user.getUserEmail());
			if (user.getUserRegistDate() == null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date = new java.util.Date();
				pstmt.setString(14, sdf.format(date).toString());
			} else
				pstmt.setDate(14, user.getUserRegistDate());
			pstmt.setString(15, user.getUserArea());
			pstmt.setInt(16, user.getUserId2());
			int number = pstmt.executeUpdate();
			if (number > 0)
				if (user.getTeamId() != 0) {
					teamDao.updateTeamMemberNumByTeamId(user.getTeamId(), 1);
				}
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return null;
	}

	public boolean changeUserPass(User user) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update user set user_pass = ? " + "where user_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserPass());
			pstmt.setString(2, user.getUserId());
			int number = pstmt.executeUpdate();
			if (number > 0)
				// System.out.println("userId:"+user.getUserId()+",userState:"+user.getUserState());
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return false;
	}

	public User changeUserInfo(User user) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update user set user_name=?,user_state=?,team_id=?,user_age=?,user_sex=?,user_politics=?,user_job=?,user_address=?,user_phone=?,user_wechat=?,user_email=?,user_area=?  "
				+ "where user_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserState());
			if (user.getUserState().equals("管理员")
					|| user.getUserState().equals("超级管理员")) {
				pstmt.setInt(3, 0);
			} else
				pstmt.setInt(3, user.getTeamId());
			pstmt.setInt(4, user.getUserAge());
			pstmt.setString(5, user.getUserSex());
			pstmt.setString(6, user.getUserPolitics());
			pstmt.setString(7, user.getUserJob());
			pstmt.setString(8, user.getUserAddress());
			pstmt.setString(9, user.getUserPhone());
			pstmt.setString(10, user.getUserWechat());
			pstmt.setString(11, user.getUserEmail());
			pstmt.setString(12, user.getUserArea());
			pstmt.setString(13, user.getUserId());
			int number = pstmt.executeUpdate();
			if (number > 0)
				// System.out.println("userId:"+user.getUserId()+",userState:"+user.getUserState());
				return user;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return null;
	}

	public boolean deleteUser(User user) {
		// 得到userId
		Connection conn = DBUtil.getConnection();
		String sql = "select max(user_id2) from user";
		PreparedStatement pstmt = null;
		TeamDao teamDao = new TeamDao();
		sql = "delete from user " + "where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getUserId());

			int number = pstmt.executeUpdate();
			if (number > 0)
				if (user.getTeamId() != 0) {
					teamDao.updateTeamMemberNumByTeamId(user.getTeamId(), -1);
				}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return false;
	}

	public List<User> getAllUser() {
		List<User> userList = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from user";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setUserName(rs.getString(2));
				user.setUserPass(rs.getString(3));
				user.setUserState(rs.getString(4));
				user.setTeamId(rs.getInt(5));
				user.setUserAge(rs.getInt(6));
				user.setUserSex(rs.getString(7));
				user.setUserPolitics(rs.getString(8));
				user.setUserJob(rs.getString(9));
				user.setUserAddress(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserWechat(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				user.setUserRegistDate(rs.getDate(14));
				user.setUserArea(rs.getString(15));
				user.setUserId2(rs.getInt(16));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return userList;

	}
	

	public List<User> getUserPageList(int pageNo, int pageSize) {
		int firstIndex = pageSize * (pageNo - 1);
		List<User> userList = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from user limit " + firstIndex + "," + pageSize;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setUserName(rs.getString(2));
				user.setUserPass(rs.getString(3));
				user.setUserState(rs.getString(4));
				user.setTeamId(rs.getInt(5));
				user.setUserAge(rs.getInt(6));
				user.setUserSex(rs.getString(7));
				user.setUserPolitics(rs.getString(8));
				user.setUserJob(rs.getString(9));
				user.setUserAddress(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserWechat(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				user.setUserRegistDate(rs.getDate(14));
				user.setUserArea(rs.getString(15));
				user.setUserId2(rs.getInt(16));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return userList;

	}

	public int getRecordCount() {
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from user";
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

	public List<User> getUserPageListByTeamId(int pageNo, int pageSize,
			int teamId) {
		int firstIndex = pageSize * (pageNo - 1);
		List<User> userList = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where team_id=? limit " + firstIndex
				+ "," + pageSize;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setUserName(rs.getString(2));
				user.setUserPass(rs.getString(3));
				user.setUserState(rs.getString(4));
				user.setTeamId(rs.getInt(5));
				user.setUserAge(rs.getInt(6));
				user.setUserSex(rs.getString(7));
				user.setUserPolitics(rs.getString(8));
				user.setUserJob(rs.getString(9));
				user.setUserAddress(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserWechat(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				user.setUserRegistDate(rs.getDate(14));
				user.setUserArea(rs.getString(15));
				user.setUserId2(rs.getInt(16));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return userList;
	}
	
	public List<User> getUserPageListInTeamIdOutLostId(int pageNo, int pageSize,
			int teamId,int lostId) {
		int firstIndex = pageSize * (pageNo - 1);
		List<User> userList = new ArrayList<User>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where team_id=? and user_id not in " +
				" (select user_id from record where lost_id=?) " +
				" limit " + firstIndex
				+ "," + pageSize;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teamId);
			pstmt.setInt(2, lostId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setUserName(rs.getString(2));
				user.setUserPass(rs.getString(3));
				user.setUserState(rs.getString(4));
				user.setTeamId(rs.getInt(5));
				user.setUserAge(rs.getInt(6));
				user.setUserSex(rs.getString(7));
				user.setUserPolitics(rs.getString(8));
				user.setUserJob(rs.getString(9));
				user.setUserAddress(rs.getString(10));
				user.setUserPhone(rs.getString(11));
				user.setUserWechat(rs.getString(12));
				user.setUserEmail(rs.getString(13));
				user.setUserRegistDate(rs.getDate(14));
				user.setUserArea(rs.getString(15));
				user.setUserId2(rs.getInt(16));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return userList;
	}
	
	public int getRecordCountByTeamId(int teamId) {
		// TODO Auto-generated method stub
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from user where team_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teamId);
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

	public User toShowType(User user) {
		String str = "未填写";
		if (user.getUserName() == null)
			user.setUserName(str);
		if (user.getUserState().equals("管理员")
				|| user.getUserState().equals("超级管理员"))
			user.setTeamId(0);
		if (user.getUserSex() == null)
			user.setUserSex(str);
		if (user.getUserPolitics() == null)
			user.setUserPolitics(str);
		if (user.getUserJob() == null)
			user.setUserJob(str);
		if (user.getUserAddress() == null)
			user.setUserAddress(str);
		if (user.getUserPhone() == null)
			user.setUserPhone(str);
		if (user.getUserWechat() == null)
			user.setUserWechat(str);
		if (user.getUserEmail() == null)
			user.setUserEmail(str);
		user.getUserArea();
		return user;
	}
	
	public User toUseType(User user) {
		String str = "未填写";
		if (user.getUserName() == str)
			user.setUserName(null);
		if (user.getUserState().equals("管理员")
				|| user.getUserState().equals("超级管理员"))
			user.setTeamId(0);
		if (user.getUserSex() == str)
			user.setUserSex(null);
		if (user.getUserPolitics() == str)
			user.setUserPolitics(null);
		if (user.getUserJob() == str)
			user.setUserJob(null);
		if (user.getUserAddress() == str)
			user.setUserAddress(null);
		if (user.getUserPhone() == str)
			user.setUserPhone(null);
		if (user.getUserWechat() == str)
			user.setUserWechat(null);
		if (user.getUserEmail() == str)
			user.setUserEmail(null);
		user.getUserArea();
		return user;
	}

	boolean updateUserState(User user) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userState;
		String sql = "select user_state from user " + "where user_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userState = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "update user set user_state = ? " + "where user_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserState());
			pstmt.setString(2, user.getUserId());
			int number = pstmt.executeUpdate();
			if (number > 0)
				// System.out.println("userId:"+user.getUserId()+",userState:"+user.getUserState());
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return false;
	}
}
