<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('[name=content]').val($('[name=content]').val().trim());
	$('[name=content]').val(
			$('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));

	$('.postUpdateBtn').bind('click',function(){
		$('#frmU').attr('action', 'postUpdate').submit();
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
				<td class="tdStyle"><input type="text" name="title" id="title" size="50" value="${dto.title }"/></td>
			</tr>
			<tr>
				<th><label for="user_id">작성자</label></th>
				<td class="tdStyle"><input type="text" name="userName" id="userName" value="${dto.user.userName}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="content" name="content" cols="97" rows="20">${dto.content }</textarea></td>
			</tr>
			<tr>
				<th><label for="upload">첨부파일</label></th>
				<td class="tdStyle">${fn:substringAfter(dto.attFile.file_name,"_")}
				<input type="file" id="upload" name="upload"  /></td>
			</tr>
		</table>
		</div><!-- end noticeUpdate -->
		<div class="Btn">
			<button type="submit" class="postUpdateBtn">수정하기</button>
			<a href="postList"><button>목록</button></a>
			<c:choose>
				<c:when test="${!empty dto.attFile.file_no}">
					<input type="hidden" value="${dto.attFile.file_no}" name="fileNo"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" value="0" name="fileNo"/>
				</c:otherwise>
			</c:choose>
			
			<input type="hidden" value="${dto.pNo}" name="pNo"/>
			<input type="hidden" value="${dto.spNo}" name="spNo"/>
		</div><!-- end Btn -->
		</form>
	</div><!-- end container -->
</body>
</html>