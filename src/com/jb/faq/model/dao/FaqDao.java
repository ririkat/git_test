package com.jb.faq.model.dao;

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

import com.jb.faq.model.vo.Faq;
import com.jb.faq.model.vo.FaqComment;
import com.jb.notice.model.vo.Notice;
import com.jb.notice.model.vo.NoticeComment;

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
				f.setfTitle(rs.getString("f_title"));
				f.setfWriter(rs.getString("f_writer"));
				f.setfContent(rs.getString("f_content"));
				f.setfOriginFilename(rs.getString("f_origin_filename"));
				f.setfRenamedFilename(rs.getString("f_renamed_filename"));
				f.setfEntDate(rs.getDate("f_ent_date"));
				f.setfModDate(rs.getDate("f_mod_date"));
				f.setfReadCount(rs.getInt("f_readcount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return f;
	}
	
	public int updateCount(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateFaqCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public List<FaqComment> selectFaqComment(Connection conn, int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<FaqComment> list=new ArrayList();
		String sql=prop.getProperty("selectFaqComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FaqComment fc=new FaqComment();
				fc.setfCommentNo(rs.getInt("f_comment_no"));
				fc.setfCommentLevel(rs.getInt("f_comment_level"));
				fc.setfCommentWriter(rs.getString("f_comment_writer"));
				fc.setfCommentContent(rs.getString("f_comment_content"));
				fc.setfRef(rs.getInt("f_ref"));
				fc.setfCommentRef(rs.getInt("f_comment_ref"));
				fc.setfCommentDate(rs.getDate("f_comment_date"));
				list.add(fc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//게시글 수정
	public int updateFaq(Connection conn, Faq f) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql=prop.getProperty("updateFaq");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, f.getfTitle());
			pstmt.setString(2, f.getfContent());
			pstmt.setString(3, f.getfOriginFilename());
			pstmt.setString(4, f.getfRenamedFilename());
			pstmt.setInt(5, f.getfNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//게시글 1개 삭제
	public int deleteFaqOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql=prop.getProperty("deleteFaqOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//게시글 검색
	public List<Faq> selectFaqFinder(Connection conn,int cPage,int numPerPage, String keyword) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Faq> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from("
				+"select rownum as rnum, a.* from("
				+"select * from faq where f_title"
				+" like '%"+keyword+"%' order by f_ent_date desc)a) "
				+"where rnum between "+start+" and "+end;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Faq f = new Faq();
				f.setfNo(rs.getInt("f_no"));
				f.setfTitle(rs.getString("f_title"));
				f.setfEntDate(rs.getDate("f_ent_date"));
				f.setfModDate(rs.getDate("f_mod_date"));
				f.setfContent(rs.getString("f_content"));
				f.setfOriginFilename(rs.getString("f_origin_file"));
				f.setfRenamedFilename(rs.getString("f_renamed_file"));
				f.setfWriter(rs.getString("f_writer"));
				f.setfReadCount(rs.getInt("f_readcount"));
				list.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return list;
	}
	//댓글 등록
	public int insertFaqComment(Connection conn, FaqComment fc) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql= prop.getProperty("insertFaqComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, fc.getfCommentLevel());
			pstmt.setString(2, fc.getfCommentWriter());
			pstmt.setString(3, fc.getfCommentContent());
			pstmt.setInt(4, fc.getfRef());
			pstmt.setString(5, fc.getfCommentRef()==0?null:String.valueOf(fc.getfCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
