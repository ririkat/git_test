package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jb.pension.model.vo.Room;
import com.jb.pension.model.vo.RoomFacilities;
import com.jb.pension.model.vo.RoomFile;

public class RoomDao {
   
   private Properties prop = new Properties();
   
   public RoomDao() {
      String path = RoomDao.class.getResource("/sql/member/room-query.properties").getPath();
      try {
         prop.load(new FileReader(path));
      } catch(IOException e) {
         e.printStackTrace();
      }
   }
   
	
	//객실 한개 정보 받아오기
	public Room selectRoom(Connection conn, String rNo) {
		Statement stmt = null;
		ResultSet rs = null;
		Room r = new Room();
		String sql = "select * from room where r_no='"+rNo+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				r.setpCode(rs.getString("p_code"));
				r.setrNo(rs.getString("r_no"));
				r.setrName(rs.getString("r_name"));
				r.setrPrice(rs.getInt("r_price"));
				r.setrAddPrice(rs.getInt("r_addPrice"));
				r.setrNop(rs.getInt("r_nop"));
				r.setrMaxNop(rs.getInt("r_maxnop"));
				r.setrSize(rs.getString("r_size"));
				r.setrStruc(rs.getString("r_struc"));
				r.setrInfo(rs.getString("r_info"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return r;
	}
   
   //선택된 펜션의 전체 객실 수
   public int selectCountRoom(Connection conn, String pCode) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int result = 0;
      String sql = prop.getProperty("selectCountRoom");
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, pCode);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            result = rs.getInt(1);
         }
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }
   
   public List<Room> selectListPage(Connection conn, int cPage, int numPerPage, String pCode){
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectListPage");
      List<Room> list = new ArrayList();
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, pCode);
         pstmt.setInt(2, (cPage-1)*numPerPage+1);
         pstmt.setInt(3, cPage*numPerPage);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            Room r = new Room();
            r.setpCode(rs.getString("p_code"));
            r.setrNo(rs.getString("r_no"));
            r.setrName(rs.getString("r_name"));
            r.setrPrice(rs.getInt("r_price"));
            r.setrAddPrice(rs.getInt("r_addPrice"));
            r.setrNop(rs.getInt("r_nop"));
            r.setrMaxNop(rs.getInt("r_maxnop"));
            r.setrSize(rs.getString("r_size"));
            r.setrStruc(rs.getString("r_struc"));
            r.setrInfo(rs.getString("r_info"));
            list.add(r);
         }
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }
   
   //업주->승인된펜션->디테일->선택된펜션의 객실들 불러오기
   public List<Room> selectRoomList(Connection conn, String pCode){
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectRoomList");
      List<Room> list = new ArrayList();
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, pCode);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            Room r = new Room();
            r.setpCode(rs.getString("p_code"));
            r.setrNo(rs.getString("r_no"));
            r.setrName(rs.getString("r_name"));
            r.setrPrice(rs.getInt("r_price"));
            r.setrAddPrice(rs.getInt("r_addPrice"));
            r.setrNop(rs.getInt("r_nop"));
            r.setrMaxNop(rs.getInt("r_maxnop"));
            r.setrSize(rs.getString("r_size"));
            r.setrStruc(rs.getString("r_struc"));
            r.setrInfo(rs.getString("r_info"));
            list.add(r);
         }
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }
   
   
   
   //객실추가
   public int addRoom(Connection conn, String pCode, String rName,
         int rNop, int rMaxNop, int rPrice, int rAddPrice,
         String rSize, String rStruc, String rInfo) {
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = prop.getProperty("addRoom");
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, rName);
         pstmt.setInt(2, rPrice);
         pstmt.setInt(3, rNop);
         pstmt.setInt(4, rMaxNop);
         pstmt.setString(5, rSize);
         pstmt.setString(6, pCode);
         pstmt.setString(7, rStruc);
         pstmt.setString(8, rInfo);
         pstmt.setInt(9, rAddPrice);
         result = pstmt.executeUpdate();
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      } return result;
   }
   
   public int getCurrval(Connection conn) {
      Statement stmt = null;
      ResultSet rs = null;
      int result = 0;
      String sql = "select seq_room_no.currval from dual";
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         if(rs.next()) {
            result = rs.getInt(1);
         }
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(stmt);
      } return result;
   }
   
   //룸조회
   public Room roomInFo(Connection conn, String rno) {
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   String sql = prop.getProperty("roomSelect");
	   Room r = null;
	   try {
		   pstmt=conn.prepareStatement(sql);
		   pstmt.setString(1, rno);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   r = new Room();
			   r.setpCode(rs.getString("p_code"));
	            r.setrNo(rs.getString("r_no"));
	            r.setrName(rs.getString("r_name"));
	            r.setrPrice(rs.getInt("r_price"));
	            r.setrAddPrice(rs.getInt("r_addPrice"));
	            r.setrNop(rs.getInt("r_nop"));
	            r.setrMaxNop(rs.getInt("r_maxnop"));
	            r.setrSize(rs.getString("r_size"));
	            r.setrStruc(rs.getString("r_struc"));
	            r.setrInfo(rs.getString("r_info"));
	            
	            r.setRoomFac(new RoomFacilities(rs.getString("r_no"),rs.getString("bed"),rs.getString("dress_Table"),rs.getString("rtable")
						,rs.getString("sofa"),rs.getString("dress_Case"),rs.getString("bath"),rs.getString("spa")
						,rs.getString("wash_Kit"),rs.getString("tv"),rs.getString("beam"),rs.getString("aircon")
						,rs.getString("fridge"),rs.getString("cook_Fac"),rs.getString("cook_Uten"),rs.getString("rice")
						,rs.getString("microwave"),rs.getString("r_Smoked"),rs.getString("child"),rs.getString("o_View"),rs.getString("i_Pool")));
				
	            r.setRfList(new RoomDao().selectRoomFileList(conn,rno));
		   }
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }finally {
		   close(rs);
		   close(pstmt);
	   }
	   return r;
   }


   public List<RoomFile> selectRoomFileList(Connection conn, String rno) {
	   PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = prop.getProperty("selectRoomFileList");
	      List<RoomFile> list = new ArrayList();
	      try {
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1, rno);
			   rs = pstmt.executeQuery();
			   while(rs.next()) {
				   RoomFile rf = new RoomFile();
				   rf.setrFileNo(rs.getInt("r_file_no"));
				   rf.setrOriginalFile(rs.getString("r_Original_File"));
				   rf.setrRenameFile(rs.getString("r_Rename_File"));
				   rf.setrNo(rs.getString("r_file_no"));
		           list.add(rf);
			   }
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(rs);
			   close(pstmt);
		   }
		   return list;
   }
   
}


