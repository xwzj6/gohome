package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zufe.bean.Team;
import com.zufe.bean.User;
import com.zufe.util.DBUtil;

public class TeamDao {

	public Team addTeam(Team team) {
		Connection conn = DBUtil.getConnection();

		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select max(team_id) from team";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				team.setTeamId(rs.getInt(1) + 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}

		PreparedStatement pstmt = null;
		conn = DBUtil.getConnection();
		sql = "insert into team(team_id,team_name,team_province,team_leader,team_member_num,team_task_num,team_task_hour) "
				+ "values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, team.getTeamId());
			pstmt.setString(2, team.getTeamName());
			pstmt.setString(3, team.getTeamProvince());
			pstmt.setString(4, team.getTeamLeader());
			pstmt.setInt(5, team.getTeamMemberNum());
			pstmt.setInt(6, team.getTeamTaskNum());
			pstmt.setInt(7, team.getTeamTaskHour());

			int number = pstmt.executeUpdate();
			if (number > 0)
				return team;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return team;
	}

	public boolean updateTeamMemberNumByTeamId(int teamId, int change) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int memberNum = 0;
		String sql = "select team_member_num from team " + "where team_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberNum = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "update team set team_member_num=? " + "where team_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum + change);
			pstmt.setInt(2, teamId);
			int number = pstmt.executeUpdate();
			if (number > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return false;
	}

	public boolean updateTeamLeaderByTeamId(int teamId, String userId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String leaderId = null;
		User user = new User();
		UserDao userDao = new UserDao();
		String sql = "select team_leader from team " + "where team_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				leaderId = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "update team set team_leader=? " + "where team_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, teamId);
			int number = pstmt.executeUpdate();
			if (number > 0) {
				user.setUserId(userId);
				user.setUserState("队长");
				userDao.updateUserState(user);
				if (leaderId != null) {
					user.setUserId(leaderId);
					user.setUserState("志愿者");
					userDao.updateUserState(user);
				}

				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return false;
	}

	public Team updateTeam(Team team) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update team set team_name=?,team_province=?,team_leader=?,team_member_num=?,team_task_num=?,team_task_hour=? "
				+ "where team_id=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, team.getTeamName());
			pstmt.setString(2, team.getTeamProvince());
			pstmt.setString(3, team.getTeamLeader());
			pstmt.setInt(4, team.getTeamMemberNum());
			pstmt.setInt(5, team.getTeamTaskNum());
			pstmt.setInt(6, team.getTeamTaskHour());
			pstmt.setInt(7, team.getTeamId());

			int number = pstmt.executeUpdate();
			if (number > 0)
				return team;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return team;
	}

	public Team getTeamByTeamId(int teamId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from team " + "where team_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Team team = new Team();
				team.setTeamId(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setTeamProvince(rs.getString(3));
				team.setTeamLeader(rs.getString(4));
				team.setTeamMemberNum(rs.getInt(5));
				team.setTeamTaskNum(rs.getInt(6));
				team.setTeamTaskHour(rs.getInt(7));
				return team;
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
		String sql = "select count(*) from team";
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

	public List<Team> getTeamPageList(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Team> teamList = new ArrayList<Team>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from team limit " + firstIndex + "," + pageSize;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Team team = new Team();
				team.setTeamId(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setTeamProvince(rs.getString(3));
				team.setTeamLeader(rs.getString(4));
				team.setTeamMemberNum(rs.getInt(5));
				team.setTeamTaskNum(rs.getInt(6));
				team.setTeamTaskHour(rs.getInt(7));

				if (team.getTeamId() != 0)
					teamList.add(team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return teamList;
	}

	public List<Team> getTeamList() {
		// TODO Auto-generated method stub
		List<Team> teamList = new ArrayList<Team>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from team ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Team team = new Team();
				team.setTeamId(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setTeamProvince(rs.getString(3));
				team.setTeamLeader(rs.getString(4));
				team.setTeamMemberNum(rs.getInt(5));
				team.setTeamTaskNum(rs.getInt(6));
				team.setTeamTaskHour(rs.getInt(7));
				if (team.getTeamId() != 0)
					teamList.add(team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return teamList;
	}

	public Team toShowType(Team team) {
		if (team.getTeamLeader() == null)
			team.setTeamLeader("暂无");
		return team;
	}
}
