package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class RoomFacilitiesDao {
	
	// 객실추가시 부대시설 추가
	public int addFacilities(Connection conn, int currval, String[] facCheck) {
		Statement stmt = null;
		int result = 0;
		String sql = "insert into room_fac values('r'||"+currval;

		for (int i = 0; i < facCheck.length; i++) {
			facCheck[i] = "'" + facCheck[i] + "'";
			sql += "," + facCheck[i];
		}
		sql += ")";
		System.out.println(sql);

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
