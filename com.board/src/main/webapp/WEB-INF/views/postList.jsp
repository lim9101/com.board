
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
	$(document).ready(function(){
		$('[name=searchBtn]').bind("click",function(){
			$('form').attr('action','postList');
			$('form').submit();
		});

		$('[name=searchWord]').val('${pv.searchWord}');
		switch('${pv.searchKey}'){
		case 'all':$('[value=all]').prop('selected','selected');
					$('[value=searchWord]').val(''); break;
		case 'title':$('[value=title]').prop('selected','selected');break;
		case 'user_id':$('[value=user_id]').prop('selected','selected');break;
		}
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.container{
	margin: 0 auto;
 	width:1000px;
}
.container .noticeTitel{
	float: left;
}
.container .postAdd{
	float: right;
	margin-right: 70px;
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
	cursor: pointer;
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
.noticeList table tr.noti{
	background: #f7f6f4;
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
	<h1 class="logo"><a href="http://www.nmplus.co.kr/"><img src="images/meun_logo.png"></a></h1>
	<div class="info">${user.userName}님이 로그인하셨습니다.<a href="userInfo">내정보</a><a class="userOut" href="index">로그아웃</a></div>
		<div class="noticeTitel">공지 글 목록</div>
		<div class="postAdd"><a href="postAdd">글쓰기</a></div>
		<div class="search">
			<span>검색:</span>
			<form name="frm" method="post">
		 		<select name="searchKey">
		 		<option value="all">전체</option>
		 		<option value="title">제목</option>
		 		<option value="user_id">작성자</option>
		 		</select>
		 		<input type="text" name="searchWord"/>
		 		<input type="button" name="searchBtn" value="검색"/>
		 	</form>
		</div>
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
					<c:choose>
						<c:when test="${dto.kind==1}">
							<tr class="noti">
						</c:when>
						<c:otherwise>
						<tr>
						</c:otherwise>
					</c:choose>
									
						<td>${dto.pNo }</td>
						<td>
						<c:if test="${dto.depth>0 }">
						<img src="images/level.gif" width="${20*dto.plevel}" height="15" />
						<img src="images/re.gif"></c:if>
						<c:choose>
							<c:when test="${dto.title==null}">
							삭제된 글입니다.
							</c:when>
							<c:otherwise>
							<a href="postView?pNo=${dto.pNo}">
							<c:if test="${dto.kind==1}">
								<img src="images/noti.png" width="30"/>
							</c:if>
							${dto.title }</a>
							</c:otherwise>
						</c:choose>
						</td>
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
		<div class="page">
			<c:if test="${pv.startPage > 1 }">
	  		<span><a href="postList?currentPage=${pv.startPage-pv.blockPage}&searchKey=${pv.searchKey}&searchWord=${pv.searchWord}">이전</a></span>
	  		</c:if>
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<a href="postList?currentPage=${i}&searchKey=${pv.searchKey}&searchWord=${pv.searchWord}">${i}</a>
			</c:forEach>
			<c:if test="${pv.totalPage > pv.endPage }">
	  		<span><a href="postList?currentPage=${pv.startPage+pv.blockPage}&searchKey=${pv.searchKey}&searchWord=${pv.searchWord}">다음</a></span>
	  		</c:if>
		</div>
	</div>
</body>
</html>