<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".userDel").on("click",function(){
		var user ={
				userPw:$("input[name='userPw']").val()
		}
		$.ajax({
			url:"delUser",
			method:"POST",
			data:user,
			success:function(result){
				if(result){
					location.href="index";
				}else{
					alert("비밀번호가 다릅니다.");
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
	<form action="delUser" method="post">
	<label for="userPw">비밀번호 입력:<input type="password" name="userPw" /></label>
	<button type="button" class="userDel">삭제</button>
	</form>
</body>
</html>