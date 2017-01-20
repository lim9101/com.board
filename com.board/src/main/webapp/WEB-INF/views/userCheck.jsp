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
		var user={
				userPw:$("#userPw").val()
		}
		$.ajax({
			url:"check",
			data:user,
			success:function(result){
				console.log(result);
				if(result){
					opener.checkfunction(result,"userUpdate");
					 window.open("","check","");
						window.close();

				}else{
					alert("비밀번호가 같지 않습니다.");
				}
				
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