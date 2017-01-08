<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.postAddBtn').bind('click', function() {
			$('#frmWR').attr('action', 'postWrite').submit();
		});
	})
</script>
<style type="text/css">
h1 {
	margin-left: 10%;
}

form {
	margin-right: 25%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form class="form-horizontal" role="form" id="frmWR" name="frmWR"
		method="post" action="postWrite">
		<div class="form-group PostLabel">
			<label for="title" class="col-sm-2 control-label">Title</label>
			<div class="col-sm-10">
				<input type="text" id="title" name="title"
					class="form-control title" placeholder="title" />
			</div>
			<label for="inputEmail3" class="col-sm-2 control-label">User</label>
			<div class="col-sm-10">
				<input type="text" id="user_id" name="user_id"
					class="form-control user_id" value="duri" readonly="readonly" />
			</div>
		</div>

		<div class="form-group">
			<label for="content" class="col-sm-2 control-label">Content</label>
			<div class="col-sm-10">
				<textarea id="content" name="content" class="form-control content"
					cols="10" rows="10"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">file</label>
			<input type="file" id="file_name" name="file_name" class="form-control file_name" placeholder="file_name" />
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default postAddBtn">글쓰기</button>
				<button type="submit" class="btn btn-default">취소</button>
			</div>
		</div>
	</form>
</body>
</html>