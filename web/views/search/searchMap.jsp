<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e76ecfc05b559e02f313c77eb525f67&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center:  new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
};  


// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var geocoder=new kakao.maps.services.Geocoder();

/* 마커 여러개 등록하기 */
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        /* latlng: new kakao.maps.LatLng(33.450705, 126.570677) */
        addr:'서울 서초구 서초대로77길 3 아라타워 8층'
    },
    {
        title: '생태연못', 
        /* latlng: new kakao.maps.LatLng(33.450936, 126.569477) */
        addr:'서울 강남구 강남대로 438 스타플렉스'
    }
];



for (var i = 0; i < positions.length; i ++) {
	var ad=positions[i].addr;
	var title1=positions[i].title;
//주소로 좌표를 검색합니다
geocoder.addressSearch(ad, function(result, status) {

// 정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {

   var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
   console.log(title1);
   // 결과값으로 받은 위치를 마커로 표시합니다
/*    var marker = new kakao.maps.Marker({
       map: map,
       position: coords
   }); */
// 마커를 생성합니다
   var marker = new kakao.maps.Marker({
       map: map, // 마커를 표시할 지도
       position: coords, // 마커를 표시할 위치 // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
       title : title1
   });
   
   marker.setMap(map);

   /* // 인포윈도우로 장소에 대한 설명을 표시합니다
   var infowindow = new kakao.maps.InfoWindow({
       content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
   });
   infowindow.open(map, marker); */

   // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   map.setCenter(coords);
} 
});


// 마커 이미지의 이미지 주소입니다
/* var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";  */
    
    
    /* // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  */
    
    
}
   
</script>
</section>
<%@ include file="/views/common/footer.jsp"%>