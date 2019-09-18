<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jb.owner.model.vo.Owner" %>
<%
 Owner o=(Owner)request.getAttribute("owner");
%>

<section>
    <div class="container-fluid">
        <div class="row content">
        	<!--사이드바-->
            <div class="col-sm-3 col-md-2 sidenav"> 
                <br>
                <br>
                <h4 id="mypagetitle"><a href="mypage.html">&nbsp;&nbsp;관리 메뉴</a></h4>
                <div id="mypageList">
                    <ul class="nav nav-pills nav-stacked">
                        <br>
                        <li class="active">
                            <a class="nav-link active" href="<%=request.getContextPath()%>/owner/pensionList?oId=<%=loginOwner.getoId() %>">
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
                            <a class="nav-link" href="<%=request.getContextPath()%>/owner/ownerInfo?oId=<%=loginOwner.getoId()%>">
                            	개인정보</a>
                        </li>
                         <li>
                        	<a class="nav-link" href="<%=request.getContextPath()%>/owner/updatePassword?oId=<%=loginOwner.getoId()%>">
                        		비밀번호 변경</a>
                        </li>
                        
                        <li>
                        	<a class="nav-link" href="<%=request.getContextPath()%>/owner/deleteOwner?oId=<%=loginOwner.getoId()%>">
                        		업주탈퇴</a>
                        </li>
                        
                    </ul><br>
                </div>
            </div>
	