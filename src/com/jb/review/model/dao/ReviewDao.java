package com.jb.review.model.dao;
import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jb.review.model.vo.Review;

public class ReviewDao {
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String path = ReviewDao.class.getResource("/sql/review/review-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//전체리뷰수
	public int selectReviewCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectReviewCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();			
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	//리뷰리스트
	public List<Review> selectReviewList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> list=new ArrayList<Review>();
		String sql=prop.getProperty("selectReviewList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r = new Review();
				r.setrNo(rs.getInt("r_no"));
				r.setrTitle(rs.getString("r_title"));
				r.setrEntDate(rs.getDate("r_ent_date"));
				r.setrContent(rs.getString("r_content"));
				r.setrBoardCnt(rs.getInt("r_board_cnt"));
				r.setrViewCnt(rs.getInt("r_view_cnt"));
				r.setrStatus(rs.getString("r_status"));
				r.setcId(rs.getString("c_id"));
				r.setpCode(rs.getString("p_code"));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//업주의 펜션에 대한 리뷰수
	public int selectMyPensionReviewCount(Connection conn, String pCode) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectMyPensionReviewCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();			
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	//업주의 펜션에 대한 리뷰
	public List<Review> selectMyPensionReviewList(Connection conn,String pCode, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> list=new ArrayList<Review>();
		String sql=prop.getProperty("selectMyPensionReviewList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r = new Review();
				r.setrNo(rs.getInt("r_no"));
				r.setrTitle(rs.getString("r_title"));
				r.setrEntDate(rs.getDate("r_ent_date"));
				r.setrContent(rs.getString("r_content"));
				r.setrBoardCnt(rs.getInt("r_board_cnt"));
				r.setrViewCnt(rs.getInt("r_view_cnt"));
				r.setrStatus(rs.getString("r_status"));
				r.setcId(rs.getString("c_id"));
				r.setpCode(rs.getString("p_code"));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int updateCount(Connection conn, int rNo) {
		Statement stmt=null;
		int result=0;
		String sql = "update review set r_view_cnt=r_view_cnt+1 where r_no="+rNo;
		try {
			stmt= conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}return result;
	}
	
	public Review selectReviewOne(Connection conn,int rNo) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Review r = null;
		String sql = prop.getProperty("selectReviewOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r=new Review();
				r.setrNo(rs.getInt("r_no"));
				r.setrTitle(rs.getString("r_title"));
				r.setrEntDate(rs.getDate("r_ent_date"));
				r.setrContent(rs.getString("r_content"));
				r.setrBoardCnt(rs.getInt("r_board_cnt"));
				r.setrViewCnt(rs.getInt("r_view_cnt"));
				r.setrStatus(rs.getString("r_status"));
				r.setcId(rs.getString("c_id"));
				r.setpCode(rs.getString("p_code"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return r;
	}
	
}
