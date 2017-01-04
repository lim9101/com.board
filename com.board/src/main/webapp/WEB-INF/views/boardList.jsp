<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(".boardListTable").empty();
$.ajax({
	url:"postList",
	success:function(list){
		var tr=$("<tr></tr>");
		$(list).each(function(list,post){
			/* 
			$(products).each(function(idx,product){
				div = $('<div class="productInfo" onClick="productDetail(this)">');
				img = $('<img src="<c:url value="/upload/'+product.picture+'"/>" width="100%" height="200px"></img>');
				productName =$("<div id='name'>"+"[P"+product.productNum+"]"+product.productName+"</div>");
				price = $('<div id="price">'+product.price+'</div></div>');
				$("form").append(div.append(img).append(productName).append(price));
				div.data("product",product);
			}); */
			
			var board=$("<td>"+"<input>"+post.pNo+"</input>"+"</td><td>"+post.title+
					"</td><td>"+post.date_in+"</td><td>"+post.date_up+"</td>");
			$(".boardListTable").append(tr.append(board));
		});
	}
});
$(document).ready(function(){
	$(".postAddBtn").on("click",function(){
		location.href='postAdd';
	})
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;LIST</h1>
<div class="container">
	<div>
	<table class="table table-bordered table-condensed table-striped nanum">
		<thead>
			<tr>
				<td>postNO</td>
				<td>post</td>
				<td>date-in</td>
				<td>update</td>
			</tr>
		</thead>
		<tbody class="boardListTable">
			
		</tbody>
	</table>
	</div>
	<div>
	<button type="button" class="btn btn-default postAddBtn" >글쓰기</button>
	</div>
	<div>
	<p>&nbsp;&nbsp; 1|2|3|4|5|6|7| &nbsp;&nbsp;</p>
	</div>
</div>
</body>
</html>