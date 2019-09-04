package com.jb.notice.model.dao;

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

import com.jb.notice.model.vo.Notice;

public class NoticeDao {
	
private Properties prop = new Properties();
	
	public NoticeDao() {
		String path = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectNoticeCount");
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
	
	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList<Notice>();
		String sql=prop.getProperty("selectNoticeList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n = new Notice();
				n.setnNo(rs.getInt("n_no"));
				n.setnTitle(rs.getString("n_title"));
				n.setnEntDate(rs.getDate("n_ent_date"));
				n.setnModDate(rs.getDate("n_mod_date"));
				n.setnContent(rs.getString("n_content"));
				n.setnOriginFile(rs.getString("n_origin_file"));
				n.setmId(rs.getString("m_id"));
				n.setnViewCnt(rs.getInt("n_view_cnt"));
				n.setnRenamedFile(rs.getString("n_renamed_file"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public Notice selectNoticeOne(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice n = null;
		String sql = prop.getProperty("selectNoticeOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n = new Notice();
				n.setnNo(rs.getInt("n_no"));
				n.setnTitle(rs.getString("n_title"));
				n.setnEntDate(rs.getDate("n_ent_date"));
				n.setnModDate(rs.getDate("n_mod_date"));
				n.setnContent(rs.getString("n_content"));
				n.setnOriginFile(rs.getString("n_origin_file"));
				n.setnRenamedFile(rs.getString("n_renamed_file"));
				n.setmId(rs.getString("m_id"));
				n.setnViewCnt(rs.getInt("n_view_cnt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}

	public int insertNotice(Connection conn, Notice n) {

		PreparedStatement pstmt = null;
		int result=0;
		String sql = prop.getProperty("insertNotice");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getmId());
			pstmt.setString(3, n.getnContent());
			pstmt.setString(4, n.getnOriginFile());
			pstmt.setString(5, n.getnRenamedFile());
			result =pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectSeqNotice(Connection conn) {
	      Statement stmt = null;
	      ResultSet rs = null;
	      int result = 0;
	      String sql = "select seq_notice_no.currval from dual";
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


}










