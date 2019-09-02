package com.jb.client.model.dao;

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

import com.jb.client.model.vo.Client;

public class ClientDao {
	
	private Properties prop=new Properties();
	
	public ClientDao() {
		String path=ClientDao.class.getResource("/sql/member/client-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int updateClient(Connection conn, Client c){
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("updateClient");
		try {
			pstmt=conn.prepareStatement(sql);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}return result;
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
	
	
	
}


	
