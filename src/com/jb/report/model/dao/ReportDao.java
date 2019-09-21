package com.jb.report.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jb.report.model.vo.Report;

public class ReportDao {
	private Properties prop=new Properties();
	public ReportDao() {
		String path = ReportDao.class.getResource("/sql/report/report-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
			
		}
	}
	

	public int insertReport(Connection conn, Report r) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertReport");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getCategory());
			pstmt.setString(2, r.getContent());
			pstmt.setString(3, r.getcId());
			pstmt.setInt(4, r.getCmmNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int selectCountReport(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectCountReport");
		int result=0;
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
		}
		return result;
	}


	public List<Report> selectReport(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectReport");
		List<Report> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Report r=new Report();
				r.setRepNo(rs.getInt("rep_no"));
				r.setCategory(rs.getString("category"));
				r.setContent(rs.getString("content"));
				r.setcId(rs.getString("c_id"));
				r.setCmmNo(rs.getInt("cmm_no"));
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}


	public Report selectReportOne(Connection conn, int repNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Report r=null;
		String sql=prop.getProperty("selectReportOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r=new Report();
				r.setRepNo(rs.getInt("rep_no"));
				r.setCategory(rs.getString("category"));
				r.setContent(rs.getString("content"));
				r.setcId(rs.getString("c_id"));
				r.setCmmNo(rs.getInt("cmm_no"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r;
	}


	public int deleteReport(Connection conn, int repNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteReport");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

}
