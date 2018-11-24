<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>


</script>
</head>
<body>
	<%@ include file="/resources/common/includeHead.jsp"%>
	<%@ include file="/resources/common/Navbar.jsp"%>

	<c:if test="${regFail ne null}">
		<script>alert("회원가입 실패. 다시 시도해주세요.");</script>
		<c:remove var="regFail" scope="session"/>
	</c:if>

	<div id="userRegForm">
		<!-- Begin page content -->
		<div role="main" class="hyeon-container">
			<div class="row justify-content-md-center">
				<div class="col col-md-5 col-lg-4">
					<c:if test="${InvalidBirth ne null}">
						<div id="dateAlert" style="color:red;">생년월일을 정확하게 입력해주세요.</div> <br>
							<script>
								$(document).ready(function(){
									$('#dateAlert').fadeOut(5000);
								});
							</script>
						<c:remove var="InvalidBirth" scope="session"/>
					</c:if>
				<div class="hyeon-title"><h2>회원가입</h2></div>
				
					<form method="post" id="regform2" enctype="multipart/form-data">
					
						<span style="font-size: 11px">인증메일이 발송되오니 확인 가능한 이메일 주소를 입력 바랍니다.</span>
						<input type="email" id="inputUserId" name="userId" class="form-control hyeon-reg-input" style="margin-top: 5px;" placeholder="이메일 주소" />
						<div id="alertId" class="regAlert" style="display:none; color: #dc3545;"></div >
						<input type="hidden" id="fail-id" name="fail-id" />
						<input type="password" id="userPw-1" name="userPw" class="form-control hyeon-reg-input" placeholder="비밀번호 설정" />
						<div id="alertPw" class="regAlert" style="display:none; color: #dc3545;"></div >
						<input type="password" id="userPw-2" class="form-control hyeon-reg-input" placeholder="비밀번호 확인" />
						<div id="chkPw" class="regAlert" style="display:none; color: #dc3545;"></div >
						<input type="hidden" id="fail-pw-1" class="form-control hyeon-reg-input" name="fail-pw-1"/>
						<input type="hidden" id="fail-pw-2" class="form-control hyeon-reg-input" name="fail-pw-2"/>
						<!-- <input type="hidden" id="fail-pw" name="fail-pw" /> -->
						
						<input type="text" id="inputUserName" name="userName" class="form-control hyeon-reg-input" placeholder="이름" />
						<div id="chkName" class="regAlert" style="display:none; color: #dc3545;"></div >
						<label class="form-check-label mt-2 mb-2" style="font-weight: bold;">사진 </label>
						<input type="file" name="photoFile" class="form-control hyeon-reg-input" style="margin-top:3px;" />
						<input type="hidden" name="host" value=0 style="display:none" />
						<input type="hidden" name="admin" value=0 style="display:none" />
						<!-- <input type="hidden" name="userKey" value="asd123" style="display:none" /> -->
						<input type="hidden" name="userCheck" value=1 style="display:none" />
						<input type="hidden" name="point" value=0 style="display:none" />
						<input type="hidden" name="disabled" value=1 style="display:none" />
						<input type="hidden" name="userPhoto" id="userPhoto" />
						<div>
						<label class="form-check-label mt-2 mb-2" style="font-weight: bold;">생일</label>
						<p style="font-size: 0.9em">회원 가입을 하시려면 만 18세 이상이어야 합니다. <br>
						생일은 다른 회원에게는 공개되지 않습니다.</p>
						</div>
						<div>
						<select name="month" class="hyeon-form-control hyeon-left">
					 		<option value="">월</option>
								<c:forEach begin="1" end="12" var="month" >
									<option>${month}</option>
								</c:forEach>
						</select>
						
						<select name="day" class="hyeon-form-control">
					 		<option value="">일</option>
								<c:forEach begin="1" end="31" var="day" >
									<option>${day}</option>
								</c:forEach>
						</select>
						
						<select id="select-year" name="year" class="hyeon-form-control hyeon-right">
					    	<option value="">년도</option>

      						    <c:set var="today" value="<%=new java.util.Date()%>" />

          						<fmt:formatDate value="${today}" pattern="yyyy" var="nowYear"/> 

         						<c:forEach begin="0" end="120" var="i">

           							<option><c:out value="${nowYear - i}" /></option>

          						</c:forEach>

						</select>
						</div>
						<div> 
							<textarea name="userInfo" class="form-control hyeon-reg-input" cols="30" placeholder="자기소개"></textarea>
						</div>
						<input class="btn btn-lg btn-danger btn-block" id="regbtn2" type="button" style="margin-bottom: 20px" value="회원가입" />
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		// 아이디 입력란에 포커스 주기
		$(document).ready(function(){
			$('#regbtn2').val('회원가입');
			$('#inputUserId').focus();
		});
		
		// 비밀번호 유효성 검사
		$('#userPw-1').blur(function checkPassword(){
				$('#alertPw').empty();
				$('#alertPw').css("display","none");
				$('#fail-pw-1').val('fail');
				
			var checkNumber = $('#userPw-1').val().search(/[0-9]/g);
			var checkEnglish = $('#userPw-1').val().search(/[a-z]/ig);
			var userIdPart = $('#inputUserId').val().split('@');

			if(!/^[a-zA-Z0-9]{8,15}$/.test($('#userPw-1').val())){
				$('#alertPw').css("display","");
				$('#alertPw').append("숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.");
			} else if (checkNumber <0 || checkEnglish <0){
				$('#alertPw').css("display","");
				$('#alertPw').append("숫자와 영문자를 혼용하여야 합니다.");
			} else if (/(\w)\1\1\1/.test($('#userPw-1').val())){
				$('#alertPw').css("display","");
				$('#alertPw').append("같은 문자를 4번 이상 연속하여 사용하실 수 없습니다.");
			} else if ($('#inputUserId').val() != '' && $('#inputUserId').val() != null){
				if($('#userPw-1').val().search(userIdPart[0]) > -1){
					$('#alertPw').css("display","");
					$('#alertPw').append("비밀번호에 아이디가 포함될 수 없습니다.");
				}else{
					$('#fail-pw-1').val('ok');
					/* alert($('#fail-pw-1').val()); */
				}
			} else {
				$('#fail-pw-1').val('ok');
				/* alert($('#fail-pw-1').val()); */
			}
			/* 이 무접점하고는 느낌이 조금 다른데 이 느낌이 더 좋은거 같네..?? */
		});

		/* $('#userPw-1').blur(function(){
			if(!checkPassword($('#inputUserId').val(), $('#userPw-2').val())){
				$('#alertPw').text('fail');
			} else {
				$('#fail-pw').text('');
				$('#fail-pw').val('');
			}
		}); */

		 // 비밀번호 두개가 일치하는지 검사
		 $('#userPw-2').blur(function(){
			if($('#userPw-1').val() != $('#userPw-2').val()){
				$('#chkPw').empty();
				$('#chkPw').css("display","");
				$('#chkPw').append("비밀번호를 다시 한 번 확인해주세요.");
				$('#fail-pw-2').val('fail');
			} else {
				$('#chkPw').empty();
				$('#chkPw').css("display","none");
				$('#fail-pw-2').val('ok');
			}
		});
		
		// 이름 입력했는지 검사
		$('#inputUserName').blur(function(){
			if($('#inputUserName').val() == null ||$('#inputUserName').val() == ''){
				$('#chkName').empty();
				$('#chkName').css("display","");
				$('#chkName').append("이름을 입력해주세요");
			} else {
				$('#chkName').empty();
				$('#chkName').css("display","none");
			}
		});
		
		// 아이디가 비밀번호와 겹치거나 아이디가 중복인지 확인
		$('#inputUserId').blur(function(){
			var userId = $('#inputUserId').val();
			
			if(userId != null && userId != ''){
				if($('#userPw-1').val().search($('#inputUserId').val()) > -1){
					$('#alertPw').css("display","");
					$('#alertPw').empty();
					$('#alertPw').append("비밀번호에 아이디가 포함되었습니다.");
					return false;
				}
			}
			
			if(userId != '' && userId != null){
				$.ajax({
				type: "GET",
				url: "userIdChk",
				data: {"userId" : userId},
				success: function(data){
					if(data == "n") {
						$('#alertId').empty();
						$('#alertId').css("display","");
						$('#alertId').append("이미 탈퇴처리된 아이디이거나 사용중인 아이디입니다.");
					} else if(data == "d"){
						$('#alertId').empty();
						$('#alertId').css("display","");
						$('#alertId').append("이미 탈퇴처리된 아이디는 사용이 불가합니다.");
					} else if(data == "y"){
						$('#alertId').empty();
						$('#alertId').css("display","none");
					}
				}
			});
		}
	});

        $(function() {
            $("#regbtn2")
                .click(

                    function() {
                    	$('#regbtn2').val('인증메일을 보내는중...');
                        console.log('gg');
                        var form = $('#regform2')[0];
                        var formData = new FormData(form);
                        $
                            .ajax({
                                url : 'http://13.209.99.134:8080/imgserver/upload/userPhoto',
                                processData : false,
                                contentType : false,
                                datatype : 'JSON',
                                data : formData,
                                type : 'POST',
                                success : function(
                                    result) {
                                    if(result==''){
                                        result='nopic.jpg'
									}
                                    $('#userPhoto')
                                        .val(
                                            ''
                                            + result);
                                    $('#regform2')
                                        .submit();
                                }
                            });
                    });
        });


	</script>
	

</body>
</html>