<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
		 var winWidth = 370;
		 var winHeight = 360;
		 var winURL = "idFind";
		 var winName = "idFind";
		 var winPosLeft = (screen.width - winWidth) / 2;
		 var winPosTop = (screen.height - winHeight) / 2;
		 var winOpt = "width="+winWidth+",height="+winHeight+",top="+winPosTop+",left="+winPosLeft;
		 window.open(winURL, winName, winOpt + ",menubar=no,status=no,scrollbars=no,resizable=no"); 
	});
	
	$(".pwFind").on("click",function(){
		 var winWidth = 370;
		 var winHeight = 360;
		 var winURL = "pwFind";
		 var winName = "pwFind";
		 var winPosLeft = (screen.width - winWidth) / 2;
		 var winPosTop = (screen.height - winHeight) / 2;
		 var winOpt = "width="+winWidth+",height="+winHeight+",top="+winPosTop+",left="+winPosLeft;
		 window.open(winURL, winName, winOpt + ",menubar=no,status=no,scrollbars=no,resizable=no"); 
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