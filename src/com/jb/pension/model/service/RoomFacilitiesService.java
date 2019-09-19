package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.pension.model.dao.RoomFacilitiesDao;
import com.jb.pension.model.vo.RoomFacilities;

public class RoomFacilitiesService {
	
	private RoomFacilitiesDao dao = new RoomFacilitiesDao();

	// 객실추가시 부대시설 추가
	public int addFacilities(int currval, String[] facCheck) {
		Connection conn = getConnection();
		int result = dao.addFacilities(conn, currval, facCheck);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//부대시설 전부 불러오기
	public List<RoomFacilities> selectRoomFac(){
		Connection conn = getConnection();
		List<RoomFacilities> list = dao.selectRoomFac(conn);
		close(conn);
		return list;
	}
		
}
