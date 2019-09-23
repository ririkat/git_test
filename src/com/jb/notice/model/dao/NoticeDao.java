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
import com.jb.notice.model.vo.NoticeComment;

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
	
	//게시글 전체 개수 가져오기
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

	//게시글 전체 정보 페이징해서 가져오기
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
				n.setnOriginFile(rs.getString("n_original_file"));
				n.setmId(rs.getString("m_id"));
				n.setnViewCnt(rs.getInt("n_view_cnt"));
				n.setnRenamedFile(rs.getString("n_rename_file"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	//선택 게시글 정보 가져오기(1개)
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
				n.setnOriginFile(rs.getString("n_original_file"));
				n.setnRenamedFile(rs.getString("n_rename_file"));
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
	
	//게시글 등록
	public int insertNotice(Connection conn, Notice n) {

		PreparedStatement pstmt = null;
		int result=0;
		String sql = prop.getProperty("insertNotice");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnOriginFile());
			pstmt.setString(5, n.getmId());
			pstmt.setString(4, n.getnRenamedFile());
			result =pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	//
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
	
	//게시글 수정
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql=prop.getProperty("updateNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnOriginFile());
			pstmt.setString(4, n.getnRenamedFile());
			pstmt.setInt(5, n.getnNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//게시글 1개 삭제
	public int deleteNoticeOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql=prop.getProperty("deleteNoticeOne");
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
	public List<Notice> selectNoticeFinder(Connection conn,int cPage,int numPerPage, String keyword) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from("
				+"select rownum as rnum, a.* from("
				+"select * from notice where n_title"
				+" like '%"+keyword+"%' order by n_ent_date desc)a) "
				+"where rnum between "+start+" and "+end;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Notice n = new Notice();
				n.setnNo(rs.getInt("n_no"));
				n.setnTitle(rs.getString("n_title"));
				n.setnEntDate(rs.getDate("n_ent_date"));
				n.setnModDate(rs.getDate("n_mod_date"));
				n.setnContent(rs.getString("n_content"));
				n.setnOriginFile(rs.getString("n_original_file"));
				n.setnRenamedFile(rs.getString("n_rename_file"));
				n.setmId(rs.getString("m_id"));
				n.setnViewCnt(rs.getInt("n_view_cnt"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return list;
	}
	//댓글 등록
	public int insertComment(Connection conn, NoticeComment nc) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql= prop.getProperty("insertComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nc.getnCommentLevel());
			pstmt.setString(2, nc.getnCommentWriter());
			pstmt.setString(3, nc.getnCommentContent());
			pstmt.setInt(4, nc.getnRef());
			pstmt.setString(5, nc.getnCommentRef()==0?null:String.valueOf(nc.getnCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	//댓글 전체 가져오기(댓글->답글 우선순위로)
	public List<NoticeComment> selectNoticeComment(Connection conn, int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NoticeComment> list = new ArrayList();
		String sql=prop.getProperty("selectNoticeComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeComment nc = new NoticeComment();
				nc.setnCommentNo(rs.getInt("n_comment_no"));
				nc.setnCommentLevel(rs.getInt("n_comment_level"));
				nc.setnCommentWriter(rs.getString("n_comment_writer"));
				nc.setnCommentContent(rs.getString("n_comment_content"));
				nc.setnRef(rs.getInt("n_ref"));
				nc.setnCommentRef(rs.getInt("n_comment_ref"));
				nc.setnCommentDate(rs.getDate("n_comment_date"));
				list.add(nc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//게시글 조회수 올리기
	public int updateCount(Connection conn, int no) {
		Statement stmt=null;
		int result=0;
		String sql="update notice set n_view_cnt=n_view_cnt+1 where n_no="+no;
		try {
			stmt=conn.createStatement();
			result=stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}return result;
	}
}










