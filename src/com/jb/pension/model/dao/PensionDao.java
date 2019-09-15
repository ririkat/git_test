package com.jb.pension.model.dao;

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

import com.jb.pension.model.vo.Pension;

public class PensionDao {
	
	private Properties prop = new Properties();
	
	public PensionDao() {
		String path = PensionDao.class.getResource("/sql/member/pension-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//pCode로 받아온 한개의 펜션 정보
	public Pension selectPension(Connection conn, String pCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Pension p = null;
		String sql = prop.getProperty("selectPension");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p = new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollYn"));
				p.setEnrollDate(rs.getDate("enrollDate"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return p;
		
	}
	
	//전체 펜션 수
	public int selectCountPension(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountPension");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Pension> selectListPage(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<Pension> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Pension p = new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollYn"));
				p.setEnrollDate(rs.getDate("enrollDate"));
				list.add(p);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	//오버로딩
	//펜션검색
	public int selectCountPension(Connection conn, String type, String keyword) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from pension where enrollyn='Y' and "+type+" like '%"+keyword+"%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(stmt);
		}
		return result;
	}
	
	public List<Pension> selectPensionList(Connection conn, String type, String keyword, int cPage, int numPerPage){
		Statement stmt = null;
		ResultSet rs = null;
		List<Pension> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from ("
				+ "select rownum as rnum, a.* from("
				+ "select * from pension where enrollyn='Y' and "
				+ type + " like '%" + keyword + "%' )a) "
				+ "where rnum between " + start + " and " + end;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Pension p = new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollYn"));
				p.setEnrollDate(rs.getDate("enrollDate"));
				list.add(p);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	//관리자 펜션관리 선택삭제
	public int deletePensionList(Connection conn, String delList) {
		Statement stmt = null;
		int result = 0;
		String sql = "delete from pension where p_code in (";
		
		String[] arrDelList = delList.split(",");
		for(int i=0; i<arrDelList.length; i++) {
			arrDelList[i] = "'"+arrDelList[i]+"'";
		}
		if(arrDelList.length<2) {
			sql += arrDelList[0]+")";
		}
		else {
			sql += arrDelList[0];
			for(int i=1; i<arrDelList.length; i++) {
				sql += ","+arrDelList[i];
			}
			sql += ")";
		}
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	
	//승인대기중인 펜션 수
	public int selectWaitPension(Connection conn, String oId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectWaitPension");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return result;
	}

	public List<Pension> selectWaitList(Connection conn, int cPage, int numPerPage, String oId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Pension> list = new ArrayList();
		String sql = prop.getProperty("selectWaitList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Pension p = new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollYn"));
				p.setEnrollDate(rs.getDate("enrollDate"));
				list.add(p);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	//펜션 추가
	public int addPension(Connection conn, String pName, String addr, String tel, String oId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("addPension");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pName);
			pstmt.setString(2, addr);
			pstmt.setString(3, tel);
			pstmt.setString(4, oId);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
}
