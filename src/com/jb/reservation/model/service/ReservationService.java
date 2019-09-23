
package com.jb.reservation.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.jb.reservation.model.dao.ReservationDao;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

public class ReservationService {

	private ReservationDao dao = new ReservationDao();

	public int selectReservationCount(String cId) {
		Connection conn = getConnection();
		int result = dao.selectReservationCount(conn, cId);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Reservation> loadReservationList(String cId) {
		Connection conn = getConnection();
		List<Reservation> list = dao.loadReservationList(conn, cId);

		System.out.println("service에서 list: " + list);
		close(conn);
		return list;
	}

	// 오버로딩
	public List<Reservation> loadReservationList2() {
		Connection conn = getConnection();
		List<Reservation> list = dao.loadReservationList2(conn);

		System.out.println("service에서 list: " + list);
		close(conn);
		return list;
	}

	public Reservation selectOneReservation(String resCode,String cId ) {
		Connection conn = getConnection();

		Reservation r = dao.selectOneReservation(conn,resCode, cId);
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


	// 예약데이터 인설트
	public int insertReservation(Reservation res) {
		Connection conn = getConnection();
		int result = dao.insertReservation(conn, res);
		if (result > 0) {
			commit(conn);
			result = dao.selecSeq(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}



	public Reservation checkIncheck(Date CheckIn) {

		Connection conn = getConnection();
		Reservation res = dao.checkIncheck(conn, CheckIn);
		close(conn);
		return res;

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


	// 승인대기 예약자들 선택
	public int acceptResList(String accList) {
		Connection conn = getConnection();
		int result = dao.acceptResList(conn, accList);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 승인대기 예약자 삭제
	public int deleteResList(String delList) {
		Connection conn = getConnection();
		int result = dao.deleteResList(conn, delList);
		if(result>0) {
			commit(conn);
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


