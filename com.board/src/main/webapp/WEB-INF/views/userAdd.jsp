<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.11.1.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
var check=0;
var signInValidate = function(form){
	form.validate({
		rules:{
			userId:{
				required:true,
				minlength:6,
				maxlength:15
			},
			userPw:{
				required:true,
				minlength:6,
				maxlength:20
			},
			userPwCheck:{
				equalTo : $(".pw")
			},
			email:{
				required:true,
				email:true,
				
			},
			phone:{
				required:true,
				digits:true
			},
			address:{
				required:true
			}
		},
		 messages : {
             userId: {
                 required : "필수로입력하세요",
                 minlength:"최소{0}자로 입력하세요.",
 				maxlength:"최대{0}자로 입력하세요."
               
             },
             userPw: {
                 required : "필수로입력하세요",
                 minlength:"최소{0}자로 입력하세요.",
  				maxlength:"최대{0}자로 입력하세요."
                 
             },
             userPwCheck: {
                 required : "필수로입력하세요",
                 equalTo : "비밀번호가 같지않습니다."
                 
             },
			email:{
				required:"필수로 입력하세요.",
				email:"이메일 형식에 마추어 입력하세요.",
				
			},
			phone:{
				required:"필수로 입력해주세요.",
				digits:"숫자만 입력하세요."
			},
			address:{
				required:"필수로 입력해주세요."
			}
         }
	});
	return form.valid();
};
if(signInValidate($("form"))){
	 
}

$(document).ready(function(){
	
	$('.chkIdBtn').on("click",function(){
		check=1;
		
		var chkId=/^[a-z0-9]{5,15}$/g;
		if(!chkId.test($(".id").val())){
			$(".id").focus();
			alert("소문자,숫자 포함 길이는 5~15까지 가능합니다.");
			return;
		}
		
		$.ajax({
			url:"checkId",
			data:{userId:$(".id").val()},
			success:function(result){
				if(result){
					alert("사용가능한 아이디입니다.");
				}else{
					check=0;
					$(".id").val('');
					$(".id").focus();
					alert("이미 사용중인 아이디입니다.");
				}
			}
		});
	});
	
	$(".signIn").on("click",function(){
		if(check==0){
			alert("ID 중복체크 하세요");
			return;
		}
		if(signInValidate($("form"))){
			var user = {
					userId:$(".id").val(),
					userPw:$(".pw").val(),
					userName:$(".name").val(),
					email:$(".email").val(),
					phone:$(".phone").val(),
					gender:$("input[name='gender']").val(),
					addNo:$(".addNo").val(),
					addD:$(".addD").val()+$(".addD2").val(),
					pwQa:$(".pwQa").val(),
					pwAs:$(".pwAs").val()
					
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
		}
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
		<P>ID:<input type="text" class="id" name="userId"/> <span><button type="button" class="chkIdBtn">중복체크</button></span><span class="checkIdInfo"></span></P>
		<P>PW:<input type="password" class="pw"/></P>
		<P>NAME:<input type="text" class="name"/></P>
		<P>EMAIL:<input type="email" class="email"/></P>
		<P>PHONE:<input type="tel" class="phone"/></P>
	<form onsubmit="return false">
		<P>ID:<input type="text" class="id" name="userId" /></P>
		<P>PW:<input type="password" class="pw" name="userPw" /></P>
		<p>pwCheck:<input type="password" class="pwCheck" name="userPwCheck" /></P>
		<P>NAME:<input type="text" class="name" name="userName"/></P>
		<P>EMAIL:<input type="email" class="email" name="email" /></P>
		<P>PHONE:<input type="tel" class="phone" name="phone" /></P>
		 <P>GENDER: 남<input type="radio" name="gender" value="남"/> 여<input type="radio" name="gender" value="여"/></P>
		비밀번호 찾기
		 <div>
		 질문 선택<br>
		 <select name="pwQa" class="pwQa" name="pwQa" >
			    <option value="" selected="selected">질문선택</option>
			    <option value="좌우명">나의 좌우명은?</option>
			    <option value="장소">가장 기억에 남는 장소는?</option>
			    <option value="스포츠">가장 좋아하는 스포츠종목은?</option>
		</select>
		<label for="pwAs">답변:<input class="pwAs" name="pwAs" ></label>
		 </div>
		 <div class="form-group">
		 	<div class="form-inline">
			<input type="text" class="postcodify_postcode5 form-control addNo" value="" placeholder="우편번호" disabled/>
			<button type="button" class="form-control  btn btn-primary" id="findAddress">주소검색</button>
			</div>
			<div class="form-inline">
			<input type="text" class="postcodify_address form-control addD" value="" placeholder="주소"/>
			<input type="text" name="address" class="postcodify_details form-control addD2" value="" placeholder="상세주소"/>
			</div>
		</div>
		
		 <P><button type="submit" class="btn btn-primary btn-mg signIn" value="signIn">signIN</button>
		   <button type="button" class="btn btn-primary btn-mg" value="cansel">cansel</button>
		</P>
	</form>
</div>
</body>
</html>