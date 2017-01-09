<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/resources/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/resources/js/messages_ko.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".idFindBtn").on("click",function(){
		 var formData = $("form").serialize();
		$.ajax({
			method:"POST",
			url:"findId",
			data:formData,
			success:function(user){
				if(user.userId==''){
					alert("동일정보의 회원이 없습니다. 회원가입하세요.");
				}else{
					alert("당신의 id는"+user.userId+"입니다.");
					window.open("","idFind","");
					window.close();
				}
			}
		});
		
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<form>
<h1>ID 찾기</h1>
		 <div>
		 <label for="userName">이름:<input class="userName" name="userName"></label>
		 질문 선택<br>
		 <select name="pwQa" class="pwQa">
			    <option value="" selected="selected">질문선택</option>
			    <option value="나의 좌우명은?">나의 좌우명은?</option>
			    <option value="가장 기억에 남는 장소는?">가장 기억에 남는 장소는?</option>
			    <option value="가장 좋아하는 스포츠종목은?">가장 좋아하는 스포츠종목은?</option>
		</select>
		<label for="pwAs">답변:<input class="pwAs" name="pwAs"></label><br>
		 <label for="phone">PHONE:<input class="phone" name="phone"></label>
		 </div>
		 <div>
			<button type="button" class="btn btn-primary btn-mg idFindBtn" >idFind</button>
			<button type="button" class="btn btn-primary btn-mg cansel">cansel</button>
		 </div>
</form>
</body>
</html>