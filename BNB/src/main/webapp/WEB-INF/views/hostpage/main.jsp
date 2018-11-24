<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mypage</title>
    <%@ include file="/resources/common/includeHead.jsp" %>

</head>
<body style=" overflow-x: hidden">
<%@ include file="/resources/common/Navbar.jsp" %>


<div class="row justify-content-center">
    <div class="col-2">
        <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active"
               id="list-home-list" data-toggle="list" href="#list-home" role="tab"
               aria-controls="home"><i class="far fa-calendar-alt"></i> 예약현황</a> <a
                class="list-group-item list-group-item-action"
                onclick="viewMyroomList()" id="list-profid" data-toggle="list"
                href="#list-profi" role="tab" aria-controls="profile"><i
                class="fas fa-home"></i> 내방보기</a> <a
                class="list-group-item list-group-item-action"
                id="list-profile-list" data-toggle="list" href="#list-profile"
                role="tab" aria-controls="profile" onclick="eval()"><i
                class="fas fa-user-check"></i> 사용자평가</a> <a
                class="list-group-item list-group-item-action"
                id="list-messages-list"
                href="${pageContext.request.contextPath}/host"><i
                class="far fa-list-alt"></i> 호스트게시판</a> <a
                class="list-group-item list-group-item-action"
                id="list-settings-list" data-toggle="list" href="#list-settings"
                role="tab" aria-controls="settings" onclick="withdraw()"><i
                class="fas fa-hand-holding-usd"></i> 인출</a> <a
                class="list-group-item list-group-item-action"
                id="list-settings-li" data-toggle="list" href="#list-settings2"
                role="tab" aria-controls="settings" onclick="selectroom()"><i
                class="fas fa-chart-line"></i> 통계</a>
        </div>
    </div>
    <div class="col-8">
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="list-home"
                 role="tabpanel" aria-labelledby="list-home-list">
                <c:choose>
                    <c:when test="${empty myroomlist}">
                       예약된 방이 없습니다.
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="room" items="${myroomlist}">
                            <div id="mymy${room.roomsId}" onclick="myroomlistselect('${room.roomsId}')" style="cursor: pointer">
                                룸 번호 ( ${room.roomsId} ) <span
                                    class="badge badge-pill badge-primary">${room.reservationCount}</span>
                            </div>
                            <div class="dis row col-12" style="display: none"
                                 id="myroom${room.roomsId}"></div>
                        </c:forEach>

                        <script>
                            function myroomlistselect(roomsid) {
                                $('.dis').css('display', 'none');
                                $
                                    .ajax({
                                        url: '${pageContext.request.contextPath}/hostpage/getreser?roomsId='
                                            + roomsid,
                                        type: 'get',
                                        datatype: 'json',
                                        success: function (data) {
                                            var str = '<div class="col-md-3" style=" background-color: #EEEEEE" ><b>예약자</b></div><div class="col-md-4" style="background-color: #EEEEEE">예약 일시</div><div class="col-md-2" style=" background-color: #EEEEEE"> 결제 금액 </div><div class="col-md-3" style=" background-color: #EEEEEE"> 취소 </div>';
                                            var today = new Date();
                                            today.setDate(today
                                                .getDate() + 5);
                                            $(data)
                                                .each(
                                                    function (
                                                        key,
                                                        value) {
                                                        var year = value.checkIn
                                                            .substr(
                                                                0,
                                                                4);
                                                        var month = value.checkIn
                                                            .substr(
                                                                5,
                                                                2);
                                                        var day = value.checkIn
                                                            .substr(
                                                                8,
                                                                2);
                                                        var date = new Date(
                                                            year,
                                                            month,
                                                            day);
                                                        date
                                                            .setMonth(date
                                                                .getMonth() - 1);
                                                        str += '<div class="col-md-3" style="margin-bottom: 10px"><img style="width:30px; height:30px" src="http://13.209.99.134:8080/imgserver/resources/img/userphoto/' + value.userPhoto + '" alt="" />'
                                                            +value.userName
                                                            + '('
                                                            + value.userId
                                                            + ') </div> <div class="col-md-4">'
                                                            + value.checkIn
                                                                .substring(
                                                                    0,
                                                                    10)
                                                            + ' ~ '
                                                            + value.checkOut
                                                                .substring(
                                                                    0,
                                                                    10)
                                                            + '</div><div class="col-md-2">'
                                                            + value.price
                                                            +'</div>';
                                                        if (date > today) {
                                                            str += '<div class="col-md-3"><button class="btn" onclick="rescancle('
                                                                + value.reservationNum
                                                                + ','+roomsid+')">예약 취소</button></div>';
                                                        } else {
                                                            str += '<div class="col-md-3"></div>';
                                                        }

                                                    });
                                            $('#myroom' + roomsid)
                                                .html(str);
                                            $('#myroom' + roomsid).css(
                                                'display', 'flex');
                                            $('#mymy' + roomsid).removeAttr("onclick");
                                            $('#mymy' + roomsid).attr("onclick", "closee(" + roomsid + ")")

                                        },
                                        error: function () {
                                            alert(error);
                                        }
                                    });

                            }

                            function closee(roomsid) {
                                $('.dis').css('display', 'none');
                                $('#mymy' + roomsid).removeAttr("onclick");
                                $('#mymy' + roomsid).attr("onclick", "myroomlistselect(" + roomsid + ")")
                            }

                            function rescancle(reservationNum, roomsId) {
                                $
                                    .ajax({
                                        url: '${pageContext.request.contextPath}/hostpage/delreser?Idx='
                                            + reservationNum,
                                        type: 'get',
                                        datatype: 'json',
                                        success: function (data) {
                                            if(data==1){
                                                    myroomlistselect(roomsId);
                                            }
                                        },
                                        error: function () {
                                            alert(error);
                                        }
                                    });
                            }
                        </script>

                    </c:otherwise>
                </c:choose>
            </div>
            <div class="tab-pane fade" id="list-profi" role="tabpanel"
                 aria-labelledby="list-messages-list">
                <div id="llllist" class="row"></div>

                <script>
                    function viewMyroomList() {
                        $('#llllist').html('');
                        str = '<div class="col-md-3"> <div class="card mb-3 box-shadow"> <img class="card-img-top">'
                            + '<div class="card-body"> <img class="card-img-top"> <p class="card-text" style="font-size: 3.0em; text-align: center" ><i class="fas fa-plus"></i> </p>'
                            + ' <div class="d-flex justify-content-between align-items-center"><small class="text-muted">'
                            + '  </small>'
                            + '<div class="btn-group">'
                            + '<a href="${pageContext.request.contextPath}/rooms/registerRooms"><button type="button" class="btn btn-sm btn-outline-secondary ml-1">new</button></a>'
                            + ' </div></div></div></div> </div>';
                        var output = '';
                        // http://fruitdev.tistory.com/174
                        $
                            .ajax({
                                type: 'GET',
                                url: '${pageContext.request.contextPath}/rooms/getRoomsList?page=1&hostId=${loginUser.userId}',
                                dataType: 'JSON',
                                success: function (data) {
                                    console.log(data);

                                    if (data.roomsList.length == 0) {
                                        $('#llllist')
                                            .html(
                                                '<tr><td class="border-top-0 text-center align-middle">해당하는 숙소가 없습니다 \' ㅅ\');;</td></tr>');
                                    } else {
                                        for (i = 0; i < data.roomsList.length; i++) {
                                            output += '<div class="col-md-3">';
                                            output += '<div class="card mb-3 box-shadow">';
                                            output += '<img class="card-img-top">';
                                            output += '<div class="card-body">';
                                            output += '	<p class="card-text">';
                                            output += '		'
                                                + data.roomsList[i].roomsId
                                                + '<br>'
                                                + data.roomsList[i].address
                                                + '<br>';
                                            output += '			'
                                                + data.roomsList[i].price_weekdays
                                                + ' - '
                                                + data.roomsList[i].price_weekend
                                                + '/박';
                                            output += '	</p>';
                                            output += '		<div class="d-flex justify-content-between align-items-center">';
                                            output += '			<small class="text-muted">';
                                            for (j = 0; j < data.reviewSummary.length; j++) {
                                                if (data.roomsList[i].roomsId == data.reviewSummary[j].roomsId) {
                                                    for (k = 0; k <= data.reviewSummary[j].avgScope; k++) {
                                                        output += '★';
                                                    }
                                                    output += ' ('
                                                        + data.reviewSummary[j].reviewCount
                                                        + ')';
                                                }
                                            }
                                            output += '			</small>';
                                            output += '			<div class="btn-group">';
                                            if ('${loginUser.userId}' !== ''
                                                && data.roomsList[i].hostId == '${loginUser.userId}') {
                                                output += '					<a href="${pageContext.request.contextPath}/rooms/modifyRooms?roomsId=';
                                                output += '					'
                                                    + data.roomsList[i].roomsId
                                                    + '&_hostId='
                                                    + data.roomsList[i].hostId
                                                    + '">';
                                                output += '					<button type="button" class="btn btn-sm btn-outline-secondary ml-1">Edit</button></a>';
                                            }
                                            output += '				<a href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId='
                                                + data.roomsList[i].roomsId;
                                            output += '				&hostId='
                                                + data.roomsList[i].hostId
                                                + '">';
                                            output += '				<button type="button" class="btn btn-sm btn-outline-secondary ml-1">View</button></a>';
                                            output += '			</div>';
                                            output += '</div>';
                                            output += '</div>';
                                            output += '</div>';
                                            output += '</div>';
                                        }
                                        if (data.paging.currentPageNo < data.paging.lastPageNo) {
                                            // 출력할 것이 남은 경우
                                            $('#page')
                                                .val(
                                                    data.paging.nextPageNo);
                                        } else {
                                            $('#page').val(-1);
                                        }
                                        str = str + output
                                    }
                                    $('#llllist').html(str);
                                },
                                error: function (error) {
                                    console.log("error : " + error);
                                }
                            });

                    }
                </script>


            </div>
            <div class="tab-pane fade" id="list-profile" role="tabpanel"
                 aria-labelledby="list-profile-list">
                <div class="row" id="evalu">
                    <div class="col-12 row justify-content-center" id="noteval"
                         style="margin-bottom: 70px;"></div>
                    <div class="col-12 row justify-content-center" id="yeseval">
                    </div>

                </div>
                <script>
                    function eval() {

                        $('#noteval').html('');
                        $('#yeseval').html('');
                        var str1 = '';
                        var str2 = '';

                        $
                            .ajax({
                                url: '${pageContext.request.contextPath}/hostpage/eval',
                                type: 'get',
                                datatype: 'json',
                                success: function (data) {
                                    if (data[0].length != 0) {
                                        $(data[0])
                                            .each(
                                                function (key,
                                                          value) {
                                                    str1 += '<div class="col-12 row justify-content-center">'
                                                        + '<div class="col-md-1"  style="margin-bottom: 30px;"><img width="80px" src="http://13.209.99.134:8080/imgserver/resources/img/userphoto/' + value.userPhoto + '"></div>'
                                                        + '<div class="col-md-7">'
                                                        + value.checkIn
                                                            .substr(
                                                                0,
                                                                10)
                                                        + ' ~ '
                                                        + value.checkOut
                                                            .substr(
                                                                0,
                                                                10)
                                                        + '에 '
                                                        + value.roomsId
                                                        + '방을 이용한 사용자 '
                                                        + value.userName
                                                        + '('
                                                        + value.userId
                                                        + ')님을 평가해주세요!</div>'
                                                        + '<div class="col-md-2"><button onclick="writee('
                                                        + value.reservationNum
                                                        + ')">평가하기</button></div>'
                                                        + '  </div>'
                                                });

                                    } else {
                                        str1 += '<p style="text-align: center">평가할 사용자가 없습니다!</p>'
                                    }
                                    if (data[1].length != 0) {

                                        $(data[1])
                                            .each(
                                                function (key,
                                                          value) {
                                                    str2 += '<div class="col-12 row justify-content-center">'
                                                        + '<div class="col-md-1"  style="margin-bottom: 30px;"><img width="80px" src="http://13.209.99.134:8080/imgserver/resources/img/userphoto/' + value.userPhoto + '"></div>'
                                                        + '<div class="col-md-7"><p>['
                                                        + value.reservationNum
                                                        + '] '
                                                        + value.checkIn
                                                            .substr(
                                                                0,
                                                                10)
                                                        + ' ~ '
                                                        + value.checkOut
                                                            .substr(
                                                                0,
                                                                10)
                                                        + '에 '
                                                        + value.roomsId
                                                        + '방을 이용한 사용자 '
                                                        + value.userName
                                                        + '('
                                                        + value.userId
                                                        + ')님을 평가했습니다.</p>'
                                                        + value.evaluationContent
                                                        + '<p style="text-align: right">'
                                                        + value.evaluationDate
                                                            .substr(
                                                                0,
                                                                10)
                                                        + '</p> </div>'
                                                        + '<div class="col-md-2"><button onclick="moddiy('
                                                        + value.reservationNum
                                                        + ')">수정하기</button></div>'
                                                        + '</div>'

                                                });
                                    }
                                    $('#noteval').html(str1);
                                    $('#yeseval').html(str2);
                                },
                                error: function () {
                                    alert(error);
                                }
                            });

                    }

                    function writee(reservationNum) {
                        $('#yeseval').html('');
                        $('#noteval').html('');
                        var str = '<div class="col-12 row justify-content-center"> <div class="col-md-7 form-group"><label for="evalcontent">예약번호 : '
                            + reservationNum
                            + '</label> '
                            + '<textarea class="form-control" rows="10" id="evalcontent"></textarea><input type="button" onclick="inserteval('
                            + reservationNum
                            + ')" class="form-control" value="작성하기"> </div></div>'
                        $('#noteval').html(str);
                    }

                    function moddiy(num) {
                        $('#yeseval').html('');
                        $('#noteval').html('');
                        $
                            .ajax({
                                url: '${pageContext.request.contextPath}/hostpage/eval/select',
                                type: 'post',
                                data: {
                                    reservationNum: num
                                },
                                datatype: 'json',
                                success: function (data) {
                                    $('#yeseval').html('');
                                    $('#noteval').html('');
                                    var str = '<div class="col-12 row justify-content-center"> <div class="col-md-7 form-group"><label for="evalcontent">예약번호 : '
                                        + data.reservationNum
                                        + '</label> '
                                        + '<textarea class="form-control" rows="10" id="evalcontent" >'
                                        + data.evaluationContent
                                        + '</textarea><input type="button" onclick="realmodi('
                                        + data.reservationNum
                                        + ')" class="form-control" value="작성하기"> </div></div>'
                                    $('#noteval').html(str);
                                },
                                error: function () {
                                    alert(error);
                                }
                            });

                    }

                    function realmodi(num) {
                        var msg = $('#evalcontent').val();
                        if (msg != '') {
                            $
                                .ajax({
                                    url: '${pageContext.request.contextPath}/hostpage/eval/modi',
                                    type: 'post',
                                    data: {
                                        reservationNum: num,
                                        evaluationContent: msg
                                    },
                                    datatype: 'json',
                                    success: function (data) {
                                        eval();
                                    },
                                    error: function () {
                                        alert(error);
                                    }
                                });
                        } else {
                            eval();
                        }
                    }

                    function inserteval(num) {
                        var msg = $('#evalcontent').val();
                        if (msg != '') {
                            $
                                .ajax({
                                    url: '${pageContext.request.contextPath}/hostpage/eval/write',
                                    type: 'post',
                                    data: {
                                        reservationNum: num,
                                        evaluationContent: msg
                                    },
                                    datatype: 'json',
                                    success: function (data) {
                                        eval();
                                    },
                                    error: function () {
                                        alert(error);
                                    }
                                });
                        } else {
                            eval();
                        }
                    }
                </script>

            </div>
            <div class="tab-pane fade" id="list-settings" role="tabpanel"
                 aria-labelledby="list-settings-list">
                <div id="withdraw">${loginUser.userId}</div>
                <script>
                    function withdraw() {
                        html = '';
                        $
                            .ajax({
                                /* async: false, */
                                url: '${pageContext.request.contextPath}/reservation/withdraw',
                                type: 'POST',
                                datatype: 'json',
                                data: {
                                    "userId": "${loginUser.userId}"
                                },
                                success: function (data) {
                                    html += '<input id="checkPrice" type="hidden" value = "' + data.point + '"/>'
                                    html += '<h1>인출 가능 금액 : '
                                        + data.point
                                            .toString()
                                            .replace(
                                                /\B(?=(\d{3})+(?!\d))/g,
                                                ",")
                                        + '원</h1><br>';
                                    html += '<h2>인출 금액 : <input style="text-align : right;" id="pricee" type="text" numberonly="true"/><button onclick="maxWithdraw()">인출하기</button></h2><br>';
                                    $('#withdraw').html(html);
                                }
                            });
                    }

                    $(document).on("keyup", "input:text[numberOnly]", function () {
                        $(this).val($(this).val().replace(/[^0-9]/gi, ""));

                        if (Number($('#pricee').val()) > Number($('#checkPrice').val())) {
                            $('#pricee').val($('#checkPrice').val());
                        }
                    });

                    function maxWithdraw() {
                        if ($('#pricee').val() == "") {
                            alert("돈 받기 싫냐? 돈 입력해라~");
                        } else {
                            $('#pricee').val($('#pricee').val().replace(/[^0-9]/gi, ""));
                            $.ajax({
                                async: false,
                                url: '${pageContext.request.contextPath}/reservation/withdrawDo',
                                type: 'GET',
                                data: {
                                    "price": $('#pricee').val(),
                                    "userId": "${loginUser.userId}"
                                },
                                success: function (data) {
                                    if (data == 1) {
                                        alert("성공적으로 인출이 완료되었습니다.");
                                    } else if (data == 0) {
                                        alert("다시 시도 해주세요.")
                                    }
                                }
                            });
                            withdraw();
                        }
                    }

                </script>


                <div class="jus"></div>
            </div>
            <div class="tab-pane fade" id="list-settings2" role="tabpanel"
                 aria-labelledby="list-settings-li">
                <div class="row my-3 justify-content-between">
                    <div class="col-1"></div>
                    <div class="col-4">
                        <h4 id="id11"></h4>
                    </div>
                    <div class="col-2"></div>
                    <div class="col-2">
                        <select class="form-control" id="roomselectlist"
                                onchange="totall()">

                        </select>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div id="stchart" style="visibility: hidden">
                    <div class="row my-2 justify-content-center">
                        <div class="col-md-9 py-1">
                            <h4 id="id22"></h4>
                            <div class="card">
                                <div class="card-body">
                                    <canvas id="chLine"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row py-2 justify-content-center">
                        <div class="col-md-3 py-1">
                            <div class="card">
                                <div class="card-body">
                                    <canvas id="chDonut1"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 py-1">
                            <div class="card">
                                <div class="card-body">
                                    <canvas id="chDonut2"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 py-1">
                            <div class="card">
                                <div class="card-body">
                                    <canvas id="chDonut3"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-9">
                            <p id="id33"></p>

                        </div>

                    </div>
                </div>
                <script>
                    function selectroom() {
                        var str = '<option >방 선택</option>';
                        $
                            .ajax({
                                url: '${pageContext.request.contextPath}/hostpage/getlist',
                                type: 'GET',
                                datatype: 'json',
                                success: function (data) {
                                    $(data)
                                        .each(
                                            function (key, value) {
                                                str += '<option value="' + value + '">'
                                                    + value
                                                    + ' 방</option>'
                                            });
                                    $('#roomselectlist').html(str);
                                }
                            });

                    }

                    function totall() {
                        var impossible = new Array();
                        var counttt = new Array(12);
                        var pricemonth = new Array(12);
                        var datee = new Date();
                        var room = $('#roomselectlist').val();
                        console.log(room)
                        var lastDay1 = (new Date(datee.getFullYear(), datee
                            .getMonth() - 1, 0)).getDate();
                        var lastDay2 = (new Date(datee.getFullYear(), datee
                            .getMonth(), 0)).getDate();
                        var lastDay3 = (new Date(datee.getFullYear(), datee
                            .getMonth() + 1, 0)).getDate();
                        var totalday = 0;
                        var totalprice = 0;
                        var realtotalprice = 0;
                        $('#id11').text('' + room + '방의 매출 통계입니다');
                        $('#id22').text('이번년도 매출');
                        for (var i = 0; i < counttt.length; i++) {
                            counttt[i] = 0;
                            pricemonth[i] = 0;
                        }
                        $
                            .ajax({
                                url: '${pageContext.request.contextPath}/hostpage/getprice',
                                async: false,
                                type: 'GET',
                                datatype: 'json',
                                success: function (data) {
                                    realtotalprice = data;
                                    $
                                        .ajax({
                                            async: false,
                                            url: '${pageContext.request.contextPath}/reservation/possible',
                                            type: 'GET',
                                            datatype: 'json',
                                            data: {
                                                "roomsId": room
                                            },
                                            success: function (data) {
                                                $(data)
                                                    .each(
                                                        function (
                                                            key,
                                                            value) {
                                                            day = value.day;
                                                            inyy = Number(value.checkIn
                                                                .substring(
                                                                    0,
                                                                    4));
                                                            inmm = Number(value.checkIn
                                                                .substring(
                                                                    5,
                                                                    7));
                                                            indd = Number(value.checkIn
                                                                .substring(
                                                                    8,
                                                                    10));
                                                            if (datee
                                                                .getFullYear() == inyy) {
                                                                pricemonth[inmm - 1] = pricemonth[inmm - 1]
                                                                    + value.price;
                                                            }
                                                            totalprice = totalprice
                                                                + value.price;
                                                            if (inmm != 12) {
                                                                for (i = 0; i < day; i++) {
                                                                    impossible
                                                                        .push(new Date(
                                                                            inyy,
                                                                            inmm - 1,
                                                                            indd
                                                                            + i));
                                                                    totalday++;
                                                                }
                                                            } else if (inmm == 12) {
                                                                for (i = 0; i < day; i++) {
                                                                    impossible
                                                                        .push(new Date(
                                                                            inyy + 1,
                                                                            0 - 1,
                                                                            indd
                                                                            + i));
                                                                    totalday++;
                                                                }
                                                            }
                                                        });
                                                $(impossible)
                                                    .each(
                                                        function (
                                                            key,
                                                            value) {
                                                            if (value
                                                                .getFullYear() == datee
                                                                .getFullYear()) {
                                                                counttt[value
                                                                    .getMonth()] = counttt[value
                                                                    .getMonth()] + 1;
                                                            }
                                                        });
                                                lastDay1 = counttt[datee
                                                        .getMonth() - 1]
                                                    / lastDay1
                                                    * 100;
                                                lastDay2 = counttt[datee
                                                        .getMonth()]
                                                    / lastDay2
                                                    * 100;
                                                lastDay3 = counttt[datee
                                                        .getMonth() + 1]
                                                    / lastDay3
                                                    * 100;
                                                $('#id33')
                                                    .html(
                                                        '${sessionScope.loginUser.userName}의 총매출은 '
                                                        + realtotalprice
                                                        + '원 입니다.<br/>'
                                                        + room
                                                        + '번 방의 전체 매출은 '
                                                        + totalprice
                                                        + '원 입니다<br/>'
                                                        + room
                                                        + '번 방의 총 예약일수는 '
                                                        + totalday
                                                        + '일 입니다.');
                                                $('#stchart')
                                                    .css(
                                                        'visibility',
                                                        'visible')
                                            }
                                        });
                                }
                            });
                        /* chart.js chart examples */
                        // chart colors
                        var colors = ['#007bff', '#28a745', '#333333',
                            '#c3e6cb'];
                        /* large line chart */
                        var chLine = document.getElementById("chLine");
                        var chartData = {
                            labels: ["1", "2", "3", "4", "5", "6", "7",
                                "8", "9", "10", "11", "12"],
                            datasets: [{
                                data: [pricemonth[0], pricemonth[1],
                                    pricemonth[2], pricemonth[3],
                                    pricemonth[4], pricemonth[5],
                                    pricemonth[6], pricemonth[7],
                                    pricemonth[8], pricemonth[9],
                                    pricemonth[10], pricemonth[11]],
                                backgroundColor: colors[3],
                                borderColor: colors[1],
                                borderWidth: 4,
                                pointBackgroundColor: colors[1]
                            }]
                        };
                        if (chLine) {
                            new Chart(chLine, {
                                type: 'line',
                                data: chartData,
                                options: {
                                    scales: {
                                        yAxes: [{
                                            ticks: {
                                                beginAtZero: false
                                            }
                                        }]
                                    },
                                    legend: {
                                        display: false
                                    },
                                    responsive: true
                                }
                            });
                        }
                        /* 3 donut charts */
                        var donutOptions = {
                            cutoutPercentage: 85,
                            legend: {
                                position: 'bottom',
                                padding: 5,
                                labels: {
                                    pointStyle: 'circle',
                                    usePointStyle: true
                                }
                            }
                        };
                        // donut 1
                        var chDonutData1 = {
                            labels: [(datee.getMonth()) + '월 예약률'],
                            datasets: [{
                                backgroundColor: colors.slice(2, 3),
                                borderWidth: 0,
                                data: [lastDay1, 100 - lastDay1]
                            }]
                        };
                        var chDonut1 = document.getElementById("chDonut1");
                        if (chDonut1) {
                            new Chart(chDonut1, {
                                type: 'pie',
                                data: chDonutData1,
                                options: donutOptions
                            });
                        }
                        // donut 2
                        var chDonutData2 = {
                            labels: [(datee.getMonth() + 1) + '월 예약률'],
                            datasets: [{
                                backgroundColor: colors.slice(0, 1),
                                borderWidth: 0,
                                data: [lastDay2, 100 - lastDay2]
                            }]
                        };
                        var chDonut2 = document.getElementById("chDonut2");
                        if (chDonut2) {
                            new Chart(chDonut2, {
                                type: 'pie',
                                data: chDonutData2,
                                options: donutOptions
                            });
                        }
                        // donut 3
                        var chDonutData3 = {
                            labels: [(datee.getMonth() + 2) + '월 예약률'],
                            datasets: [{
                                backgroundColor: colors.slice(3, 4),
                                borderWidth: 0,
                                data: [lastDay3, 100 - lastDay3]
                            }]
                        };
                        var chDonut3 = document.getElementById("chDonut3");
                        if (chDonut3) {
                            new Chart(chDonut3, {
                                type: 'pie',
                                data: chDonutData3,
                                options: donutOptions
                            });
                        }
                    }
                </script>
            </div>
        </div>

    </div>
</div>

</body>
<html>