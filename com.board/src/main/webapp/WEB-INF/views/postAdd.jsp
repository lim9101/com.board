<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
var fileCheck =1;
var delFile =	function (fileDel){
	$(fileDel).parent().remove();
	fileCheck--;
}

function listClick(){
	if(confirm("목록으로 이동하시겠습니까?")==true){
		location.href="postList";				
	}else{
		return;
	}
}

$(document).ready(function() {
		var chk=1;
		
		$('.postAddBtn').bind('click', function() {
			
			if($('[name=title]').val().length > 30){
				alert("제목은 30자까지 가능합니다.");
				return false;
			}
			if($('[name=title]').val()==''){
				alert("제목을 입력하세요");
				return false;
			}
			if($('[name=content]').val().length > 1000){
				alert("내용은 1000자까지 가능합니다.");
				return false;
			}
			var formData = new FormData($("#frmWR")[0]);
			formData.set("content",CKEDITOR.instances.content.getData());
			$.ajax({
				method: "post",
				url: "postAdd",
				data: formData,
				processData: false,
				contentType: false,
				success: function(result){
					if(result){
						location.href="postList";
					}else{
						alert("이미지파일이 아닙니다.");
					}
				},
				error: function(){
					console.log("업로드 실패");
				}
			}); 
		});
		
		//첨부파일 용량체크, 이미지 체크 
		$('#filepath').on('change',function(){
			var str=$('#filepath').val();
			var patt=/(.jpg$|.gif$|.png$)/ig;
			var result=str.match(patt);
			if(!result){
				alert('jpg, gif, png만 가능합니다.');
				$('#filepath').val("");
				return false;
			}

			if(this.files && this.files[0]){
			
				if(this.files[0].size>1000000000){
					alert("1GB바이트 이하만 첨부할 수 있습니다.");
					$('#filepath').val("");
					return false;
				}
				//파일을 읽기 위한 FileReader객체 생성
				var reader = new FileReader();
				//file내용을 읽어 dataURL형식의 문자열로 저장
				reader.readAsDataURL(this.files[0]);
				//파일을 읽어 들이기를 성공했을 때 호출되는 이벤트 핸들러
				reader.onload=function(e){
				//이미지 Tag의 src속성에 읽어들인 File내용을 지정
				$('img').attr('src',e.target.result);	
				}
			}
		});
		
		$('.fileAdd').bind('click',function(){
			if(fileCheck==0 || fileCheck<3){
				str="<div><input type='file' id='filepath' name='upload' class='form-control upload' /><button type='button'"
					+" onclick='delFile(this)' class='fileDel'>X</button></div>";
					$('.tdAddFile').append(str);
					fileCheck++
			}else{
				alert("파일추가는 3개까지만 가능합니다.");
				return false;
			}
		});
})
</script>
<style type="text/css">
.container{
	margin: 0 auto;
 	width:700px;
}
.noticeAdd table{
	border-collapse: collapse;
    border-spacing: 0;
	width:700px;
	border-top: 2px solid #BFAD9F;
	border-bottom: 2px solid #BFAD9F;
}
.noticeAdd table th{
	font-weight: normal;
    height: 43px;
    padding-left:15px;
    text-align:center;
    background: #f7f6f4;
    border-bottom: 1px solid #E6E2DE;
    font-size: 14px;
    color: #664738;
    text-align: left;
}
.noticeAdd table td.tdStyle {
	border-bottom: 1px solid #E6E2DE;
	color:#464646;
	font-size: 14px;
	padding-left: 10px;
	height: 32px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" role="form" id="frmWR" name="frmWR"
		method="post" enctype= multipart/form-data>
		<div class="noticeAdd">
		<h1>글쓰기</h1>
		<table>
			<c:if test="${user.userId=='admin'}">
				<tr>
					<th><label for="kind">공지</label></th>
					<td><input type="checkbox" value="1" name="kind"></td>
				</tr>
			</c:if>
			<tr>
				<th><label for="title"><c:if test="${!empty dto}">답변&nbsp;</c:if>제목</label></th>
				<td class="tdStyle"><input type="text" name="title" id="title" size="50"/></td>
			</tr>
			<tr>
				<th><label for="user_id">작성자</label></th>
				<td class="tdStyle"><input type="text" name="user_id" id="user_id" value="${user.userId}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="content" class="ckeditor" name="content" cols="97" rows="20"></textarea>
				<script> CKEDITOR.replace('ckeditor'); </script>
				</td>
			</tr>
			<tr>
				<th><label for="upload">첨부파일 <button type="button" class="fileAdd">+</button></label></th>
				<td class="tdStyle tdAddFile"><div><input type="file" id="filepath" name="upload" class="form-control upload" placeholder="upload" /><button type='button' onclick="delFile(this)" class="fileDel">X</button></div></td>
			</tr>
		</table>
		
		</div><!-- end noticeAdd -->
		<div class="Btn">
			<button type="button" class="postAddBtn">글쓰기</button>
			<button type="button" onclick="listClick()">목록</button>
			<c:if test="${!empty dto.pNo }">
				<input type="hidden" name="pNo" value="${dto.pNo }"/>
				<input type="hidden" name="spNo" value="${dto.spNo }"/>
				<input type="hidden" name="depth" value="${dto.depth }"/>
				<input type="hidden" name="plevel" value="${dto.plevel }"/>
			</c:if>
		</div><!-- end Btn -->
		</form>
	</div><!-- end container -->
		
</body>
</html>