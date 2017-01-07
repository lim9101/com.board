<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".checkBtn").on("click",function(){
		/* opener.document.all.userPw.value=document.all.userPw.value; */
		/* if(opener.document.all.checkPoint.value == 1){
		}else if(opener.document.all.checkPoint.value == 2){
		}else if(opener.document.all.checkPoint.value == 3){
		}else{} */
		var user={
				userPw:$("#userPw").val()
		}
		$.ajax({
			url:"check",
			data:user,
			success:function(result){
				console.log(result);
				$(opener.document).find("input[name=checkPoint]").val("true");
				opener.checkfunction();
				 window.open("","check","");
					window.close();
			}
		});
	
	})
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>개인정보 CHECK</h1>
	<label for="userPw">비밀번호:<input type="password" id="userPw" name="userPw"/></label>
	<button type="submit" class="checkBtn">확인</button>
</body>
</html>