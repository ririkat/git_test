package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.jb.pension.model.vo.PensionFacilities;

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
	
	//펜션 부대시설 불러오기
	public PensionFacilities selectPensionFac(Connection conn, String pCode) {
		Statement stmt = null;
		ResultSet rs = null;
		PensionFacilities pf = new PensionFacilities();
		String sql = "select * from pen_fac where p_code='"+pCode+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				pf.setpCode(rs.getString("p_code"));
				pf.setStore(rs.getString("store"));
				pf.setWifi(rs.getString("wifi"));
				pf.setPet(rs.getString("pet"));
				pf.setPool(rs.getString("pool"));
				pf.setsPool(rs.getString("s_pool"));
				pf.setSlide(rs.getString("slide"));
				pf.setOpenBath(rs.getString("open_bath"));
				pf.setGrill(rs.getString("grill"));
				pf.setSmoked(rs.getString("smoked"));
				pf.setCafe(rs.getString("cafe"));
				pf.setSing(rs.getString("sing"));
				pf.setFoot(rs.getString("foot"));
				pf.setHand(rs.getString("hand"));
				pf.setCar(rs.getString("car"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return pf;
	}

}
