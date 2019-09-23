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
	
	//오버로딩 
	public List<Reservation> loadReservationList(){
		Connection conn = getConnection();
		List<Reservation> list=dao.loadReservationList(conn);
		
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
	
	//승인대기 예약자들 선택
	public int acceptResList(String accList) {
		Connection conn = getConnection();
		int result = dao.acceptResList(conn, accList);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	

	}
	

