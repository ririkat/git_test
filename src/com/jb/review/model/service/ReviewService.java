package com.jb.review.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.jb.review.model.dao.ReviewDao;
import com.jb.review.model.vo.Review;

public class ReviewService {
	private ReviewDao dao = new ReviewDao();
	
	//전체리뷰수
	public int selectReviewCount() {
		Connection conn = getConnection();
		int result = dao.selectReviewCount(conn);
		close(conn);
		return result;		
	}
	
	//리뷰 조회
	public List<Review> selectReviewList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Review> list = dao.selectReviewList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//업주의 펜션에 대한 전체리뷰수
	public int selectMyPensionReviewCount(String pCode) {
		Connection conn = getConnection();
		int result = dao.selectMyPensionReviewCount(conn,pCode);
		close(conn);
		return result;
	}
	
	//업주의 펜션에 대한 리뷰 조회
	public List<Review> selectMyPensionReviewList(String pCode, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Review> list = dao.selectMyPensionReviewList(conn,pCode,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public Review selectReviewOne(int rNo) {
		Connection conn = getConnection();
		Review r = dao.selectReviewOne(conn,rNo);
		close(conn);
		return r;
	}
	
	
	
	//리뷰 작성
	public int writeReview(String title, String writer, String content, String pCode) {
		Connection conn=getConnection();
		int result = dao.writeReview(conn,title,writer,content,pCode);
		System.out.println("글쓰기Service result return: "+result);
		if(result>0) {
			commit(conn);
			result= dao.getCurrval(conn);
			System.out.println("currval: "+result);
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
	
	//삭제
	public int deleteReview(int rNo) {
		Connection conn =getConnection ();
		int result=dao.deleteReview(conn,rNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//리뷰수정
	public int updateReview(int rNo, String title, String writer, String content,String pCode) {
		Connection conn = getConnection();
		int result = dao.updateReview(conn, rNo, title, writer, content, pCode);
		int imgDelete=0;
		if(result>0) {
			commit(conn);
			//rNo를 imgDlete를 넣고
			imgDelete = dao.imgDelete(conn, rNo);		//수정할때 기존 r_no로 review_file테이블에 있는 데이터삭제
			System.out.println("dao.imgDelete 작동!"+imgDelete);
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
	
	
}
