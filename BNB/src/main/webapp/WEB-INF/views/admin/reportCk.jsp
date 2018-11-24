<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resources/common/includeHead.jsp" %>
    <meta charset="UTF-8">
    <title>BITBNB ADMIN</title>
</head>
<body>
<%@ include file="/resources/common/Navbar.jsp" %>

<h1>관리자페이지</h1>

<table>
    <tr>
        <th>
            예약번호
        </th>
        <th>
            신고내용
        </th>
        <th>
            승인/보류
        </th>
    </tr>
    <c:if test="${!empty reportList}">
        <c:forEach var="list" items="${reportList}">
            <tr>
                <td>
                        ${list.reservationNum}
                </td>
                <td>
                        ${list.reportContent}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${list.reportCk eq 'F'}">
                            <a href="${pageContext.request.contextPath}/adminpage/report/comfirm?reservationNum=${list.reservationNum}&reportCk=T">
                                <button class="btn btn-danger">승인</button>
                            </a>
                            <a href="${pageContext.request.contextPath}/adminpage/report/comfirm?reservationNum=${list.reservationNum}&reportCk=B">
                                <button class="btn btn-warning">보류</button>
                            </a>
                        </c:when>
                        <c:when test="${list.reportCk eq 'T'}">
                            승인됨
                        </c:when>
                        <c:otherwise>
                            보류됨
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </c:if>
</table>
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <c:forEach begin="1" end="${totalPage}" var="i">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/adminpage/report?page=${i}">${i}</a></li>
        </c:forEach>

    </ul>
</nav>
</body>
</html>