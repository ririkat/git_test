package com.jb.owner.model.dao;

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

import com.jb.client.model.vo.Client;
import com.jb.owner.model.vo.Owner;

public class OwnerDao {
	
	private Properties prop = new Properties();
	
	public OwnerDao() {
		String path = OwnerDao.class.getResource("/sql/owner/owner-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//전체 업주회원 수
	public int selectCountOwner(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result=0;
		String sql = prop.getProperty("selectCountOwner");
		try {
			pstmt=conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Owner> selectListPage(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<Owner> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Owner o = new Owner();
				o.setoId(rs.getString("o_id"));
				o.setoName(rs.getString("o_name"));
				o.setoBirth(rs.getDate("o_birth"));
				o.setoGender(rs.getString("o_gender"));
				o.setoEmail(rs.getString("o_email"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddr(rs.getString("o_addr"));
				o.setoEd(rs.getDate("o_ed"));
				list.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//오버로딩
	//업주회원 검색
	public int selectCountOwner(Connection conn, String type, String keyword) {
		Statement stmt=null;
		ResultSet rs= null;
		int result =0;
		String sql = "select count(*) as cnt from owner where "+type+" like '%"+keyword+"%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(stmt);
		}
		return result;
	}
	
	
	public List<Owner> selectOwnerList(Connection conn, String type, String keyword, int cPage, int numPerPage){
		Statement stmt = null;
		ResultSet rs = null;
		List<Owner> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from ("
				+ "select rownum as rnum, a.* from("
				+ "select * from owner where "
				+ type + " like '%" + keyword + "%' )a) "
				+ "where rnum between " + start + " and " + end;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Owner o = new Owner();
				o.setoId(rs.getString("o_id"));
				o.setoName(rs.getString("o_name"));
				o.setoBirth(rs.getDate("o_birth"));
				o.setoGender(rs.getString("o_gender"));
				o.setoEmail(rs.getString("o_email"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddr(rs.getString("o_addr"));
				o.setoEd(rs.getDate("o_ed"));
				o.setoBLCount(rs.getInt("o_blcount"));
				
				list.add(o);
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
	
	
	
	
	public Owner selectOwnerOne(Connection conn, String oId) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Owner o = null;
		String sql = prop.getProperty("selectOwnerOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o= new Owner();
				o.setoId(rs.getString("o_id"));
				o.setoName(rs.getString("o_name"));
				o.setoBirth(rs.getDate("o_birth"));
				o.setoGender(rs.getString("o_gender"));
				o.setoEmail(rs.getString("o_email"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddr(rs.getString("o_addr"));
				o.setoEd(rs.getDate("o_ed"));
				o.setoBLCount(rs.getInt("o_blcount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return o;
	}
	
	public int deleteOwner(Connection conn , String id) {
		PreparedStatement pstmt= null;
		int result =0 ;
		String sql = prop.getProperty("deleteOwner");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	

	public int multiDeleteOwner(Connection conn, String[] idss) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql = prop.getProperty("deleteOwner");
		for(int i=0; i<idss.length; i++) {
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, idss[i]);
				result = pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
	
		}
		return result;
	}
	
	
	public Owner selectId(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =prop.getProperty("selectId");
		Owner o = null;
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				o = new Owner();
				o.setoId(rs.getString("o_id"));
//				o.setoPw(rs.getString("o_pw"));
				o.setoName(rs.getString("o_name"));
				o.setoBirth(rs.getDate("o_birth"));
				o.setoGender(rs.getString("o_gender"));
				o.setoEmail(rs.getString("o_email"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddr(rs.getString("o_addr"));
				o.setoEd(rs.getDate("o_ed"));
				o.setoEaYN(rs.getString("o_eayn"));
				o.setoBLCount(rs.getInt("o_blcount"));
				o.setAuthority(rs.getInt("authority"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return o;
	}
	
	//업체 회원가입
	public int insertOwner(Connection conn, Owner o) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertOwner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, o.getoId());
			pstmt.setString(2, o.getoPw());
			pstmt.setString(3, o.getoName());
			pstmt.setDate(4, o.getoBirth());
			pstmt.setString(5, o.getoGender());
			pstmt.setString(6, o.getoEmail());
			pstmt.setString(7, o.getoPhone());
			pstmt.setString(8, o.getoAddr());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//아이디 중복 확인
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
	
	//업체 아이디 찾기
	public Owner findId(Connection conn,String name,String email) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("findId");
		Owner o = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o = new Owner();
				o.setoId(rs.getString("o_id"));
				o.setoName(rs.getString("o_name"));
				o.setoEmail(rs.getString("o_email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return o;
	}

	public Owner findEmail(Connection conn, String uid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Owner o = null;
		String sql = prop.getProperty("findEmail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o = new Owner();
				o.setoId(rs.getString("o_id"));
				o.setoEmail(rs.getString("o_email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return o;
	}

	public int updatePassword(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePassword");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
