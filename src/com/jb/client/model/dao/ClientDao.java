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
import static common.template.JDBCTemplate.close;

import com.jb.client.model.vo.Client;

public class ClientDao {

	private Properties prop = new Properties();

	public ClientDao() {
		String path=ClientDao.class.getResource("/sql/client/client-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Client selectId(Connection conn, String id, String pw) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectId");
		Client c = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				c = new Client();
				c.setcId(rs.getString("c_Id"));
//				c.setcPw(rs.getString("cPw"));
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

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}

	public int deleteClient(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteClient");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
