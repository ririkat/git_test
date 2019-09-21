<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
<div>
<form method="post" action="<%=request.getContextPath()%>/search/1" onsubmit="return insert_validate();">
<input type="text" name="address" id="address" placeholder="주소 입력하세요"/>
<input type="text" name="y" id="result1"/>
<input type="text" name="x" id="result2"/>
<input type="submit" value="주소등록"/>
</form>

</div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e76ecfc05b559e02f313c77eb525f67&libraries=services"></script>
서울 서초구 서초대로77길 3 아라타워 8층
<script>

	var geocoder = new kakao.maps.services.Geocoder();
	
	$("#address").keyup(function() {
		var addr = $('#address').val().trim();
		var re = geocoder.addressSearch(addr,
				function(result, status) {
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
						var y=result[0].y;
						var x=result[0].x;
						
						$("#result1").val(y);
						$("#result2").val(x);
					}
		});
    });

	// 마커 이미지의 이미지 주소입니다
	function insert_validate(){
			var addr = $('#address').val().trim();
			if(addr==""){
				alert("주소 입력된거 없음");
				return false;
			}
		  
			
			if($("#result1").val()==""||$("#result2").val()==""){
				alert('위도,경도 아직 검색 안됨 ㅠㅠ');
				return false;
			}
	}   

</script>
</section>
<%@ include file="/views/common/footer.jsp"%>