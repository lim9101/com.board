<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	$(".comentAddBtn").on("click",function(){
		var coment= {
				pNo:"${dto.pNo}",
				content:$(".comentContent").val()
		};
		console.log(coment);
		 $.ajax({
			method:"POST",
			url:"comentAdd",
			data:coment,
			success:function(result){
				console.log(result);
			}
		});
	});
});
</script>
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
			<td>
			<c:if test="${dto.plevel <3}">
				<a href="postAdd?pNo=${dto.pNo}">답변쓰기</a>
			</c:if>
				<a href="postUpdate?pNo=${dto.pNo}">수정</a>
				
				
				<c:choose>
					<c:when test="${!empty dto.attFile.file_no}">
						<c:set var="fileNo" value="${dto.attFile.file_no}"/>
					</c:when>
					<c:otherwise>
						<c:set var="fileNo" value="0"/>
					</c:otherwise>
					</c:choose>
					파일:${fileNo}
				<a href="postDelete?pNo=${dto.pNo}&spNo=${dto.spNo}&depth=${dto.depth}&fileNo=${fileNo}">삭제</a>
				
				<a href="postList">목록</a>
			</td>
		</tr>
	</table>
	<div><p><a>댓글(3)</a><p></div>
	<div class="comentLine" onclick="">
	<div>
	<div>2017/01/17</div>
	<span>${ user.userId }</span> &nbsp; &nbsp; <span>hello android</span><span><button type="button" >수정</button><button type="button">삭제</button></span>
	</div>
	<div>
	<div>2017/01/17</div>
	<span>${ user.userId }</span> &nbsp; &nbsp; <span>hello android</span><span><button type="button" >수정</button><button type="button">삭제</button></span>
	</div>
	<div>
	<div>2017/01/17</div>
	<span>${ user.userId }</span> &nbsp; &nbsp; <span>hello android</span><span><button type="button" >수정</button><button type="button">삭제</button></span>
	</div>
	</div>
		<div><textarea id="content" class="comentContent" name="content" cols="77" rows="5"></textarea><br><button type="button" class="comentAddBtn">댓글</button></div>
</div><!-- end container -->
</html>