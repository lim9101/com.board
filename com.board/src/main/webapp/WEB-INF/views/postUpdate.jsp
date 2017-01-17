<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var fileCheck = "${fn:length(adto)}";
var delFileInput =	function (fileDel){
	$(fileDel).parent().remove();
	fileCheck--;
	
}
var delFile=function(fileNo){
	$.ajax({
		method: "get",
		url: "delFile",
		data: {file_no:$(fileNo).val()},
		success: function(result){
			$(fileNo).parent().parent().remove();
			fileCheck--;
		}
	}); 
}
$(document).ready(function(){
	$('.cancel').bind('click', function(){
		history.go(-1)();
	});
	$('[name=content]').val($('[name=content]').val().trim());
	$('[name=content]').val(
			$('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));

	$('.postUpdateBtn').bind('click',function(){
	/* 	$('#frmU').attr('action', 'postUpdate').submit(); */
	 $('[name=content]').val($('[name=content]').val().replace(/\n/gi, '<br/>'));
		var formData = new FormData($('#frmU')[0]);
		$.ajax({
			method:'post',
			url:'postUpdate',
			data:formData,
			processData: false,
			contentType: false,
			success:function(result){
				if(result){
					location.href="postList";
				}else{
					alert("이미지파일이 아닙니다.");
				}
			}
			
		});
	});
	
	$('.fileAdd').bind('click',function(){
		if(fileCheck==0 || fileCheck<3){
			str="<div><input type='file' id='filepath' name='upload' class='form-control upload' /><button type='button'"
				+" onclick='delFileInput(this)' class='fileDel'>X</button></div>";
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
.noticeUpdate table{
	border-collapse: collapse;
    border-spacing: 0;
	width:700px;
	border-top: 2px solid #BFAD9F;
	border-bottom: 2px solid #BFAD9F;
}
.noticeUpdate table th{
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
.noticeUpdate table td.tdStyle {
	border-bottom: 1px solid #E6E2DE;
	color:#464646;
	font-size: 14px;
	padding-left: 10px;
	height: 32px;
}
.noticeUpdate table td.content{
	border-bottom: 1px solid #E6E2DE;
	height: 350px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<form class="form-horizontal" role="form" id="frmU" name="frmU"
		method="post" action="postUpdate" enctype= multipart/form-data>
		<div class="noticeUpdate">
		<h1>글 수정</h1>
		<table>
			<tr>
				<th><label for="title">제목</label></th>
				<td class="tdStyle"><input type="text" name="title" id="title" size="50" value="${pdto.title }"/></td>
			</tr>
			<tr>
				<th><label for="user_id">작성자</label></th>
				<td class="tdStyle"><input type="text" name="userId" id="userId" value="${pdto.user.userId}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="content" name="content" cols="97" rows="20">${pdto.content }</textarea></td>
			</tr>
			<tr>
				<th><label for="upload">첨부파일</label></th>
				<td class="tdStyle">
					<c:forEach items="${adto}" var="dto">
						<div>${fn:substringAfter(dto.file_name,"_")} <a href="#"><button type="button" onclick="delFile(this)" class="del" value="${dto.file_no}">삭제</button></a><button>수정</button></div>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th><label for="upload">첨부파일 <button type="button" class="fileAdd">+</button></label></th>
				<td class="tdStyle tdAddFile"></td>
			</tr>
		</table>
		</div><!-- end noticeUpdate -->
		<div class="Btn">
			<button type="button" class="postUpdateBtn">수정하기</button>
			<a href="postList"><button type="button">목록</button></a>
			<input type="button" class="cancel" value="취소" />
				<c:choose>
					<c:when test="${!empty adto}">
						<c:forEach items="${adto}" var="dto">
							<input type="hidden" value="${dto.file_no }" name="fileNo"/>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<input type="hidden" value="0" name="fileNo"/>
					</c:otherwise>
				</c:choose>
			
			
			<input type="hidden" value="${pdto.pNo}" name="pNo"/>
			<input type="hidden" value="${pdto.spNo}" name="spNo"/>
			
		</div><!-- end Btn -->
		</form>
	</div><!-- end container -->
</body>
</html>