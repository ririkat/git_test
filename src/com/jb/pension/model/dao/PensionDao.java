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
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return p;
		
	}
	
	//전체 승인된 펜션 수
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
	
	//페이징 - 승인된 펜션
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
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
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
	
	//전체 미승인 펜션 수
	public int selectCountWait(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountWait");
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
	
	//페이징 - 승인 대기중인 펜션
	public List<Pension> waitListPage(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("waitListPage");
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
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
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
	//펜션검색 - 승인
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
	
	//페이징 - 승인된펜션
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
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
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
	
	// 펜션검색 - 미승인
	public int selectCountPension2(Connection conn, String type, String keyword) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from pension where enrollyn='N' and " + type + " like '%" + keyword + "%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	// 페이징 - 미승인된펜션
	public List<Pension> selectPensionList2(Connection conn, String type, String keyword, int cPage, int numPerPage) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Pension> list = new ArrayList();
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		String sql = "select * from (" + "select rownum as rnum, a.* from("
				+ "select * from pension where enrollyn='N' and " + type + " like '%" + keyword + "%' )a) "
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
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	
	//관리자 승인대기->펜션상세->반려 (펜션 한개 삭제)
	public int deleteOnePension(Connection conn, String pCode, String oId) {
		Statement stmt = null;
		int result = 0;		
		String sql = "delete from pension where p_code='"+pCode+"' and o_id='"+oId+"'";

		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	
	//관리자 펜션관리 선택승인 (승인대기목록)
	public int acceptPensionList(Connection conn, String accList) {
		Statement stmt = null;
		int result = 0;		
		String sql = "update pension set enrollyn='Y', p_enrolldate=sysdate where p_code in (";

		String[] accDelList = accList.split(",");
		for (int i = 0; i < accDelList.length; i++) {
			accDelList[i] = "'" + accDelList[i] + "'";
		}
		if (accDelList.length < 2) {
			sql += accDelList[0] + ")";
		} else {
			sql += accDelList[0];
			for (int i = 1; i < accDelList.length; i++) {
				sql += "," + accDelList[i];
			}
			sql += ")";
		}

		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	
	//관리자 승인대기->펜션상세->승인 (펜션 한개 승인)
	public int acceptOnePension(Connection conn, String pCode, String oId) {
		Statement stmt = null;
		int result = 0;		
		String sql = "update pension set enrollyn='Y', p_enrolldate=sysdate where p_code='"+pCode+"' and o_id='"+oId+"'";

		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	
	//업주 미승인 펜션 수
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

	//페이징 - 업주 미승인 펜션
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
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
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
	public int addPension(Connection conn, String pName, String addr, String tel, String oId,double loc_y,double loc_x) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("addPension");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pName);
			pstmt.setString(2, addr);
			pstmt.setString(3, tel);
			pstmt.setString(4, oId);
			pstmt.setDouble(5, loc_y);
			pstmt.setDouble(6, loc_x);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}

	public int getCurrval(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select seq_pension_no.currval from dual";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return result;
	}
	
	//업주의 승인된 펜션리스트
	public List<Pension> selectAccList(Connection conn, String oId) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Pension> list = new ArrayList();
		String sql = "select * from pension where o_id='"+oId+"' and enrollyn='Y'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Pension p = new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollYn"));
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrollDate"));
				list.add(p);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return list;
	}
	
	//펜션코드로 펜션이름 가져오기
	public String getPensionName(Connection conn, String pCode) {
		Statement stmt = null;
		ResultSet rs = null;
		String pName = "";
		String sql = "select * from pension where p_code='"+pCode+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				pName = rs.getString(2);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return pName;
	}
	
	//펜션 수정
	public int modifyPension(Connection conn, String pCode, String tel) {
		Statement stmt = null;
		int result = 0;
		String sql = "update pension set p_tel='"+tel+"' where p_code='"+pCode+"'";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
}
