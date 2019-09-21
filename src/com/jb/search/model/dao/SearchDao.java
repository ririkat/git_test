package com.jb.search.model.dao;

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

import com.jb.notice.model.dao.NoticeDao;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.PensionFacilities;
import com.jb.pension.model.vo.PensionFile;
import com.jb.pension.model.vo.Room;
import com.jb.pension.model.vo.RoomFacilities;

public class SearchDao {
	
	private Properties prop = new Properties();

	public SearchDao() {
		String path = NoticeDao.class.getResource("/sql/search/search-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Pension> loadPenList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Pension> list = new ArrayList<Pension>();
		String sql=prop.getProperty("loadPenList");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Pension p=new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollyn"));
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrolldate"));
				
				p.setPenFac(new PensionFacilities(rs.getString("p_code"),rs.getString("store"),rs.getString("wifi")
						,rs.getString("pet"),rs.getString("pool"),rs.getString("s_Pool")
						,rs.getString("slide"),rs.getString("open_Bath"),rs.getString("grill")
						,rs.getString("smoked"),rs.getString("cafe"),rs.getString("sing")
						,rs.getString("foot"),rs.getString("hand"),rs.getString("car")));
				
				
				p.setPenFile(new SearchDao().loadPenFile(conn,rs.getString("p_code")));
				p.setRoomList(new SearchDao().loadRoom(conn, rs.getString("p_code")));
				
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<PensionFile> loadPenFile(Connection conn, String pCode) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PensionFile> list = new ArrayList<PensionFile>();
		String sql=prop.getProperty("loadPenFile");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PensionFile pf=new PensionFile();
				pf.setpFileNo(rs.getInt("p_file_no"));
				pf.setpCode(rs.getString("p_code"));
				pf.setpOriginalFile(rs.getString("p_original_file"));
				pf.setpRenameFile(rs.getString("p_rename_file"));
				list.add(pf);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Room> loadRoom(Connection conn, String pCode){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Room> list = new ArrayList<Room>();
		String sql=prop.getProperty("loadRoom");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Room r=new Room();
				r.setrNo(rs.getString("r_no"));
				r.setrName(rs.getString("r_name"));
				r.setrPrice(rs.getInt("r_price"));
				r.setrNop(rs.getInt("r_nop"));
				r.setrMaxNop(rs.getInt("r_maxnop"));
				r.setrSize(rs.getString("r_size"));
				r.setpCode(rs.getString("p_code"));
				r.setrStruc(rs.getString("r_struc"));
				r.setrInfo(rs.getString("r_info"));
				r.setrAddPrice(rs.getInt("r_addprice"));
				

				r.setRoomFac(new RoomFacilities(rs.getString("r_no"),rs.getString("bed"),rs.getString("dress_Table"),rs.getString("rtable")
						,rs.getString("sofa"),rs.getString("dress_Case"),rs.getString("bath"),rs.getString("spa")
						,rs.getString("wash_Kit"),rs.getString("tv"),rs.getString("beam"),rs.getString("aircon")
						,rs.getString("fridge"),rs.getString("cook_Fac"),rs.getString("cook_Uten"),rs.getString("rice")
						,rs.getString("microwave"),rs.getString("r_Smoked"),rs.getString("child"),rs.getString("o_View"),rs.getString("i_Pool")));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Room> loadRoom(Connection conn, String pCode,String[] rFac){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Room> list = new ArrayList<Room>();
		String sql=prop.getProperty("loadRoom");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Room r=new Room();
				r.setrNo(rs.getString("r_no"));
				r.setrName(rs.getString("r_name"));
				r.setrPrice(rs.getInt("r_price"));
				r.setrNop(rs.getInt("r_nop"));
				r.setrMaxNop(rs.getInt("r_maxnop"));
				r.setrSize(rs.getString("r_size"));
				r.setpCode(rs.getString("p_code"));
				r.setrStruc(rs.getString("r_struc"));
				r.setrInfo(rs.getString("r_info"));
				r.setrAddPrice(rs.getInt("r_addprice"));
				

				r.setRoomFac(new RoomFacilities(rs.getString("r_no"),rs.getString("bed"),rs.getString("dress_Table"),rs.getString("rtable")
						,rs.getString("sofa"),rs.getString("dress_Case"),rs.getString("bath"),rs.getString("spa")
						,rs.getString("wash_Kit"),rs.getString("tv"),rs.getString("beam"),rs.getString("aircon")
						,rs.getString("fridge"),rs.getString("cook_Fac"),rs.getString("cook_Uten"),rs.getString("rice")
						,rs.getString("microwave"),rs.getString("r_Smoked"),rs.getString("child"),rs.getString("o_View"),rs.getString("i_Pool")));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	public List<Pension> findPension(Connection conn, String keyword,String area,String[] pFac, String[] rFac) {
		Statement stmt=null;
		ResultSet rs=null;
		List<Pension> list = new ArrayList<Pension>();
		String sql="select * from pension p join pen_fac pf on p.p_code=pf.p_code "
		+"where p_name like '%"+keyword+"%' and replace(p_addr,' ','') like '%"+area+"%' and enrollyn='Y' ";
		for(int i=0; i<pFac.length; i++) {
			sql+="and "+pFac[i]+"='Y' ";
		}
		System.out.println(sql);
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Pension p=new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollyn"));
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrolldate"));
				
				p.setPenFac(new PensionFacilities(rs.getString("p_code"),rs.getString("store"),rs.getString("wifi")
						,rs.getString("pet"),rs.getString("pool"),rs.getString("s_Pool")
						,rs.getString("slide"),rs.getString("open_Bath"),rs.getString("grill")
						,rs.getString("smoked"),rs.getString("cafe"),rs.getString("sing")
						,rs.getString("foot"),rs.getString("hand"),rs.getString("car")));
				
				
				p.setPenFile(new SearchDao().loadPenFile(conn,rs.getString("p_code")));
				p.setRoomList(new SearchDao().loadRoom(conn, rs.getString("p_code"),rFac));
				
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public Pension selectDetail(Connection conn, String pCode) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Pension p = null;
		String sql=prop.getProperty("selectDetail");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				p=new Pension();
				p.setpCode(rs.getString("p_code"));
				p.setpName(rs.getString("p_name"));
				p.setpAddr(rs.getString("p_addr"));
				p.setpTel(rs.getString("p_tel"));
				p.setoId(rs.getString("o_id"));
				p.setEnrollYn(rs.getString("enrollyn"));
				p.setpBlcount(rs.getInt("p_blcount"));
				p.setpEnrollDate(rs.getDate("p_enrolldate"));
				
				p.setPenFac(new PensionFacilities(rs.getString("p_code"),rs.getString("store"),rs.getString("wifi")
						,rs.getString("pet"),rs.getString("pool"),rs.getString("s_Pool")
						,rs.getString("slide"),rs.getString("open_Bath"),rs.getString("grill")
						,rs.getString("smoked"),rs.getString("cafe"),rs.getString("sing")
						,rs.getString("foot"),rs.getString("hand"),rs.getString("car")));
				
				
				p.setPenFile(new SearchDao().loadPenFile(conn,rs.getString("p_code")));
				p.setRoomList(new SearchDao().loadRoom(conn, rs.getString("p_code")));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	
}
