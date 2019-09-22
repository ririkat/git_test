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
import com.jb.pension.model.vo.Pension;

public class OwnerService {
	private OwnerDao dao = new OwnerDao();
	
	//전체 업주회원수
	public int selectCountOwner() {
		Connection conn = getConnection();
		int count= dao.selectCountOwner(conn);
		close(conn);
		return count;
	}
	
	//전체 미승인 업주회원 수
	public int selectCountWait() {
		Connection conn = getConnection();
		int count = dao.selectCountWait(conn);
		close(conn);
		return count;
	}
	
	//승인 대기중인 업주
	public List<Owner> waitListPage(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Owner> list = dao.waitListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
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
	
	//미승인 업주 검색
	public int selectCountOwner2(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountOwner2(conn,type,keyword);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Owner> selectOwnerList(String type, String keyword, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Owner> list = dao.selectOwnerList(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Owner> selectOwnerList2(String type, String keyword, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Owner> list = dao.selectOwnerList2(conn,type,keyword,cPage,numPerPage);
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
	
	//관리자 승인대기 업주 선택삭제
	public int deleteOwnerList(String delList) {
		Connection conn = getConnection();
		int result = dao.deleteOwnerList(conn,delList);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//관리자 승인대기 업주 선택승인(승인대기목록)
	public int acceptOwnerList(String accList) {
		Connection conn = getConnection();
		int result = dao.acceptOwnerList(conn,accList);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//관리자 승인대기 업주 한명 승인
	public int acceptOwner(String oId) {
		Connection conn = getConnection();
		int result = dao.acceptOwner(conn,oId);
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


	public Owner findEmail(String uid) {
		Connection conn=getConnection();
		Owner o=dao.findEmail(conn, uid);
		close(conn);
		return o;
	}


	public int updatePassword(String id, String pw) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn,id,pw);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
}

