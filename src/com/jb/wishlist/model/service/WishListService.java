package com.jb.wishlist.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.jb.wishlist.model.dao.WishListDao;
import com.jb.wishlist.model.vo.WishList;

public class WishListService {
	
	private WishListDao dao = new WishListDao();
	
	public int insertWishList(WishList w) {
		Connection conn = getConnection();
		int result = dao.insertWishList(conn, w);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
}
