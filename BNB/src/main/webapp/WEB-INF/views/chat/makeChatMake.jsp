
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="../../../resources/js/sockjs.js"></script>
    <%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>
<%@ include file="/resources/common/Navbar.jsp"%>

    <p> 호스트에게 문의 사항이 있으시면 여기다가 쓰시면 호스트가 볼수있습니다.</p>
    <textarea cols="50" rows="10" placeholder="여기다 쓰세요" id="messageeeeee"></textarea>
    <button onclick="created()">만들어라</button>

<script>
    connect();
    function connect() {
        sock12 = new SockJS('${pageContext.request.contextPath}/chat');
        sock12.onopen = function () {
            console.log('open');
        };
    }

    function created() {
        var msg = $("#messageeeeee").val();
        if (msg != "") {
            message = {};
            message.messagecontent = $("#messageeeeee").val()
            message.hostId = '${ChatRoomInfo.hostId}'//고정값이여야함
            message.userId = '${sessionScope.loginUser.userId}'//고정값이여야함
            message.roomsId = '${ChatRoomInfo.roomsId}'//고정값이여야함
            message.sender = '${sessionScope.loginUser.userId}'
        }
        sock12.send(JSON.stringify(message));
        location.href='${pageContext.request.contextPath}'+'/';
    }
</script>
</body>
</html>
