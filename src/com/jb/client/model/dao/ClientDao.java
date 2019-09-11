package com.jb.client.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import com.jb.client.model.vo.Client;

public class ClientDao {

	private Properties prop = new Properties();

	public ClientDao() {
		String path=ClientDao.class.getResource("/sql/member/client-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Client selectId(Connection conn, String id, String pw) {
		System.out.println("dao!!");
		System.out.println(id+pw);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectId");
		Client c = null;
		try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, pw);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            c = new Client();
	            c.setcId(rs.getString("c_Id"));
//	            c.setcPw(rs.getString("cPw"));
	            c.setcName(rs.getString("c_Name"));
	            c.setcBirth(rs.getDate("c_Birth"));
	            c.setcGender(rs.getString("c_Gender"));
	            c.setcEmail(rs.getString("c_Email"));
	            c.setcPhone(rs.getString("c_Phone"));
	            c.setcAddr(rs.getString("c_Addr"));
	            c.setcEd(rs.getDate("c_Ed"));
	            c.setcBLCount(rs.getInt("c_BLCount"));
	            c.setAuthority(rs.getInt("Authority"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	      }
	      return c;
	}
	
	public int updateClient(Connection conn, Client c){
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateClient");
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			//setString 작성 필요 
			
			pstmt.setString(1, c.getcName());
//			pstmt.setDate(2, new java.sql.Date(java.util.Date.getTime(c.getcBirth())));
			pstmt.setString(3, c.getcGender());
			pstmt.setString(4, c.getcEmail());
			pstmt.setString(5, c.getcPhone());
			pstmt.setString(6, c.getcAddr());
			pstmt.setString(7, c.getcId());
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//전체 일반회원 수
	
	public int selectCountClient(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountClient");
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
	
	public List<Client> selectListPage(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<Client> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Client c = new Client();
				c.setcId(rs.getString("c_id"));
				c.setcName(rs.getString("c_name"));
				c.setcBirth(rs.getDate("c_birth"));
				c.setcGender(rs.getString("c_gender"));
				c.setcEmail(rs.getString("c_email"));
				c.setcPhone(rs.getString("c_phone"));
				c.setcAddr(rs.getString("c_addr"));
				c.setcEd(rs.getDate("c_ed"));
				c.setcBLCount(rs.getInt("c_blcount"));
				c.setAuthority(rs.getInt("Authority"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	//오버로딩
	//일반회원 검색 (수)
	public int selectCountClient(Connection conn, String type, String keyword) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from client where "+type+" like '%"+keyword+"%'";
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
	
	//블랙리스트 검색 (수)
	public int selectCountForBlack(Connection conn, String type, String keyword) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "";
		
		//3이상. 블랙리스트
		if(keyword.equals("overThree")) {
			sql = "select count(*) as cnt from client where "+type+" >=3";			
		}
		else if(keyword.equals("underThree")) {
			sql = "select count(*) as cnt from client where "+type+" <3";	
		}
		
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
	
	//일반회원 검색 (리스트)
	public List<Client> selectClientList(Connection conn, String type, String keyword, int cPage, int numPerPage){
		Statement stmt = null;
		ResultSet rs = null;
		List<Client> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from ("
				+ "select rownum as rnum, a.* from("
				+ "select * from client where "
				+ type + " like '%" + keyword + "%' )a) "
				+ "where rnum between " + start + " and " + end;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Client c = new Client();
				c.setcId(rs.getString("c_id"));
				c.setcName(rs.getString("c_name"));
				c.setcBirth(rs.getDate("c_birth"));
				c.setcGender(rs.getString("c_gender"));
				c.setcEmail(rs.getString("c_email"));
				c.setcPhone(rs.getString("c_phone"));
				c.setcAddr(rs.getString("c_addr"));
				c.setcEd(rs.getDate("c_ed"));
				c.setcBLCount(rs.getInt("c_blcount"));
				c.setAuthority(rs.getInt("Authority"));
				
				list.add(c);
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
	
	//블랙리스트 검색 (리스트)
	public List<Client> selectBlackList(Connection conn, String type, String keyword, int cPage, int numPerPage) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Client> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "";
		
		//3이상. 블랙리스트
		if(keyword.equals("overThree")) {
			sql = "select * from ("
					+ "select rownum as rnum, a.* from("
					+ "select * from client where "
					+ type + "  >=3)a) "
					+ "where rnum between " + start + " and " + end;	
		}
		else if(keyword.equals("underThree")) {
			sql = "select * from ("
					+ "select rownum as rnum, a.* from("
					+ "select * from client where "
					+ type + "  <3)a) "
					+ "where rnum between " + start + " and " + end;
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Client c = new Client();
				c.setcId(rs.getString("c_id"));
				c.setcName(rs.getString("c_name"));
				c.setcBirth(rs.getDate("c_birth"));
				c.setcGender(rs.getString("c_gender"));
				c.setcEmail(rs.getString("c_email"));
				c.setcPhone(rs.getString("c_phone"));
				c.setcAddr(rs.getString("c_addr"));
				c.setcEd(rs.getDate("c_ed"));
				c.setcBLCount(rs.getInt("c_blcount"));
				c.setAuthority(rs.getInt("Authority"));
				
				list.add(c);
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
	

	public int deleteClient(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteClient");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//회원가입
	public int insertClient(Connection conn, Client c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertClient");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getcId());
			pstmt.setString(2, c.getcPw());
			pstmt.setString(3, c.getcName());
			pstmt.setDate(4, c.getcBirth());
			pstmt.setString(5, c.getcGender());
			pstmt.setString(6, c.getcEmail());
			pstmt.setString(7, c.getcPhone());
			pstmt.setString(8, c.getcAddr());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//아이디 중복체크
	public boolean selectCheckId(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String sql = prop.getProperty("selectCheckId");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	//관리자 회원 삭제
	public int deleteClientList(Connection conn, String delList) {
		Statement stmt = null;
		int result = 0;
		String sql = "delete from client where c_id in (";
		
		String[] arrDelList = delList.split(",");
		for(int i=0; i<arrDelList.length; i++) {
			arrDelList[i] = "'"+arrDelList[i]+"'";
			System.out.println(arrDelList[i]);
		}
		
		if(arrDelList.length<2) {
			sql += arrDelList[0] + ")";
		}
		else {
			sql += arrDelList[0];
			for(int i=1; i<arrDelList.length; i++) {
				sql += ","+arrDelList[i];
			}
			sql += ")";
		}
		
		System.out.println(sql);
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
  
	public int updatePassword(Connection conn, String cId, String cPw) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updatePassWord");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cPw);
			pstmt.setString(2, cId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	//아이디 찾기
	public Client findId(Connection conn, String name, String email) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("findId");
		Client c = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				c = new Client();
				c.setcId(rs.getString("c_Id"));
				c.setcName(rs.getString("c_Name"));
				c.setcEmail(rs.getString("c_Email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
		
		public Client selectClient(Connection conn, String cId) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Client c=null;
			String sql=prop.getProperty("selectCheckId");
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, cId);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					c = new Client();
					c.setcId(rs.getString("c_id"));
					c.setcName(rs.getString("c_name"));
					c.setcBirth(rs.getDate("c_birth"));
					c.setcGender(rs.getString("c_gender"));
					c.setcEmail(rs.getString("c_email"));
					c.setcPhone(rs.getString("c_phone"));
					c.setcAddr(rs.getString("c_addr"));
					c.setcEd(rs.getDate("c_ed"));
					c.setcBLCount(rs.getInt("c_blcount"));
					
				
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				close(rs);
				close(pstmt);
			}
			return c;
		}
	
}
