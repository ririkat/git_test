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

	public int selectReservationCount(Connection conn, String cId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectReservationCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
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
	


	
	public List<Reservation> loadReservationList(Connection conn, String cId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reservation> list = new ArrayList<Reservation>();
		String sql = prop.getProperty("loadReservationList");
		System.out.println("dao 1 : "+list);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			
			rs= pstmt.executeQuery();
			while (rs.next()) {
				Reservation r = new Reservation();

				r.setrNo(rs.getString("r_no"));
				r.setcId(rs.getString("c_id"));

//				r.getPension().setpName(rs.getString("p_name"));
//				r.getRoom().setrName(rs.getString("r_name"));
				
				r.setResCode(rs.getString("res_code"));
				r.setResCheckIn(rs.getDate("res_checkin"));
				r.setResCheckOut(rs.getDate("res_checkout"));
				r.setResState(rs.getString("res_state"));
				r.setResNop(rs.getInt("res_nop"));
				r.setTotalPrice(rs.getInt("total_price"));
			    r.setResState(rs.getString("res_state"));
			    
			
			    r.setRoom(new Room(rs.getString("r_no"),rs.getString("r_name")
			    		,rs.getInt("r_price"),rs.getInt("r_nop"),rs.getInt("r_maxnop")
			    		,rs.getString("r_size"),rs.getString("p_code"),rs.getString("r_struc")
			    		,rs.getString("r_info"),rs.getInt("r_addprice")));
			    
				r.setPension(new Pension(
						rs.getString("p_code"),
						rs.getString("p_name"),
						rs.getString("p_addr"),
						rs.getString("p_tel"),
						rs.getString("o_id"),
						rs.getString("enrollYn"),
						rs.getInt("p_blcount"),
						rs.getDate("p_enrollDate")));
				

				list.add(r);
				
				System.out.println("DAO에서 list :"+list);
				System.out.println(r.getRoom().getrName());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	
//	public Room loadReservatedRoom(Connection conn, String resCode) {
//		
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		Room r = null;
//		String sql=prop.getProperty("loadReservatedRoom");
//		try {
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, resCode);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				
//				r=new Room();
//				r.setrNo(rs.getString("r_no"));
//				r.setrName(rs.getString("r_name"));
//				r.setrPrice(rs.getInt("r_price"));
//				r.setrNop(rs.getInt("r_nop"));
//				r.setrMaxNop(rs.getInt("r_maxnop"));
//				r.setrSize(rs.getString("r_size"));
//				r.setpCode(rs.getString("p_code"));
//				r.setrStruc(rs.getString("r_struc"));
//				r.setrInfo(rs.getString("r_info"));
//				r.setrAddPrice(rs.getInt("r_addprice"));
//				
//				r.setPension(new Pension(
//				rs.getString("p_code"),
//				rs.getString("p_name"),
//				rs.getString("p_addr"),
//				rs.getString("p_tel"),
//				rs.getString("o_id"),
//				rs.getString("enrollYn"),
//				rs.getInt("p_blcount"),
//				rs.getDate("p_enrollDate")));
//				
//			}
//				
//				
//			}catch(SQLException e) {
//				e.printStackTrace();
//			}finally {
//				close(rs);
//				close(pstmt);
//			}return r;
//		}
//	

	
	
	

	
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
//			pstmt.setString(1, res.getResCode());
			pstmt.setDate(1, res.getResCheckIn());
			pstmt.setDate(2, res.getResCheckOut());
			pstmt.setString(3, res.getResState());
			pstmt.setInt(4, res.getResNop());
			pstmt.setInt(5, res.getTotalPrice());
			pstmt.setString(6, res.getrNo());
			pstmt.setString(7, res.getcId());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}

	
	
	//하나의 예약(예정) 가져오기 
	
	public Reservation selectOneReservation(Connection conn, String resCode, String cId) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reservation res = null;
		String sql = prop.getProperty("selectOneReservation");
		
	 try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, cId);
		pstmt.setString(2, resCode);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			res = new Reservation();
			res.setResCode(rs.getString("res_code"));
			res.setResCheckIn(rs.getDate("res_checkin"));
			res.setResCheckOut(rs.getDate("res_checkOut"));
			res.setResState(rs.getString("res_state"));	
			res.setResNop(rs.getInt("res_nop"));
			res.setTotalPrice(rs.getInt("total_price"));
			res.setcId(rs.getString("c_id"));
			res.setResDate(rs.getDate("res_date"));
			
			   res.setRoom(new Room(
					   rs.getString("r_no"),
					   rs.getString("r_name"),
			    		rs.getInt("r_price"),
			    		rs.getInt("r_nop"),
			    		rs.getInt("r_maxnop"),
			    		rs.getString("r_size"),
			    		rs.getString("p_code"),
			    		rs.getString("r_struc"),
			    		rs.getString("r_info"),
			    		rs.getInt("r_addprice")));
			    
				res.setPension(new Pension(
						rs.getString("p_code"),
						rs.getString("p_name"),
						rs.getString("p_addr"),
						rs.getString("p_tel"),
						rs.getString("o_id"),
						rs.getString("enrollYn"),
						rs.getInt("p_blcount"),
						rs.getDate("p_enrollDate")));
				
			
				res.setClient(new Client( rs.getString("c_id"), rs.getString("c_pw"),
				rs.getString("c_name"), rs.getDate("c_birth"), rs.getString("c_gender"),
				rs.getString("c_email"), rs.getString("c_phone"), rs.getString("c_addr"),
				rs.getDate("c_ed"), rs.getInt("c_blcount"), rs.getInt("authority")));
				 
						
						
	
				System.out.println(res);
			
			
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return res;
		
	}

	public int selecSeq(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selecSeq");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	   
	
}
		
		



