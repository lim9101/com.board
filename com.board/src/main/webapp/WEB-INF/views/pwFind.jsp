<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".pwFindBtn").on("click",function(){
		var formData = $("form").serialize();
		$.ajax({
			url:"findPw",
			method:"POST",
			data:formData,
			success:function(result){
				console.log(result)
				if(result){
					location.href="rePw";
				}else{
					alert("회원정보가 다릅니다.");
				}
			}
		});
	})
})
</script>
<title>Insert title here</title>
</head>
<body>
<form>
<h1>비밀번호 찾기</h1>
		 <div>
		 <label for="id">ID:<input class="userId" name="userId"></label>
		<br>선택:
				<select name="pwQa" class="pwQa">
			    <option value="" selected="selected">질문선택</option>
			    <option value="좌우명">나의 좌우명은?</option>
			    <option value="장소">가장 기억에 남는 장소는?</option>
			    <option value="스포츠">가장 좋아하는 스포츠종목은?</option>
		</select>
		<br><label for="pwAs">답변:<input class="pwAs" name="pwAs"></label>
		 </div>
		 <div>
		 	<button type="button" class="btn btn-primary btn-mg pwFindBtn" value="pwFind">pwFind</button>
		 	<button type="button" class="btn btn-primary btn-mg cansel" value="cansel">cansel</button>
		 </div>
</form>
</body>
</html>