<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body id="mainback">
	<%@ include file="/resources/common/Navbar.jsp"%>

	<div id="search">
		<h1 id="title">당신의 숙소를 검색하세요.</h1>
		<div id="search_content">
			<div class="search_wrap">
				<label for="target">목적지</label><br> <input type="text"
					id="target"><br>
			</div>
			<div class="search_wrap">
				<label for="checkin">체크인&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label><label
					for="checkout">체크아웃</label><br> <input type="text"
					id="checkin" style="width: 190px"> <input type="text"
					id="checkout" style="width: 190px"><br>
			</div>
			<div class="search_wrap">
				<label for="adult">성인&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
				<label for="child">어린이</label> <br> <select>
					<option>인원 수</option>
					<option>1명</option>
					<option>2명</option>
				</select> <select>
					<option>인원 수</option>
					<option>1명</option>
					<option>2명</option>
				</select>
				<div class="search_wrap">
					<br> <input type="button" value="검색하기">
				</div>
			</div>
		</div>
	</div>
</body>
</html>