<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".pwChangeBtn").on("click",function(){
		var formData = $("form").serialize();
		if($("input[name='userPw']").val() == $("input[name='userRePw']").val()){
			$.ajax({
				method:"POST",
				url:"updateUser",
				data:formData,
				success:function(result){
					if(result){
						alert("비밀번호가 변경되었습니다.");
						 window.open("","rePw","");
							window.close();
					}else{
						alert("실패");
					}
				}
			});
		}else{
			alert("두 비밀번호가 일치하지 않습니다.");
		}
	
	})
});
</script>
<title>Insert title here</title>
</head>
<body>
<h1>비밀 번호 재설정</h1>
<form>
<label for="userPw" ><input type="password" name="userPw"></label>
<label for="userRePw"><input type="password" name="userRePw"></label>
<button type="button" class="pwChangeBtn">변경</button>
<button type="button" class="cnasel">취소</button>
</form>
</body>
</html>