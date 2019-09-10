package com.jb.faq.model.dao;

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

import com.jb.faq.model.vo.Faq;
import com.jb.notice.model.vo.Notice;

public class FaqDao {
	private Properties prop = new Properties();

	public FaqDao() {
		String path = FaqDao.class.getResource("/sql/board/faq-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectFaqCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectFaqCount");
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
	
	public List<Faq> selectFaqList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> list=new ArrayList<Faq>();
		String sql=prop.getProperty("selectFaqList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Faq f = new Faq();
				f.setfNo(rs.getInt("f_no"));
				f.setfTitle(rs.getString("f_title"));
				f.setfWriter(rs.getString("f_writer"));
				f.setfContent(rs.getString("f_content"));
				f.setfEntDate(rs.getDate("f_ent_date"));
				f.setfModDate(rs.getDate("f_mod_date"));
				f.setfOriginFilename(rs.getString("f_origin_filename"));
				f.setfRenamedFilename(rs.getString("f_renamed_filename"));
				f.setfReadCount(rs.getInt("f_readcount"));
				list.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int insertFaq(Connection conn, Faq f) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql =prop.getProperty("insertFaq");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, f.getfTitle());
			pstmt.setString(2, f.getfWriter());
			pstmt.setString(3,f.getfContent());
			pstmt.setString(4, f.getfOriginFilename());
			pstmt.setString(5, f.getfRenamedFilename());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Faq selectFaqOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Faq f=null;
		String sql=prop.getProperty("selectFaqOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				f = new Faq();
				f.setfNo(rs.getInt("f_no"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return f;
	}
}
