package com.jb.reservation.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;

import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.notice.model.vo.Notice;
import com.jb.reservation.model.dao.ReservationDao;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

public class ReservationService {
	
	private ReservationDao dao = new ReservationDao();
	
	public int selectReservationCount() {
		Connection conn = getConnection();
		int result=dao.selectReservationCount(conn);
		close(conn);
		return result;
	}
	
	public List<Reservation> selectReservationList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Reservation> list=dao.selectReservationList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public Reservation selectReservatedRoom(String resCode) {
		Connection conn = getConnection();
		Reservation r = dao.selectReservatedRoom(conn, resCode);
		close(conn);
		return r;
	}
	
	public int insertPayInfo(Payment pay) {
		
		Connection conn = getConnection();
		int result = dao.insertPayInfo(conn, pay);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}
	

	
	public int updatePayInfo(Reservation res) {
	
		Connection conn = getConnection();
		int result = dao.updatePayInfo(conn, res);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	
	

}
