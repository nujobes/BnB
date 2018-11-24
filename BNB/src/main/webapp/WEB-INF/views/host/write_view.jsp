<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/common/includeHead.jsp"%>
<html>
<head>
<h1>게시글작성</h1>

<script>
$(document).ready(function() {
	$('#submitBtn').click(function() {
		$('#bContent').val($('#bContent').val().replace(/\n/g, '<br>'));
		$('#target').submit();
	});
});
</script>
</head>
<body>
<form method="post" id="target">
	<table>
		<tr>
			<th width="100">작성자</th>
			<td><input type="text" value="" name="bUserId" size="50"
				required="required"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="bTitle" size="50"
				 required="required"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="bContent" name="bContent" rows="10"
					 required="required"></textarea></td>
		</tr>
	</table>
	<br> <input type="button" id="submitBtn" value="입력">
</form>
</body>
</html>