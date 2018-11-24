<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/common/includeHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<h1>게시글상세</h1>

</head>
<body>
<table>
	<tr>
		<th width="80">번호</th>
		<td>${viewLink.bId}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${viewLink.bUserId}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td> ${viewLink.bTitle}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${viewLink.bContent}</td>
	</tr>
</table>
<br>
<a href="${pageContext.request.contextPath}/host"><button
		type="button" class="btn btn-dark">목록보기</button></a>
&nbsp;&nbsp;
<a
	href="${pageContext.request.contextPath}/host/update?bId=${viewLink.bId}"><button
		type="button" class="btn btn-dark">수정</button></a>
&nbsp;&nbsp;
<a
	href="${pageContext.request.contextPath}/host/delete?bId=${viewLink.bId}"><button
		type="button" class="btn btn-dark">삭제</button></a>	
	<br>
	
<!--  댓글  -->
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bId" id="bId" value="${viewLink.bId}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>

 
<!--      추가                         -->
<%@ include file="comment.jsp" %>

	
</body>
</html>