package com.jb.reservation.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jb.client.model.vo.Client;
import com.jb.notice.model.dao.NoticeDao;
import com.jb.notice.model.vo.Notice;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

public class ReservationDao {

	private Properties prop = new Properties();

	public ReservationDao() {
		String path = ReservationDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectReservationCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectReservationCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<Reservation> selectReservationList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reservation> list = new ArrayList<Reservation>();
		String sql = prop.getProperty("selectReservationList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation r = new Reservation();

				// r.setpCode(rs.getString("p_code")); 등 작성해야함

				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	
	
	public Reservation selectReservatedRoom(Connection conn, String resCode) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reservation r = null;
		
		String sql = prop.getProperty("selectCheckRes");

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resCode);
		
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				//펜션명, 펜션주소, 객실명, 기준/최대 인원수, 체크인아웃날짜, 인원수, 추가인원수, 추가인원요금 , 요금합계 
				//이름, 생년월일 , 연락처, 이메일
				//hidden으로 처리한 것 : pCode, resCode, cId 
				
				r = new Reservation();
				
				//나중에 쓸 수도 있으니까 * 로 처리해서 값 다 가져오기 
				
				r.getPension().setpCode(rs.getString("p_code"));
				r.getPension().setpName(rs.getString("p_name"));
				r.getPension().setpAddr(rs.getString("p_addr"));
				
				r.getRoom().setrName(rs.getString("r_name"));
				r.getRoom().setrNop(rs.getInt("r_nop"));
				r.getRoom().setrMaxNop(rs.getInt("r_maxnop"));
//				r.getRoom().setrAddNop(rs.getInt("r_addnop"));
				r.getRoom().setrAddPrice(rs.getInt("r_addprice"));
				r.getRoom().setrPrice(rs.getInt("r_price"));
				
				r.setResCode(rs.getString("res_code"));
				r.setResCheckIn(rs.getDate("res_checkin"));
				r.setResCheckOut(rs.getDate("res_checkout"));
				r.setResNop(rs.getInt("res_nop"));
				r.setTotalPrice(rs.getInt("total_price"));
				
				r.getClient().setcName(rs.getString("c_name"));
				r.getClient().setcBirth(rs.getDate("c_birth"));
				r.getClient().setcPhone(rs.getString("c_phone"));
				r.getClient().setcEmail(rs.getString("c_email"));
				
			

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return r;
		
	}
	

	
	public int insertPayInfo(Connection conn, Payment pay) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertPayInfo");
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, pay.getPayCode());
			pstmt.setDate(2,pay.getPayDate());
			pstmt.setString(3, pay.getPayMethod());
			pstmt.setString(4, pay.getResCode());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePayInfo(Connection conn, Reservation res) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updatePayInfo");
		
		try {
			pstmt=conn.prepareStatement(sql);
		    
			//예약자 정보 바꾸면 update
			pstmt.setString(1, res.getClient().getcName());
			pstmt.setDate(2, res.getClient().getcBirth());
			pstmt.setString(3, res.getClient().getcPhone());
			pstmt.setString(4, res.getClient().getcEmail());
			
			//결제금액 setting
			
			pstmt.setInt(1, res.getRoom().getrPrice());
			pstmt.setInt(2, res.getRoom().getrAddPrice());
			pstmt.setInt(3, res.getTotalPrice());
		
			result=pstmt.executeUpdate();
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	//예약데이터 인설트
	public int insertReservation(Connection conn, Reservation res) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReservation");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, res.getResCode());
			pstmt.setString(2, res.getResState());
			pstmt.setInt(3, res.getResNop());
			pstmt.setInt(4, res.getTotalPrice());
			pstmt.setString(5, res.getrNo());
			pstmt.setString(6, res.getcId());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
}
		
		



