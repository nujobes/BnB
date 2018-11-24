<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WishList</title>
<%@ include file="/resources/common/includeHead.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31560f6f51cc23c9f8ef204f4664e637&libraries=services"></script>
<style>
::-webkit-scrollbar {
	width: 8px;
	height: 8px;
	border: 3px solid #fff;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	display: block;
	height: 10px;
	background: #efefef
}

::-webkit-scrollbar-track {
	background: #efefef;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .2)
}

::-webkit-scrollbar-thumb {
	height: 50px;
	width: 50px;
	background: rgba(0, 0, 0, .2);
	-webkit-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .1)
}
</style>
<script>
	$(document).ready(function() {
						var aa = $('.wishRoomsId');
						var bb = $('.wishImgRoomsId');
						var arr = [];
						for (var i = 0; i < aa.length; i++) {
							var wishRoomsId = $('.wishRoomsId').eq(i).val();
							for (var j = 0; j < bb.length; j++) {
								var wishImgRoomsId = $('.wishImgRoomsId').eq(j).val();
								if (wishRoomsId == wishImgRoomsId) {
									var wishImgFilename = $('.wishImgFilename').eq(j).val();
									arr.push({	'roomsId' : wishImgRoomsId, 'fileName' : wishImgFilename});
								}
							}
						}
						var div = $('<div class="carousel-item active">'
								+ '<img class="wishImg" style="width: 100%; object-fit: contain;"></div>');
						for (var k = 0; k < arr.length; k++) {
							var wishRoomsId = $('.wishRoomsId').eq(k).val();
							for (var z = 0; z < aa.length; z++) {
								var zz = $('.carousel-inner' + z);
								if (arr[z].roomsId == wishRoomsId) {
									zz.append(div);
									$('.wishImg').addClass('imgFile' + z);
									$('.imgFile' + z).attr('src','http://13.209.99.134:8080/imgserver/resources/upload/'+ arr[z].fileName);
								}
							}
						}
					});
</script>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont" class="row">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont" class="col-9">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="far fa-grin-hearts"></i> WISH LIST
			</h1>
			<div class="row"
				style="height: 600px; /* width: 900px; */ margin: 0 auto;">
				<div class="col-5" style="overflow: scroll">
					<h2 style="font-weight: 600; text-align: center;">
						<i class="fas fa-map-marker-alt" style="color: red;"></i>&ensp;${address}
					</h2>
					<br>

					<!-- 방넘버별 이미지값 받기 -->
					<c:forEach var="img" items="${wishImg}" varStatus="status1">
						<input type="hidden" value="${img.roomsId}" class="wishImgRoomsId">
						<input type="hidden" value="${img.filename}"
							class="wishImgFilename">
					</c:forEach>


					<c:forEach var="wl" items="${wishList}" varStatus="status">
						<c:set var="priceAvg"
							value="${wl.price_weekdays + wl.price_weekend / 2}" />
						<fmt:formatNumber type="int" var="price" value="${priceAvg}"
							pattern="#,###" />
						<div class="card" style="margin-bottom: 20px;">

							<div id="demo" class="carousel slide demo${status.index}"
								data-ride="carousel" data-interval="false">
								<!-- The slideshow -->
								<div class="carousel-inner${status.index}"
									style="max-width: 100%; max-height: 300px; overflow: hidden;">

									<%-- <div class="carousel-item active">
										<img
											src="${pageContext.request.contextPath}/resources/images/userphoto/이제훈.jpg"
											alt="Chicago" style="width: 100%; object-fit: contain;">
									</div> --%>
									<%-- <div class="carousel-item">
										<img
											src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
											alt="New York" style="width: 100%; object-fit: contain;">
									</div> --%>

									<!-- Left and right controls -->
									<a class="carousel-control-prev" href=".demo${status.index}"
										data-slide="prev"> <span
										class="carousel-control-prev-icon"></span>
									</a> <a class="carousel-control-next" href=".demo${status.index}"
										data-slide="next"> <span
										class="carousel-control-next-icon"></span>
									</a>
								</div>
							</div>

							<%-- <img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
								alt="Card image cap"> --%>


							<div class="card-body">
								<h5 class="card-title">
									<input type="text" value="${wl.roomsId}" class="wishRoomsId">번
									방 <b>${wl.hostId}</b>님의 숙소
								</h5>
								<span class="card-text" id="price">￦ ${price} / 박</span>
								<c:choose>
									<c:when test="${0 ne wl.reviewCount and 0 ne wl.avgScope}">
										<span class="card-text"> <c:forEach var="scope"
												begin="1" end="${wl.avgScope}">
												<i class="fas fa-star fa-sm" style="color: #FF5A5F;"></i>
											</c:forEach>(${wl.reviewCount})
										</span>
									</c:when>
									<c:otherwise>
										<span class="card-text"><i
											class="fas fa-exclamation-circle" style="color: red;"></i>
											후기없음</span>
									</c:otherwise>
								</c:choose>
								<br> <br> <a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${wl.roomsId}"
									class="btn"
									style="background-color: #FF5A5F; color: white; float: right;">보러가기</a>
							</div>
							<input type="hidden" value="${wl.address}" id="de_add"
								class="de_add" name="address">
						</div>
					</c:forEach>
				</div>
				<div class="col-7" id="map"></div>
			</div>
			<br>
			<div class="text-center">
				<button onclick="javascript:history.back();"
					class="btn btn-outline-secondary" style="margin: 10px;">목록으로</button>
			</div>
			<br>
		</div>
	</div>
	<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 
			level : 7
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		var addressArray = [];
		var wishList = $('.de_add');

		for (var i = 0; i < wishList.length; i++) {
			addressArray.push({
				'groupAddress' : $("input[name='address']").eq(i).val()
			});
		}

		for (var i = 0; i < addressArray.length; i++) {
			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							addressArray[i].groupAddress,
							function(result, status, data) {

								// 정상적으로 검색이 완료됐으면 
								if (status === daum.maps.services.Status.OK) {

									var coords = new daum.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new daum.maps.Marker({
										map : map,
										position : coords
									});

									// 마커를 지도에 표시합니다.
									marker.setMap(map);

									/* // 마커에 마우스오버 이벤트를 등록합니다
									daum.maps.event.addListener(marker,
											'mouseover', function() {
												// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
												infowindow.open(map, marker);
											});

									// 마커에 마우스아웃 이벤트를 등록합니다
									daum.maps.event.addListener(marker,
											'mouseout', function() {
												// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
												infowindow.close();
											});

									var iwContent = '<div style="font-size:11px; text-align:center;">'
											+ result[0].address_name + '</div>';

									// 인포윈도우를 생성합니다
									var infowindow = new daum.maps.InfoWindow({
										position : coords,
										content : iwContent
									}); */

									var content = '<div class ="labelWish"><span class="leftWish"></span><span class="centerWish">'
											+ result[0].address_name
											+ '</span><span class="rightWish"></span></div>';

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new daum.maps.CustomOverlay(
											{
												position : coords,
												content : content
											});

									// 커스텀 오버레이를 지도에 표시합니다
									customOverlay.setMap(map);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});

		}
	</script>
</body>
</html>