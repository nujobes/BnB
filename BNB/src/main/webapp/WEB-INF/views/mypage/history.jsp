<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History</title>
<%@ include file="/resources/common/includeHead.jsp"%>
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
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont" class="row">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont" class="col-9">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="fas fa-home"></i> MY TRIP
			</h1>
			<div class="container">
				<!-- Nav pills -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="#trip">이전 예약</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="#history">현재 예약</a></li>
				</ul>

				<!-- Tab panes -->
				<br>
				<div class="tab-content">
					<div class="tab-pane container active" id="trip"
						style="height: 500px; overflow: scroll">
						<%-- <div class="card">
							<h5 class="card-header">이전 예약</h5>
							<c:if test="${empty historys}">
								<h1 style="text-align: center;">다녀온 여행이 없습니다.</h1>
							</c:if>
							<div class="row">
								<c:forEach var="his" items="${historys}">
									<div class="card history"
										style="width: 19rem; margin: 15px auto 10px auto;">
										<div class="historyCard">

											<div id="demo" class="carousel slide" data-ride="carousel"
												data-interval="false">

												<!-- Indicators -->
												<ul class="carousel-indicators">
													<li data-target="#demo" data-slide-to="0" class="active"></li>
													<li data-target="#demo" data-slide-to="1"></li>
													<li data-target="#demo" data-slide-to="2"></li>
												</ul>

												<!-- The slideshow -->
												<div class="carousel-inner"
													style="max-width: 100%; max-height: 200px; overflow: hidden;">
													<div class="carousel-item active">
														<img
															src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
															alt="Los Angeles"
															style="width: 100%; object-fit: contain;">
													</div>
													<div class="carousel-item">
														<img
															src="${pageContext.request.contextPath}/resources/images/userphoto/이제훈.jpg"
															alt="Chicago" style="width: 100%; object-fit: contain;">
													</div>
													<div class="carousel-item">
														<img
															src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
															alt="New York" style="width: 100%; object-fit: contain;">
													</div>
												</div>

												<!-- Left and right controls -->
												<a class="carousel-control-prev" href="#demo"
													data-slide="prev"> <span
													class="carousel-control-prev-icon"></span>
												</a> <a class="carousel-control-next" href="#demo"
													data-slide="next"> <span
													class="carousel-control-next-icon"></span>
												</a>
											</div>


											<a
												href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}"><img
												class="card-img-top"
												src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
												alt="Card image cap"
												style="width: 100%; object-fit: contain;"></a>
										</div>
										<div class="card-body">
											<h4 class="card-title">${his.address}</h4>
											<fmt:formatDate pattern="YY년 MM월 dd일" value="${his.checkIn}" />
											~
											<fmt:formatDate pattern="YY년 MM월 dd일" value="${his.checkOut}" />
											· <br>게스트 ${his.people}명<br> <br> <a
												href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}">${his.details}</a>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item"><fmt:formatNumber type="int"
													var="price" value="${his.price}" pattern="#,###" />￦
												${price}</li>
											<li class="list-group-item"><a
												href="${pageContext.request.contextPath}/review"
												class="card-link">후기보기</a></li>
										</ul>
									</div>
								</c:forEach>
							</div>
						</div> --%>

						<c:if test="${empty historys}">
							<h1 style="text-align: center;">다녀온 여행이 없습니다.</h1>
						</c:if>
						<ul class="timeline">
							<c:forEach var="his" items="${historys}" varStatus="status">
								<c:choose>
									<c:when test="${status.index % 2 == 0}">
										<li>
									</c:when>
									<c:otherwise>
										<li class="timeline-inverted">
									</c:otherwise>
								</c:choose>
								<div class="timeline-badge">
									<a><i class="fa fa-circle" id=""></i></a>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4>${his.address}</h4>
									</div>
									<div class="timeline-body">
										<p>
											<a
												href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}">
												${his.details}</a><br>
											<fmt:formatNumber type="int" var="price" value="${his.price}"
												pattern="#,###" />
											￦ ${price}<br> <a
												href="${pageContext.request.contextPath}/review"
												class="card-link">후기보기</a>
										</p>
									</div>
									<div class="timeline-footer">
										<p class="text-right">
											<fmt:formatDate pattern="YY년 MM월 dd일" value="${his.checkIn}" />
											~
											<fmt:formatDate pattern="YY년 MM월 dd일" value="${his.checkOut}" />
											· 게스트 ${his.people}명
										</p>
									</div>
								</div>
								</li>
								<li class="clearfix no-float"></li>
							</c:forEach>
						</ul>

					</div>
					<div class="tab-pane container" id="history"
						style="height: 500px; overflow: scroll">
						<c:if test="${empty trip}">
							<h1 style="text-align: center;">예정된 여행이 없습니다.</h1>
						</c:if>
						<ul class="timeline">
							<c:forEach var="trip" items="${trip}" varStatus="status">
								<c:choose>
									<c:when test="${status.index % 2 == 0}">
										<li>
									</c:when>
									<c:otherwise>
										<li class="timeline-inverted">
									</c:otherwise>
								</c:choose>
								<div class="timeline-badge">
									<a><i class="fa fa-circle" id=""></i></a>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4>${trip.address}</h4>
									</div>
									<div class="timeline-body">
										<p>
											<a
												href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${trip.roomsId}">
												${trip.details}</a><br>
											<fmt:formatNumber type="int" var="price"
												value="${trip.price}" pattern="#,###" />
											￦ ${price}<br> <a
												href="${pageContext.request.contextPath}/review"
												class="card-link">후기보기</a>
										</p>
									</div>
									<div class="timeline-footer">
										<p class="text-right">
											<fmt:formatDate pattern="YY년 MM월 dd일" value="${trip.checkIn}" />
											~
											<fmt:formatDate pattern="YY년 MM월 dd일"
												value="${trip.checkOut}" />
											· 게스트 ${trip.people}명
										</p>
									</div>
								</div>
								</li>
								<li class="clearfix no-float"></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>