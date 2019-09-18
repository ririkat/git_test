package com.jb.review.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.jb.review.model.dao.ReviewFileDao;

public class ReviewFileService {
	private ReviewFileDao dao = new ReviewFileDao();
	
	public int addImages(int currval, String oriFile, String reFile) {
		Connection conn = getConnection();
		int result= dao.addImages(conn,currval,oriFile,reFile);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
