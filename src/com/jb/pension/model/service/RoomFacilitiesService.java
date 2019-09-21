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
	
	// 객실수정시 부대시설 수정
	public int modifyFacilities(String rNo, String[] facCheck) {
		Connection conn = getConnection();
		int result = dao.modifyFacilities(conn,rNo,facCheck);
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
	
	//해당 객실의 부대시설만 불러오기
	public RoomFacilities curRoomFac(String rNo) {
		Connection conn = getConnection();
		RoomFacilities rFac = dao.curRoomFac(conn,rNo);
		close(conn);
		return rFac;
	}
	
	//객실번호로 부대시설 삭제
	public int deleteFac(String rNo) {
		Connection conn = getConnection();
		int result = dao.deleteFac(conn,rNo);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
