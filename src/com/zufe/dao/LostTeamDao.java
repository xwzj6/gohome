package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zufe.bean.LostTeam;
import com.zufe.bean.Team;
import com.zufe.bean.User;
import com.zufe.util.DBUtil;

public class LostTeamDao {
	public boolean addLostTeam(LostTeam lt) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into lost_team(team_id,lost_id) " + "values(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, lt.getTeamId());
			pstmt.setInt(2, lt.getLostId());

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

	public LostTeam getLostTeamByLostId(int lostId) {
		LostTeam lt = new LostTeam();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from lost_team " + "where lost_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lostId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lt.setLostId(rs.getInt(1));
				lt.setTeamId(rs.getInt(2));
				lt.setId(rs.getInt(3));
				return lt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return null;
	}

	public List<LostTeam> getLostTeamByTeamId(int teamId) {
		List<LostTeam> ltList = new ArrayList<LostTeam>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from lost_team " + "where team_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				LostTeam lt = new LostTeam();
				lt.setLostId(rs.getInt(1));
				lt.setTeamId(rs.getInt(2));
				lt.setId(rs.getInt(3));
				ltList.add(lt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return ltList;
	}
	/*
	 * public boolean updateLostTeam(int lostId,int teamId){ Connection conn =
	 * DBUtil.getConnection(); PreparedStatement pstmt = null; ResultSet rs =
	 * null; String leaderId=null; User user=new User(); UserDao userDao=new
	 * UserDao(); String sql = "update team set team_leader=? " +
	 * "where team_id=? "; try{ pstmt = conn.prepareStatement(sql);
	 * pstmt.setString(1, userId); pstmt.setInt(2, teamId); int number =
	 * pstmt.executeUpdate(); if(number > 0){ user.setUserId(userId);
	 * user.setUserState("队长"); userDao.updateUserState(user);
	 * if(leaderId!=null){ user.setUserId(leaderId); user.setUserState("志愿者");
	 * userDao.updateUserState(user); }
	 * 
	 * return true; } }catch(Exception e) { e.printStackTrace(); }finally{
	 * DBUtil.ColseJDBC(null, pstmt, conn); }
	 * 
	 * return false; }
	 */
}
