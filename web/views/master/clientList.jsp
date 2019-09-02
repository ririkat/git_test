<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.client.model.vo.Client" %>
<%
	/* List<Client> clients = (List)request.getAttribute("clients");
	int cPage = (int)request.getAttribute("cPage"); */
%>

<%@ include file="/views/common/header.jsp"%>

    <section>
    <stytle>
        
    </stytle>
    <div class="container-fluid">
        <div class="row content">
        	<!--사이드바-->
            <div class="col-sm-3 col-md-3 sidenav"> 
                <br>
                <br>
                <h4 id="mypagetitle"><a href="mypage.html">&nbsp;&nbsp;관리 메뉴</a></h4>
                <div id="mypageList">
                    <ul class="nav nav-pills nav-stacked">
                        <br>
                        <li class="active">
                            <a class="nav-link active" href="jang.html">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-home">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                </svg>
                                펜션관리 <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="jang2.html">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-file">
                                    <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                    <polyline points="13 2 13 9 20 9"></polyline>
                                </svg>
                                업주관리
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="jang3.html">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-users">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                                회원관리
                            </a>
                        </li>
                    </ul><br>
                </div>
            </div>


            <!--content영역-->
            <div class="col-md-9">
                <br><br><br>
                <h2>회원관리</h2>
                <table id="tbl-clientList" class="table table-hover">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>가입일</th>
                            <th>블랙카운트</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

                <div class="text-center">
                    <ul class="pagination">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                    </ul>
                </div>
            </div>
            

        </div>
    </div>
	</section>

<%@ include file="/views/common/footer.jsp"%>