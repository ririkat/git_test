package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.jb.pension.model.dao.PensionFacilitiesDao;

public class PensionFacilitiesService {

	private PensionFacilitiesDao dao = new PensionFacilitiesDao();
	
	//펜션등록시 부대시설 추가
	public int addFacilities(int currval, String[] facCheck) {
		Connection conn = getConnection();
		int result = dao.addFacilities(conn, currval, facCheck);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}