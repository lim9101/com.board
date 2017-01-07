<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin: 0 auto;
 	width:1000px;
}
.noticeList table{
	border-collapse: collapse;
    border-spacing: 0;
	width:900px;
	border-top: 2px solid #BFAD9F;
	border-bottom: 2px solid #BFAD9F;
}
.noticeList table a{
	color:black;
}
.noticeList table th{
	font-weight: normal;
    height: 43px;
    text-align:center;
    background: #f7f6f4;
    border-bottom: 1px solid #E6E2DE;
    font-size: 14px;
    color: #664738;
    text-align: left;
}
.noticeList table td {
	border-bottom: 1px solid #E6E2DE;
	color:#464646;
	font-size: 14px;
	padding-left: 10px;
	height: 32px;
}
.noticeList table tr:HOVER{
	background-color: #F7F6F4;
}
.noticeList table td a:HOVER{
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		공지 글 목록
		<div class="noticeList">
			<table>
				<tr>
					<th width="10%">글번호</th>
					<th width="45%">제목</th>
					<th width="5%">첨부</th>
					<th width="15%">작성자</th>
					<th width="10%">조회수</th>
					<th width="15%">등록일</th>
				</tr>
				<c:forEach items="${pList}" var="dto">
					<tr>
						<td>${dto.pNo }</td>
						<td><a href="#">${dto.title }</a></td>
						<td>
						<c:if test="${!empty dto.attFile.file_name}">
							<img src="images/file.png" width="15"/>
						</c:if>
						</td>
						<td>${dto.user.userId}</td>
						<td>${dto.count }</td>
						<td>${dto.date_in }</td>
					</tr>
				</c:forEach>
			</table>
		</div><!-- end noticeList -->

	</div>
</body>
</html>