<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
<script>
$(document).ready(function(){
	listReply2();//json리턴방식
	
	$("#btnReply").click(function(){
		var replytext=$("#replytext").val();
		var bId="${bto.bId}"
		var param="replytext="+replytext+"&bId="+bId;
		$.ajax({
			type:"post",
			url:"${path}/reply/insert.do",
			date:param,
			success:function(){
				alert("댓글이 등록되었습니다");
				listReply2();
			}
		});
	});
	
	$("#btnUpdate").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		
		if(title == ""){
			alert("제목을 입력하세요");
			document.form1.title.focus();
			return;
		}
		if(content ==""){
			alert("내용을 입력하세요");
			document.form1.title.focus();
			return;
		}
		document.form1.action="${path}/host/update.do"
		//폼에 입력한 데이터 서버로 전송
		document.form1.submit();
	});
	
});

		//controller방식
		function listReply(){
			$.ajax({
				type:"get",
				url:"${path}/reply/list.do?bId=${dto.bId}",
						success:function(result){
							//responsetext가 result에 저장됨
							$("#listReply").html(result);
						}
				
			});
		}
		
		//controller(json)
		function listReplt2(){
			$.ajax({
				type:"get",
				url:"${path}/reply/listJson.do?bId=${dto.bId}",
						success:function(result){
							console.log(result);
							var output = "<table>";
							for(var i in result){
								output += "<tr>";
								output += "<td>"+result[i].userName;
								output += "("+changeDat(result[i].regdate)+")<br>";
								output += result[i].replytext+"</td>";
								output += "<tr>";
							}
							output += "</table>";
							$("#listReply").html(output);
						}
			
		});
			
		}
</script>
</head>
<body>
<h2>게시글보기</h2>
<form name = "form1" method="post">
	<div>
	작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
	</div>
	<%-- <div>
	조회수 : ${dto.viewcnt }
	</div> --%>
	
	<div>
	 제목
	 <input name="bTitle" id="bTitle" size="80" value="${dto.bTitle}" placeholder="제목">
	</div>
	<div>
	 내용
	 <textarea name="bContent" id="bContent" rows="4" cols="80" placeholder="내용을 입력하시오">{dto.bContent}</textarea>
	</div>
	<div>
	이름
	${dto.userName}
	</div>
	<div style="width:650px; text-align:center;">
	<!-- 게시물 번호 hidden으로 설정 -->
	<input type="hidden" name="bno" value="${dto.bId }">
	<!-- 본인이 쓴 게시물만 수정, 삭제사 가능하도록 처리 -->
	<c:if test="${sessionScope.bUserId == dto.bWriter}">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</c:if>
	<!-- 상세보기 화면에서 게세글 목록화면으로 이동  -->	
		<button type="button" id="btnList">목록</button>
	</div>
</form>
	<div style="width:650px; text-align:center;">
		<br>
		<!-- 로그인 한 회원만 댓글 작성폼 보이도록 처리-->
		
		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
		<br>
	
	</div>
<!-- 댓글목록 출력 위치 -->
	<div id="listReply"></div>

</body>
</html>






















