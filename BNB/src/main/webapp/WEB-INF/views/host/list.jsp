<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<h1>Host Community</h1>

<style>
    a {
        color: #999;
        text-decoration: none;
    }

    a:link {
        color: #999;
        text-decoration: none;
    }

    a:hover {
        text-decoration: none;
    }

    a:visited {
        color: #999;
        text-decoration: none;
    }

</style>
</head>
<body>
<table>
    <tr>
        <th width="80">번호</th>
        <th>제목</th>
        <th width="150">이름</th>
        <th width="210">날짜</th>
    </tr>
    <c:forEach items="${list}" var="dto"> <!-- core라는 테그 라이브러리 이용 / list객체받아와서 변수명을 dto로  -->
        <tr>
            <td>${dto.bId}</td>
            <td><a href="${pageContext.request.contextPath}/host/viewLink?bId=${dto.bId}">${dto.bTitle}</a></td>
            <td>${dto.bUserId}</td>
            <td>${dto.bDate}</td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="${pageContext.request.contextPath}/host/write">
    <button type="button" class="btn btn-dark">글 작성</button>
</a>
</body>
</html>
