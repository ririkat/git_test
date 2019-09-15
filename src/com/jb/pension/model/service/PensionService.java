package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

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
		Connection conn = null;
		List<Pension> list = dao.waitListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//오버로딩
	//펜션 검색 - 승인
	public int selectCountPension(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountPension(conn,type,keyword);
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
		close(conn);
		return result;
	}
	
	//승인대기중인 펜션 수
	public int selectWaitPension(String oId) {
		Connection conn = getConnection();
		int result = dao.selectWaitPension(conn,oId);
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
		close(conn);
		return result;
	}
}
