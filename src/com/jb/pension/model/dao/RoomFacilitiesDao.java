package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jb.pension.model.vo.RoomFacilities;

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
	
	//부대시설 전부 불러오기
	public List<RoomFacilities> selectRoomFac(Connection conn){
		Statement stmt = null;
		ResultSet rs = null;
		List<RoomFacilities> list = new ArrayList();
		String sql = "select * from room_fac";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				RoomFacilities rf = new RoomFacilities();
				rf.setrNo(rs.getString("r_no"));
				rf.setBed(rs.getString("bed"));
				rf.setDressTable(rs.getString("dress_table"));
				rf.setTable(rs.getString("table"));
				rf.setSofa(rs.getString("sofa"));
				rf.setDressCase(rs.getString("dress_case"));
				rf.setBath(rs.getString("bath"));
				rf.setSpa(rs.getString("spa"));
				rf.setWashKit(rs.getString("wash_kit"));
				rf.setTv(rs.getString("tv"));
				rf.setBeam(rs.getString("beam"));
				rf.setAircon(rs.getString("aircon"));
				rf.setFridge(rs.getString("fridge"));
				rf.setCookFac(rs.getString("cook_fac"));
				rf.setCookUten(rs.getString("cook_uten"));
				rf.setRice(rs.getString("rice"));
				rf.setMicrowave(rs.getString("microwave"));
				rf.setrSmoked(rs.getString("r_smoked"));
				rf.setChild(rs.getString("child"));
				rf.setoView(rs.getString("o_view"));
				rf.setiPool(rs.getString("i_pool"));
				list.add(rf);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return list;
	}
	
	//해당 객실의 부대시설만 불러오기
	public RoomFacilities curRoomFac(Connection conn, String rNo) {
		Statement stmt = null;
		ResultSet rs = null;
		RoomFacilities rf = new RoomFacilities();
		String sql = "select * from room_fac where r_no='"+rNo+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				rf.setrNo(rs.getString("r_no"));
				rf.setBed(rs.getString("bed"));
				rf.setDressTable(rs.getString("dress_table"));
				rf.setTable(rs.getString("table"));
				rf.setSofa(rs.getString("sofa"));
				rf.setDressCase(rs.getString("dress_case"));
				rf.setBath(rs.getString("bath"));
				rf.setSpa(rs.getString("spa"));
				rf.setWashKit(rs.getString("wash_kit"));
				rf.setTv(rs.getString("tv"));
				rf.setBeam(rs.getString("beam"));
				rf.setAircon(rs.getString("aircon"));
				rf.setFridge(rs.getString("fridge"));
				rf.setCookFac(rs.getString("cook_fac"));
				rf.setCookUten(rs.getString("cook_uten"));
				rf.setRice(rs.getString("rice"));
				rf.setMicrowave(rs.getString("microwave"));
				rf.setrSmoked(rs.getString("r_smoked"));
				rf.setChild(rs.getString("child"));
				rf.setoView(rs.getString("o_view"));
				rf.setiPool(rs.getString("i_pool"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return rf;
	}
}
