<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@
	page import="java.util.ArrayList,com.jb.wishlist.model.vo.WishList,java.util.List"
%>

<%@ include file="/views/common/header.jsp"%>
<%
	List<WishList> list=(List)request.getAttribute("list");
%>

<style>

}

table.wish-list {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 100px 100px;
	position: relative;
	left: 50px;
	top: 40px;
}

table.wish-list th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.wish-list td {
	width: 350px;
	padding: 15px;
	/* vertical-align: top; */
	border-bottom: 1px solid #ccc;
	vertical-align: middle;
}

#all-clear {
	/* margin-right: 50%; */
	float: right;
	position: relative;
	right: 130px;
	top: 40px;
}

th, td {
	text-align: center;
}
</style>

<div class="container-fluid">
	<div class="row content">
	
		<div class="col-sm-3 sidenav"><!--마이페이지 사이드메뉴 -->
			<br> <br>
			<h4 id="mypagetitle"><a href="mypage.html">&nbsp;&nbsp;마이페이지</a></h4>
			<div id="mypageList">
				<ul class="nav nav-pills nav-stacked">
					<br>
                        <li><a href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li class="active"><a href="<%=request.getContextPath()%>/client/wishList">&nbsp;&nbsp;내가찜한펜션</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/infoLoad?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/updatePassword?cId=<%=loginClient.getcId()%>">&nbsp;&nbsp;비밀번호변경</a></li>
                        <li><a href="<%=request.getContextPath()%>/client/deleteLoad?cId=<%=loginClient.getcId()%>">회원탈퇴</a></li>
					<br>
				</ul>
			</div>
		</div><!--마이페이지 사이드메뉴 끝 -->

		<section><!-- 내가 찜한 객실 시작 -->
			<div class="tit_contents">내가찜한펜션</div>
			<div class="all-clear">
				<button class="btn btn-warning" id="all-clear" onclick="">목록모두삭제</button>
			</div>
			<%if (list == null || list.size() <= 0) {%>
			<h1>찜한 펜션이 없습니다.</h1>
			<%} else {%>
			<table class="wish-list">
				<colgroup>
					<!-- 공백부분 -->
					<col width="1%" />
					<!-- 펜션이미지 -->
					<col width="15%" />
					<!-- 펜션이름 -->
					<col width="15%" />
					<!-- 펜션주소 -->
					<col width="15%" />
					<!-- 전화번호 -->
					<col width="15%" />
					<!-- 테마 -->
					<col width="15%" />
					<!-- 처리 -->
					<col width="15%" />
				</colgroup>
				<form name="list_form" method="post">
					<thead>
						<tr>
							<th scope="row"></th>
							<th scope="row">펜션사진</th>
							<th scope="row">펜션이름</th>
							<th scope="row">펜션주소</th>
							<th scope="row">전화번호</th>
							<th scope="row">상세정보</th>
							<th scope="row">처리</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < list.size(); i++) {
									WishList w = list.get(i);
									
									System.out.println("여기다 이놈아");
									System.out.println(w.getpCode());
						%>
						<form name="pension-jjim-match-Frm" method="post">
							<input type="hidden" id="" name="pCode" value="<%=w.getpCode()%>" />
						</form>
						<tr>
							<td></td>
							<td>
								<div class="">
									<a href=""><img
										src="<%=request.getContextPath()%>/images/펜션사진.jpg"
										width="80px" height="80px" class="img-thumbnail" /></a>
								</div>
							</td>
							<td class="td-name"><%=w.getpName()%></td>
							<td class="td-addr"><%=w.getpAddr()%></td>
							<td class="td-phone"><%=w.getpTel()%></td>
							<td class=""><button class="btn btn-warning">보기</button></td>
							<td class="">
							<button class="btn btn-warning" id="btn-delete">삭제</button>
							</td>
						</tr>
						<%} %>
					</tbody>
				</form>
			</table>
			<%} %>
		</section>
		<!-- 내가 찜한 객실 끝 -->	
		
<script>
// 	$(function(){
// 		$('#btn-delete').click(function(){
// 			if(confirm("정말로 삭제하시겠습니까?")){
// 	}
</script>
<%@ include file="/views/common/footer.jsp"%>