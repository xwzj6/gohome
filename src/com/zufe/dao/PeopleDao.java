package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.zufe.bean.People;
import com.zufe.bean.User;
import com.zufe.util.DBUtil;

public class PeopleDao {
	public People addPeople(People people) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "insert into people(people_name,people_sex,people_birth,people_hometown,people_height,people_education,people_health,people_figure,people_photo,is_lost,province_id) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, people.getPeopleName());
			pstmt.setString(2, people.getPeopleSex());
			pstmt.setDate(3, people.getPeopleBirth());
			pstmt.setString(4, people.getPeopleHometown());
			pstmt.setInt(5, people.getPeopleHeight());
			pstmt.setString(6, people.getPeopleEducation());

			pstmt.setString(7, people.getPeopleHealth());
			pstmt.setString(8, people.getPeopleFigure());
			pstmt.setString(9, people.getPeoplePhoto());

			pstmt.setInt(10, people.getIsLost());
			pstmt.setInt(11, people.getProvinceId());
			int number = pstmt.executeUpdate();
			if (number > 0)
				return people;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return null;
	}

	public People getPeopleByPeopleId(int peopleId) {//
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from people where people_id=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, peopleId);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				People people = new People();
				pstmt = conn.prepareStatement(sql);
				people.setPeopleId(rs.getInt(1));
				people.setPeopleName(rs.getString(2));
				people.setPeopleSex(rs.getString(3));
				people.setPeopleBirth(rs.getDate(4));
				people.setPeopleHometown(rs.getString(5));
				people.setPeopleHeight(rs.getInt(6));
				people.setPeopleEducation(rs.getString(7));

				people.setPeopleHealth(rs.getString(8));
				people.setPeopleFigure(rs.getString(9));
				people.setPeoplePhoto(rs.getString(10));

				people.setIsLost(rs.getInt(11));
				people.setProvinceId(rs.getInt(12));
				return people;
				/*
				 * user.setUserPass(rs.getString(3));
				 * user.setUserRegistDate(rs.getDate(4));
				 */
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return null;
	}

	public int getRecordCount() {
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from people";
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

	public People updatePeople(People people) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update people set people_name=?,people_sex=?,people_birth=?,people_hometown=?,people_height=?,people_education=?,people_health=?,people_figure=?,people_photo=?,is_lost=?,province_id=? "
				+ "where people_id=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, people.getPeopleName());
			pstmt.setString(2, people.getPeopleSex());
			pstmt.setDate(3, people.getPeopleBirth());
			pstmt.setString(4, people.getPeopleHometown());
			pstmt.setInt(5, people.getPeopleHeight());
			pstmt.setString(6, people.getPeopleEducation());

			pstmt.setString(7, people.getPeopleHealth());
			pstmt.setString(8, people.getPeopleFigure());
			pstmt.setString(9, people.getPeoplePhoto());

			pstmt.setInt(10, people.getIsLost());
			pstmt.setInt(11, people.getProvinceId());
			pstmt.setInt(12, people.getPeopleId());
			int number = pstmt.executeUpdate();
			if (number > 0)
				return people;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return people;
	}

	public People toShowType(People people) {
		String str = "Œ¥ÃÓ–¥";
		if (people.getPeopleName() == null)
			people.setPeopleName(str);
		if (people.getPeopleSex() == null)
			people.setPeopleSex(str);
		// if( people.getPeopleBirth()==null)people.setPeopleBirth(str);
		if (people.getPeopleHometown() == null)
			people.setPeopleHometown(str);
		// if(people.getPeopleHeight()==null)people.setPeopleHeight(str);
		if (people.getPeopleEducation() == null)
			people.setPeopleEducation(str);

		if (people.getPeopleHealth() == null)
			people.setPeopleHealth(str);
		if (people.getPeopleFigure() == null)
			people.setPeopleFigure(str);
		// if(people.getPeoplePhoto()==null)people.setPeoplePhoto();

		return people;

	}
}
