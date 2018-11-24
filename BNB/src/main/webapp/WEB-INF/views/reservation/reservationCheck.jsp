<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>
<%@ include file="/resources/common/Navbar.jsp"%>
	<h1>예약 신청이 완료되었습니다.</h1>
	<br />
	<h2>${info.checkIn} ~ ${info.checkOut}</h2>
	
	<h2>가격 : <fmt:formatNumber value="${info.price}" pattern="###,###,###" /></h2>
	<h2><a href="${pageContext.request.contextPath}/mypage">마이페이지에서 확인하기</a></h2>
</body>
</html>