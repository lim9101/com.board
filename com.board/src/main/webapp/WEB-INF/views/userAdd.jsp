<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".signIn").on("click",function(){
		var user = {
				userId:$(".id").val(),
				userPw:$(".pw").val(),
				userName:$(".name").val(),
				email:$(".email").val(),
				phone:$(".phone").val(),
				gender:$("input[name='gender']").val(),
				addNo:$(".addNo").val(),
				addD:$(".addD").val()+$(".addD2").val()
				
		}
		$.ajax({
			url:"signIn",
			data:user,
			success:function(result){
				if(result){ 
					alert("가입성공");
					location.href="postList";
				}else alert("가입 실패")
			}
		});
		
	})
	
	$("#findAddress").postcodifyPopUp();

});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>회원 가입</h1>
	<div>
		<P>ID:<input type="text" class="id"/></P>
		<P>PW:<input type="password" class="pw"/></P>
		<P>NAME:<input type="text" class="name"/></P>
		<P>EMAIL:<input type="email" class="email"/></P>
		<P>PHONE:<input type="tel" class="phone"/></P>
		 <P>GENDER: 남<input type="radio" name="gender" value="남"/> 여<input type="radio" name="gender" value="여"/></P>
		 <div class="form-group">
		 	<div class="form-inline">
			<input type="text" class="postcodify_postcode5 form-control addNo" value="" placeholder="우편번호" disabled/>
			<button type="button" class="form-control  btn btn-primary" id="findAddress">주소검색</button>
			</div>
			<div class="form-inline">
			<input type="text" class="postcodify_address form-control addD" value="" placeholder="주소"/>
			<input type="text" name="" class="postcodify_details form-control addD2" value="" placeholder="상세주소"/>
			</div>
		</div>
		
		 <P><button type="button" class="btn btn-primary btn-mg signIn" value="signIn">signIN</button>
		   <button type="button" class="btn btn-primary btn-mg" value="cansel">cansel</button>
		</P>
	</div>
</div>
</body>
</html>