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
			$('#frmWR').attr('action', 'postAdd').submit();
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
			<tr>
				<th><label for="title">제목</label></th>
				<td class="tdStyle"><input type="text" name="title" id="title" size="50"/></td>
			</tr>
			<tr>
				<th><label for="user_id">작성자</label></th>
				<td class="tdStyle"><input type="text" name="user_id" id="user_id" value="duri" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="content" name="content" cols="97" rows="20"></textarea></td>
			</tr>
			<tr>
				<th><label for="upload">첨부파일</label></th>
				<td class="tdStyle"><input type="file" id="upload" name="upload" class="form-control upload" placeholder="upload" /></td>
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