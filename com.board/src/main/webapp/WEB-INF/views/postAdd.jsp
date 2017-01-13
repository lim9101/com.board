<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.postAddBtn').bind('click', function() {
			
			if($('[name=title]').val()==''){
				alert("제목을 입력하세요");
				return false;
			}
			$('[name=content]').val(
					$('[name=content]').val().replace(/\n/gi, '<br/>'));
			
			$('#frmWR').attr('action', 'postAdd').submit();
		});
		
		//첨부파일 용량체크, 이미지 체크 
		$('#filepath').on('change',function(){
			var str=$('#filepath').val();
			var patt=/(.jpg$|.gif$)/ig;
			var result=str.match(patt);
			if(!result){
				alert('jpg, gif만 가능합니다.');
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
		method="post" action="postWrite" enctype= multipart/form-data>
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
				<th><label for="title">제목</label></th>
				<td class="tdStyle"><input type="text" name="title" id="title" size="50"/></td>
			</tr>
			<tr>
				<th><label for="user_id">작성자</label></th>
				<td class="tdStyle"><input type="text" name="user_id" id="user_id" value="${user.userId}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="content" name="content" cols="97" rows="20"></textarea></td>
			</tr>
			<tr>
				<th><label for="upload">첨부파일</label></th>
				<td class="tdStyle"><input type="file" id="filepath" name="upload" class="form-control upload" placeholder="upload" /></td>
			</tr>
		</table>
		
		</div><!-- end noticeAdd -->
		<div class="Btn">
			<c:if test="${!empty dto}">
				<button class="postAddBtn">답변쓰기</button>
			</c:if>
			<button type="submit" class="postAddBtn">글쓰기</button>
			<a href="postList">목록</a>
			<button type="submit" class="btn btn-default">취소</button>
			<c:if test="${!empty dto.pNo }">
				<input type="text" name="pNo" value="${dto.pNo }"/>
				<input type="text" name="spNo" value="${dto.spNo }"/>
				<input type="text" name="depth" value="${dto.depth }"/>
				<input type="text" name="plevel" value="${dto.plevel }"/>
			</c:if>
		</div><!-- end Btn -->
		</form>
	</div><!-- end container -->
		
</body>
</html>