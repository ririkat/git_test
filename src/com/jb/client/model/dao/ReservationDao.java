package com.jb.client.model.dao;

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

import com.jb.client.model.vo.Reservation;
import com.jb.notice.model.dao.NoticeDao;
import com.jb.notice.model.vo.Notice;

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

}
