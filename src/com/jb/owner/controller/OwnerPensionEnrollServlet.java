package com.jb.owner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OwnerPensionEnrollServlet
 */
@WebServlet("/owner/pensionEnroll")
public class OwnerPensionEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerPensionEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//업주 아이디 받아와서 업주소유의 펜션만 불러오기.
		//리스트 위쪽에 추가버튼 필요.
		//펜션 리스트에는 승인여부도 표시해주기
		//승인되지 않은 펜션은 클릭도 되지 x
		//승인된 펜션은 클릭-> 정보 띄워주고 수정버튼, 아래에 객실리스트 및 객실 추가버튼
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
