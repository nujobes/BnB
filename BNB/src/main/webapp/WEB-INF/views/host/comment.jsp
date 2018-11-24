<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<script>
var bId = '${viewLink.bId}'; //게시글 번호

 $('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    // commentInsert(insertData); //Insert 함수호출(아래)
    console.log($('#bId').val());
    $.ajax({
        url : '${pageContext.request.contextPath}/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            	console.log(data);
            if(data == 1) {
            	console.log("ajax");
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }, 
        error : function(error){
        	console.log(error);
        	console.log(error.status);
        }
    });
}); 
  
/* $(document).ready(function() {
	$('#commentInsertBtn').click(function() {
		$('#content').val($('#content').val().replace(/\n/g, '<br>'));
		$('#commentInsertForm').submit();
	});
}); 
  */
//댓글 목록 
function commentList(){
    $.ajax({
        url : '${pageContext.request.contextPath}/comment/list',//요청할 url기입
        type : 'get',
       	data : {'bId':bId},//요청시 보낼 파라미터기입 
        success : function(data){ //성공시 행위
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
	console.log($('#bId').val());
    $.ajax({
        url : '${pageContext.request.contextPath}/comment/insert',
        type : 'post',
        //data : insertData,
        success : function(data){
            	console.log(data);
            if(data == 1) {
            	console.log("ajax");
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }, 
        error : function(error){
        	console.log(error);
        	console.log(error.status);
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '${pageContext.request.contextPath}/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bId); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '${pageContext.request.contextPath}/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bId); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>


