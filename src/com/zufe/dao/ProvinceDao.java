package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.zufe.bean.Province;
import com.zufe.bean.ProvinceInfo;
import com.zufe.util.DBUtil;

public class ProvinceDao {
	public String getProvinceNameById(int provinceId) {
		if (provinceId > 35)
			return null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select province_name from province where province_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, provinceId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return null;
	}

	public int getUserNumbyProvinceId(int provinceId) {
		if (provinceId > 35)
			return 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProvinceDao provinceDao = new ProvinceDao();
		String sql = "select count(*) from user where team_id in "
				+ "(select team_id from team where team_province=? )";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		return 0;
	}

	public ProvinceInfo getProvinceInfoByProvinceId(int provinceId) {
		if (provinceId > 35)
			return null;
		ProvinceInfo provinceInfo = new ProvinceInfo();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProvinceDao provinceDao = new ProvinceDao();
		String sql = "select count(*) from team where team_province=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setTeam(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from user where user_sex='女' and team_id in "
				+ "(select team_id from team where team_province=? )";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setWomen(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from user where user_sex='男' and team_id in "
				+ "(select team_id from team where team_province=? )";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setMen(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from user where user_state='志愿者' and team_id in "
				+ "(select team_id from team where team_province=? )";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setVolunteer(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from user where user_state='管理员' and team_id in "
				+ "(select team_id from team where team_province=? )";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setAdmin(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		// 男性失踪者
		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from lost l,people p "
				+ "where l.province_id=? and l.is_check=1 and l.is_find=0 and p.people_sex='男' "
				+ "and  l.people_id=p.people_id";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, provinceId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setLost_Men(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		// 女性失踪者
		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from lost l,people p "
				+ "where l.province_id=? and l.is_check=1 and l.is_find=0 and p.people_sex='女' "
				+ "and  l.people_id=p.people_id";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, provinceId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setLost_Women(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}
		// 失踪记录
		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from lost where province_id=? and is_check=1 and is_find=0 ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, provinceId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setLost(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		// 已找到的记录
		conn = DBUtil.getConnection();
		pstmt = null;
		rs = null;
		sql = "select count(*) from lost where province_id=? and is_check=1 and is_find=1 ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, provinceDao.getProvinceNameById(provinceId));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				provinceInfo.setLostFound(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, pstmt, conn);
		}

		provinceInfo.setProvinceName(this.getProvinceNameById(provinceId));

		return provinceInfo;
	}
}
