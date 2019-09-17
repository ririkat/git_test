package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Properties;

public class PensionFacilitiesDao {

	//펜션등록시 부대시설 추가
	public int addFacilities(Connection conn, int currval, String[] facCheck) {
		Statement stmt = null;
		int result = 0;
		String sql = "insert into pen_fac values('p'||"+currval;
		
		for(int i=0; i<facCheck.length; i++) {
			facCheck[i] = "'"+facCheck[i]+"'";
			sql += ","+facCheck[i];
		}
		sql+=")";
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

}
