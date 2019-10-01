<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="pension">
			<!-- 여기는 펜션정보 -->
			<!-- 펜션사진(1장), 펜션정보(주소,번호,안내 등), 부대시설, 예약가능객실수, 머무르는날짜 -->
			<div class="left">
				<image src=""/> <!-- 펜션사진 -->
			</div>
			<div class="right">
				<!-- 펜션정보 -->
				<div class="pInfo">
					<!-- 펜션이름, 주소 -->
				</div>
				<div class="pDetail">
					<!-- 기타 안내 -->
				</div>
			</div>
		</div>
		
		<div class="room">
			<!-- 여기는 객실정보 -->
			<!-- 객실사진(대표사진한장,서브), 객실정보(구조,설명,평수 등), 부대시설, 기준인원, 최대인원, 추가인원당추가요금, 기본가격, 총가격 -->
			<p>
				<img src=""><!-- 객실대표사진 -->
			</p>
			<strong class="title"><!-- 객실이름 --></strong>
			<div class="rInfo">
				<!-- 객실상세정보 -->
			</div>
			<div class="visible">
				<!-- 머라하지..? 펼쳤다 숨겼다 할 부분! ㅎㅎ -->
			</div>
		</div>
	</div>
	
<%@ include file="/views/common/footer.jsp"%>