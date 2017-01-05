<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>회원 정보</h1>
	<div>
		<P>ID:<input type="text" class="id" readonly="readonly"/></P>
		<P>PW:<input type="password" class="pw"/></P>
		<P>NAME:<input type="text" class="name" readonly="readonly"/></P>
		<P>EMAIL:<input type="email" class="email"/></P>
		<P>PHONE:<input type="tel" class="phone"/></P>
		 <P>GENDER: 남<input type="radio" name="gender" value="남"/> 여<input type="radio" name="gender" value="여"/></P>
		 <div class="form-group">
		 	<div class="form-inline">
			<input type="text" class="postcodify_postcode5 form-control addNo" value="" placeholder="우편번호" readonly="readonly"/>
			<button type="button" class="form-control  btn btn-primary" id="findAddress">주소검색</button>
			</div>
			<div class="form-inline">
			<input type="text" class="postcodify_address form-control addD" value="" placeholder="주소"/>
			</div>
		</div>
		
		 <P><button type="button" class="btn btn-primary btn-mg signIn" value="signIn">signIN</button>
		   <button type="button" class="btn btn-primary btn-mg" value="cansel">cansel</button>
		</P>
	</div>
</div>
</body>
</html>