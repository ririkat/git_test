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
                            <a class="nav-link" href="<%=request.getContextPath()%>/owner/pensionList?oId=<%=loginOwner.getoId() %>">
                                  펜션관리 </span>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="<%=request.getContextPath()%>/owner/ownerInfo?oId=<%=loginOwner.getoId()%>">
                               개인정보수정</a>
                        </li>
                         <li>
                           <a class="nav-link" href="<%=request.getContextPath()%>/owner/updatePassword?oId=<%=loginOwner.getoId()%>">
                              비밀번호변경</a>
                        </li>
                        
                        <li>
                           <a class="nav-link" href="<%=request.getContextPath()%>/owner/deleteOwner?oId=<%=loginOwner.getoId()%>">
                              업주탈퇴</a>
                        </li>
                        
                    </ul><br>
                </div>
            </div>
   