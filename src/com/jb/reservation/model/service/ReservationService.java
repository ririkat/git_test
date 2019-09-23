package com.jb.reservation.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.notice.model.vo.Notice;
import com.jb.pension.model.vo.Pension;
import com.jb.reservation.model.dao.ReservationDao;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

public class ReservationService {
	
	private ReservationDao dao = new ReservationDao();
	
	public int selectReservationCount(String cId) {
		Connection conn = getConnection();
		int result = dao.selectReservationCount(conn,cId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Reservation> loadReservationList(String cId){
		Connection conn = getConnection();
		List<Reservation> list=dao.loadReservationList(conn,cId);
		
		System.out.println("service에서 list: "+list);
		close(conn);
		return list;
	}
	
	public Reservation selectOneReservation(String cId,String resCode) {
		Connection conn = getConnection();
		
		Reservation r = dao.selectOneReservation(conn, cId,resCode);
		System.out.println(r);
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
	

		public int changeResState(Reservation res) {
	
		Connection conn = getConnection();
		System.out.println("서비스  dao전 res : "+res);
		int result = dao.changeResState(conn, res);
		System.out.println("service에서 r : "+ result);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	//예약데이터 인설트
	public int insertReservation(Reservation res) {
		Connection conn = getConnection();
		int result = dao.insertReservation(conn,res);
		if(result>0) {
			commit(conn);
			result = dao.selecSeq(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	
	public int cancleRes(String resCode) {
		
		Connection conn = getConnection();
		int result = dao.cancleRes(conn, resCode);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}
	
	
	

	}
	

