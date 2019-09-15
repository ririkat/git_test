package com.jb.owner.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.client.model.vo.Client;
import com.jb.owner.model.dao.OwnerDao;
import com.jb.owner.model.vo.Owner;

public class OwnerService {
	private OwnerDao dao = new OwnerDao();
	
	
	
	//전체 업주회원수
	public int selectCountOwner() {
		Connection conn = getConnection();
		int count= dao.selectCountOwner(conn);
		close(conn);
		return count;
	}
	
	
	public List<Owner> selectListPage(int cPage, int numPerPage){
		Connection conn =getConnection();
		List<Owner> list=dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;		
	}
	
	//오버로딩 /검색
	public int selectCountOwner(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountOwner(conn, type,keyword);
		close(conn);
		return result;
	}
	public List<Owner> selectOwnerList(String type, String keyword, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Owner> list = dao.selectOwnerList(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public Owner selectOwnerOne(String oId) {
		Connection conn = getConnection();
		Owner o = dao.selectOwnerOne(conn, oId);
		close(conn);
		return o;
	}
	
	public int deleteOwner(String id) {
		Connection conn = getConnection();
		int result = dao.deleteOwner(conn, id);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int multiDeleteOwner(String[] idss) {
		Connection conn =getConnection();
		int result = dao.multiDeleteOwner(conn, idss);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Owner selectId(String id, String pw) {
		Connection conn = getConnection();
		Owner o = dao.selectId(conn, id, pw);
		close(conn);
		return o;
	}
	
	
	//업체 회원가입
	public int insertOwner(Owner o) {
		Connection conn = getConnection();
		int result = dao.insertOwner(conn, o);
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//업체 아이디 중복
	public boolean selectCheckId(String id) {
		Connection conn = getConnection();
		boolean result = dao.selectCheckId(conn,id);
		close(conn);
		return result;
	}
	
	//업체 아이디찾기
	public Owner findId(String name, String email) {
		Connection conn = getConnection();
		Owner o = dao.findId(conn,name,email);
		close(conn);
		return o;
	
	}
	
}

