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

import com.jb.notice.model.dao.NoticeDao;
import com.jb.notice.model.vo.Notice;
import com.jb.reservation.model.vo.Reservation;

public class ReservationDao {
	

	private Properties prop = new Properties();

	public ReservationDao() {
		String path = NoticeDao.class.getResource("/sql/member/reservation-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	

	public int selectReservationCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectReservationCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();			
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}


	public List<Reservation> selectReservationList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Reservation> list=new ArrayList<Reservation>();
		String sql=prop.getProperty("selectReservationList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reservation r = new Reservation();
				
				//r.setpCode(rs.getString("p_code")); 등 작성해야함 
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
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
