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
var checkfunction = function(){
	if($("input[name=checkPoint]").val!=null){
		location.href="userUpdate";			
	}else{}
	console.log(false);
}
$(document).ready(function(){
	$(".updateBtn").on("click",function(){
			var popUrl = "userCheck";	//팝업창에 출력될 페이지 URL
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			var infoWindow = window.open(popUrl,"check",popOption);
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
		<P>PW:<input type="password" class="pw" name="userPw"/></P>
		<P>NAME:<input type="text" class="name" value="${user.userName}" readonly="readonly"/></P>
		<P>EMAIL:<input type="email" class="email" value="${user.email}" readonly="readonly"/></P>
		<P>PHONE:<input type="tel" class="phone" value="${user.phone}" readonly="readonly"/></P>
		 
		 <c:if test='${user.gender eq "남"}'>
		  <P>GENDER: 남<input type="radio" name="gender" value="남"  checked="checked"/> 여<input type="radio" name="gender" value="여"/></P>
		 </c:if>
		 <c:if test='${user.gender eq "여"}'>
		 <P>GENDER: 남<input type="radio" name="gender" value="남"/> 여<input type="radio" name="gender" value="여"  checked="checked"/></P>
		 </c:if>
		 <div class="form-group">
		 	<div class="form-inline">
			<input type="text" class="postcodify_postcode5 form-control addNo" value="${user.addNo}" placeholder="우편번호" readonly="readonly"/>
			</div>
			<div class="form-inline">
			<input type="text" class="postcodify_address form-control addD" value="${user.addD}" placeholder="주소" readonly="readonly"/>
			</div>
		</div>
		 <P><button type="button" class="btn btn-primary btn-mg updateBtn" value="update">update</button>
		   <button type="button" class="btn btn-primary btn-mg canselBtn" value="cansel">cansel</button>
		   <input type="hidden" name="checkPoint">
		</P>
	</form>
</div>
</body>
</html>