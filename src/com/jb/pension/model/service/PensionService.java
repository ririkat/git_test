package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.client.model.vo.Client;
import com.jb.pension.model.dao.PensionDao;
import com.jb.pension.model.vo.Pension;

public class PensionService {
	
	private PensionDao dao = new PensionDao();
	
	//pCode로 받아온 한개의 펜션 정보
	public Pension selectPension(String pCode) {
		Connection conn = getConnection();
		Pension p = dao.selectPension(conn,pCode);
		close(conn);
		return p;
	}

	//전체 승인된 펜션 수
	public int selectCountPension() {
		Connection conn = getConnection();
		int count = dao.selectCountPension(conn);
		close(conn);
		return count;
	}
	
	//승인된 펜션
	public List<Pension> selectListPage(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Pension> list = dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//전체 미승인 펜션 수
	public int selectCountWait() {
		Connection conn = getConnection();
		int count = dao.selectCountWait(conn);
		close(conn);
		return count;
	}
	
	//승인 대기중인 펜션
	public List<Pension> waitListPage(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Pension> list = dao.waitListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//오버로딩
	//펜션 검색 - 승인
	public int selectCountPension(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountPension(conn,type,keyword);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Pension> selectPensionList(String type, String keyword, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Pension> list = dao.selectPensionList(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//펜션 검색 - 미승인
	public int selectCountPension2(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountPension2(conn,type,keyword);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Pension> selectPensionList2(String type, String keyword, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Pension> list = dao.selectPensionList2(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//관리자 펜션관리 선택삭제
	public int deletePensionList(String delList) {
		Connection conn = getConnection();
		int result = dao.deletePensionList(conn,delList);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//관리자 승인대기->펜션상세->반려 (펜션 한개 삭제)
	public int deleteOnePension(String pCode, String oId) {
		Connection conn = getConnection();
		int result = dao.deleteOnePension(conn, pCode, oId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//관리자 펜션관리 선택승인 (승인대기목록)
	public int acceptPensionList(String accList) {
		Connection conn = getConnection();
		int result = dao.acceptPensionList(conn,accList);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//관리자 승인대기->펜션상세->승인 (펜션 한개 승인)
	public int acceptOnePension(String pCode, String oId) {
		Connection conn = getConnection();
		int result = dao.acceptOnePension(conn,pCode,oId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//승인대기중인 펜션 수
	public int selectWaitPension(String oId) {
		Connection conn = getConnection();
		int result = dao.selectWaitPension(conn,oId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Pension> selectWaitList(int cPage, int numPerPage, String oId){
		Connection conn = getConnection();
		List<Pension> list = dao.selectWaitList(conn, cPage, numPerPage, oId);
		close(conn);
		return list;
	}
	
	//펜션 추가
	public int addPension(String pName, String addr, String tel, String oId) {
		Connection conn = getConnection();
		int result = dao.addPension(conn,pName,addr,tel,oId);
		if(result>0) {
			commit(conn);
			result = dao.getCurrval(conn);
			if(result>0) {
				commit(conn);
			}
			else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//업주의 승인된 펜션리스트
	public List<Pension> selectAccList(String oId){
		Connection conn = getConnection();
		List<Pension> pensions = dao.selectAccList(conn,oId);
		close(conn);
		return pensions;
	}
	
	//펜션코드로 펜션이름 가져오기
	public String getPensionName(String pCode) {
		Connection conn = getConnection();
		String pName = dao.getPensionName(conn,pCode);
		close(conn);
		return pName;
	}
}
