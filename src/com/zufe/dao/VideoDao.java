package com.zufe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.zufe.bean.Video;
import com.zufe.util.DBUtil;

public class VideoDao {
	public Boolean addVideo(Video video) {
		// µÃµ½userId
		

		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into video(user_id,video_name,video_addr,video_pic) "
				+ "values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, video.getUserId());
			pstmt.setString(2, video.getVideoName());
			pstmt.setString(3, video.getVideoAddr());
			pstmt.setString(4, video.getVideoPic());
			
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
	
	public boolean deleteVideo(int videoId){
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from video where video_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, videoId);
			
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
	
	public Video getVideoById(int videoId) {
		Video video=new Video();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from video where video_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, videoId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				video.setVideoId(rs.getInt(1));
				video.setUserId(rs.getString(2));
				video.setVideoName(rs.getString(3));
				video.setVideoAddr(rs.getString(4));
				video.setVideoPic(rs.getString(5));
				return video;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(null, pstmt, conn);
		}

		return null;
	}
	
	public List<Video> getAllVideo(){
		List<Video> videoList=new ArrayList<Video>();
		
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from video";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Video video=new Video();
				video.setVideoId(rs.getInt(1));
				video.setUserId(rs.getString(2));
				video.setVideoName(rs.getString(3));
				video.setVideoAddr(rs.getString(4));
				video.setVideoPic(rs.getString(5));
				videoList.add(video);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.ColseJDBC(rs, stmt, conn);
		}
		return videoList;
	}
	
}
