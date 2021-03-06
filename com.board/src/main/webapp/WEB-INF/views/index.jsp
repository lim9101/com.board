<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
var sessionCheck = function(){
	var session = "${user}";
	if(session != ""){
		console.log(session);
		 location.href="postList"; 
	}
}
sessionCheck();
$(document).ready(function(){
	$(".login").on("click",function(){
		var user = {
				userId:$(".id").val(),
				userPw:$(".pw").val()
		}
		$.ajax({
			url:'check',
			data:user,
			success:function(result){
				if(result){
				location.href='postList';
				}else{
					alert("로그인실패");
				}
			}
		});
	});
	
	$(".cansel").on("click",function(){
		location.href='#';
	});
	
	$(".signIn").on("click",function(){
		location.href='userAdd';
	});
	
	$(".idFind").on("click",function(){
		openPopup("idFind","idFind",370,360);
	});
	
	$(".pwFind").on("click",function(){
		openPopup("pwFind","pwFind",370,360);
	});
	
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>Board login</h1>
	<div>
		ID:<input type="text" class="id"/>
		PW:<input type="password" class="pw"/>
		   <button type="button" class="btn btn-primary btn-mg login" value="login">login</button>
		   <button type="button" class="btn btn-primary btn-mg cansel" value="cansel">cansel</button>
	</div>
			<button type="button" class="btn btn-primary btn-mg signIn" value="signIn">signIN</button>
			<button type="button" class="btn btn-primary btn-mg idFind" value="idFind">idFind</button>
			<button type="button" class="btn btn-primary btn-mg pwFind" value="pwFind">pwFind</button>
</div>
</body>
</html>