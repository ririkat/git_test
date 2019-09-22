<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<div class="map_wrap">
		<p id="result1"></p>
		<p id="result2"></p>
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<!-- onsubmit="searchPlaces(); return false;" -->
					키워드 : <input type="text" value="..." placeholder="키워드를 입력하세요"
						id="keyword" size="15">
					<button id="submit">검색하기</button>
					<!-- type="submit" -->

				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>

	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e76ecfc05b559e02f313c77eb525f67&libraries=services"></script>
	<script>
	
		

		/* 지도~ */
		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		/* 접속위치를 받아오기 */
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
				
				var resultDiv1 = document.getElementById('result1');
				var resultDiv2 = document.getElementById('result2');
				
				resultDiv1.innerHTML = lat;
				resultDiv2.innerHTML = lon;

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		//지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			markers.push(marker);
			map.setCenter(locPosition);
		}

		/* 이동된 위치 중심좌표 반환하기 */
		// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'dragend', function() {

			// 지도 중심좌표를 얻어옵니다 
			var latlng = map.getCenter();

			var y = latlng.getLat();
			var x = latlng.getLng();

			/* var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다'; */
			
			var resultDiv1 = document.getElementById('result1');
			var resultDiv2 = document.getElementById('result2');

			resultDiv1.innerHTML = y;
			resultDiv2.innerHTML = x;
		});
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}
		
		/* 검색 버튼 클릭시!! 로직*/
		$('#submit').click(function(){
			removeMarker();
			var keyword=$('#keyword').val();
			var y=$('#result1').html();
			console.log(y);
			var x=$('#result2').html();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/search/mapSearch",
				type : "post",
				data : {
					keyword : keyword,
					y : y,
					x : x
				},
				dataType : "JSON",
				success : function(data) {

					var positions = data;
					if(positions.length==0){
						alert('반경 5km 이내에 검색결과가 없습니다.')
					}else{
						for (var i = 0; i < positions.length; i ++) {
							var coords = new kakao.maps.LatLng(positions[0].loc_y,
									positions[0].loc_x);
						    
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: new kakao.maps.LatLng(positions[i].loc_y, positions[i].loc_x), // 마커를 표시할 위치
						        title : i // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						    });
						    
						    marker.setMap(map);
						    markers.push(marker);
						    map.setCenter(coords);
						}
					}
					
					

				},

				error : function(data) {
				}

			})
		})
		
		
	</script>

</section>
<%@ include file="/views/common/footer.jsp"%>