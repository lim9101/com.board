<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
var checkfunction = function(result){
	if(result){
		location.href="userUpdate";			
	}else{
	}
}
$(document).ready(function(){
	$(".canselBtn").on("click",function(){
		location.href="postList";
	});
	$(".updateBtn").on("click",function(){
		  var winWidth = 370;
		 var winHeight = 360;
		 var winURL = "userCheck";
		 var winName = "check";
		 var winPosLeft = (screen.width - winWidth) / 2;
		 var winPosTop = (screen.height - winHeight) / 2;
		 var winOpt = "width="+winWidth+",height="+winHeight+",top="+winPosTop+",left="+winPosLeft;
		 window.open(winURL, winName, winOpt + ",menubar=no,status=no,scrollbars=no,resizable=no"); 
	})
	var openPopup = function(url,width,height){
		
	}
	$(".userDelBtn").on("click",function(){
		location.href="userDel";
	})
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>회원 정보</h1>
	<form>
		<P>ID:<input type="text" class="id" value="${user.userId}" readonly="readonly"/></P>
		<P>PW:<input type="password" class="pw" name="userPw" readonly="readonly"/></P>
		<P>NAME:<input type="text" class="name" value="${user.userName}" readonly="readonly"/></P>
		<P>EMAIL:<input type="email" class="email" value="${user.email}" readonly="readonly"/></P>
		<P>PHONE:<input type="tel" class="phone" value="${user.phone}" readonly="readonly"/></P>
		 
		 <c:if test='${user.gender eq "남"}'>
		  <P>GENDER: 남<input type="radio" name="gender" value="남"  checked="checked"/> 여<input type="radio" name="gender" value="여"/></P>
		 </c:if>
		 <c:if test='${user.gender eq "여"}'>
		 <P>GENDER: 남<input type="radio" name="gender" value="남"/> 여<input type="radio" name="gender" value="여"  checked="checked"/></P>
		 </c:if>
		<%--  비밀번호 찾기
		 <div>
		 질문 선택<br>
		 <select name="pwQa" class="pwQa" disabled="disabled">
			 <c:choose>
				<c:when test="${user.pwQa eq '좌우명'}">
				    <option value="">질문선택</option>
				    <option value="좌우명" selected="selected">나의 좌우명은?</option>
				    <option value="장소">가장 기억에 남는 장소는?</option>
				    <option value="스포츠">가장 좋아하는 스포츠종목은?</option>
				</c:when>
				<c:when test="${user.pwQa eq '장소'}">
				    <option value="" >질문선택</option>
				    <option value="좌우명">나의 좌우명은?</option>
				    <option value="장소" selected="selected">가장 기억에 남는 장소는?</option>
				    <option value="스포츠">가장 좋아하는 스포츠종목은?</option>
				</c:when>
				<c:when test="${user.pwQa eq '스포츠'}">
				    <option value="" >질문선택</option>
				    <option value="좌우명">나의 좌우명은?</option>
				    <option value="장소">가장 기억에 남는 장소는?</option>
				    <option value="스포츠" selected="selected">가장 좋아하는 스포츠종목은?</option>
				</c:when>
				</c:choose>
		</select>
		<label for="pwAs">답변:<input class="pwAs" name="pwAs" value="${user.pwAs}" readonly="readonly"></label>
		 </div> --%>
		 <div class="form-group">
		 	<div class="form-inline">
			<input type="text" class="postcodify_postcode5 form-control addNo" value="${user.addNo}" placeholder="우편번호" readonly="readonly"/>
			</div>
			<div class="form-inline">
			<input type="text" class="postcodify_address form-control addD" value="${user.addD}" placeholder="주소" readonly="readonly"/>
			</div>
		</div>
		 <P><button type="button" class="btn btn-primary btn-mg updateBtn" value="update">정보수정</button>
			<button type="button" class="btn btn-primary btn-mg userDelBtn" value="userDel">회원탈퇴</button>
		   <button type="button" class="btn btn-primary btn-mg canselBtn" value="cansel">취소</button>
		   <input type="hidden" name="checkPoint">
		</P>
	</form>
</div>
</body>
</html>