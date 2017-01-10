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
$(document).ready(function(){
	$(".updateBtn").on("click",function(){
		 var formData = $("form").serialize();
		$.ajax({
			method:"POST",
			url:"updateUser",
			data:formData,
			success:function(result){
				console.log(result);
				if(result){
					alert("정보수정 성공");
					location.href="postList";
				}else{
					alert("정보수정 실패");
				}
				
			}
		});
	});
	
	$(".findAddress").postcodifyPopUp();

});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>회원 정보 수정</h1>
	<form>
		<P>ID:<input type="text" class="id" name="userId" value="${user.userId}" readonly="readonly"/></P>
		<P>NAME:<input type="text" class="name" name="userName" value="${user.userName}" readonly="readonly"/></P>
		<P>EMAIL:<input type="email" class="email" name="email" value="${user.email}"/></P>
		<P>PHONE:<input type="tel" class="phone" name="phone" value="${user.phone}"/></P>
		 
		 <c:if test='${user.gender eq "남"}'>
		  <P>GENDER: 남<input type="radio" name="gender" value="남"  checked="checked"/> 여<input type="radio" name="gender" value="여"/></P>
		 </c:if>
		 <c:if test='${user.gender eq "여"}'>
		 <P>GENDER: 남<input type="radio" name="gender" value="남"/> 여<input type="radio" name="gender" value="여" checked="checked"/></P>
		 </c:if>
		  비밀번호 찾기
		 <div>
		 질문 선택<br>
		 <select name="pwQa" class="pwQa">
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
		<label for="pwAs">답변:<input class="pwAs" name="pwAs" value="${user.pwAs}"></label>
		 </div>
		 <div class="form-group">
		 	<div class="form-inline">
			<input type="text" class="postcodify_postcode5 form-control addNo" name="addNo" value="${user.addNo}" placeholder="우편번호" readonly="readonly"/>
			<button type="button" class="form-control  btn btn-primary findAddress">주소검색</button>
			</div>
			<div class="form-inline">
			<input type="text" class="postcodify_address form-control addD" name="addD" value="${user.addD}" placeholder="주소"/>
			</div>	
		</div>
		
		 <P>
		 <button type="button" class="btn btn-primary btn-mg updateBtn">update</button>
	     <button type="button" class="btn btn-primary btn-mg">cansel</button>
		</P>
	</form>
</div>
</body>
</html>