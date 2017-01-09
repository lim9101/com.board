<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

</style>

<title>글-상세보기</title>
</head>
<body>
<div class="container">
	<table border=1>
		<tr>
			<th>작성자</th><td>${dto.user.userName}</td>
			<th>조회수</th><td>${dto.count}</td>
			<th>등록일</th><td>${dto.date_in}</td>
		</tr>
		<tr>
			<td>${dto.content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${!empty dto.attFile.file_name}">
					<a href="filedownload?spNo=${dto.spNo}&pNo=${dto.pNo}">${fn:substringAfter(dto.attFile.file_name,"_")}</a>
				</c:if>
				<c:if test="${empty dto.attFile.file_name}">
					파일없음
				</c:if>
			</td>
		</tr>
		<tr>
			<td><a href="postAdd?pNo=${dto.pNo}">답변쓰기</a>
				<a href="postList">목록</a>
			</td>
		</tr>
	</table>
	
</div><!-- end container -->
</body>
</html>