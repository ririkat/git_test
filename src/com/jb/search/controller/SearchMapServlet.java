package com.jb.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.jb.pension.model.vo.Pension;
import com.jb.search.model.service.SearchService;

/**
 * Servlet implementation class SearchMapServlet
 */
@WebServlet("/search/mapSearch")
public class SearchMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword=request.getParameter("keyword");
		double y=Double.parseDouble(request.getParameter("y"));
		double x=Double.parseDouble(request.getParameter("x"));
		
		List<Pension> resultList=new SearchService().searchMapResultLoad(keyword,y,x);
		System.out.println(resultList);
//		JSONObject obj = new JSONObject();
//		obj.put("resultList", resultList);

		//타입을 json으로 바꿔줘야됨
		response.setContentType("application/x-json; charset=UTF-8");
       
        //DTO 타입의 어레이리스트를 json 형태로 바꿔주는 구문(라이브러리 필수, zip->jar 확장자명 꼭 확인)
        String gson = new Gson().toJson(resultList);
       
        try {
            //ajax로 리턴해주는 부분
            response.getWriter().write(gson);
        } catch (JsonIOException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
