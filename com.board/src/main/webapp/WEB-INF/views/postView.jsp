<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var temp=false;
var comentsHiden = function(){
	temp = !temp;
	if(temp){
		$(".comentLine").css("display","block");
	}else{
	$(".comentLine").css("display","none");
}
}

var comentAdd =function(coment){
	
	if($(".comentContent").val()==""){
		alert("내용을 입력하세요.");
	}else{
		$.ajax({
			method:"POST",
			url:"comentAdd",
			data:coment,
			success:function(result){
				comentView(coment);
				$(".comentContent").val("");
			}
		});
	}
	
}
var updateArea = function(cNo){
	$(cNo).parent().parent().empty().append($("<textarea id='content'"+
			" class='comentContent' name='content' cols='65' rows='6'>"+
			"</textarea><span style='position:relative; top:-64px;right:-4px'><button type='button'  style='display:inline' onclick='updateComent(this)' class='updateBtn' value='"+$(cNo).val()+"'>댓글수정</button><button type='button'  style='position:relative; right:-450px' onclick='canselArea()' class='canselBtn'>취소</button></span>"));
}

var comentRepleArea = function(cNo){
	$(cNo).parent().parent().empty().append($("<textarea id='content'"+
			" class='comentContent' name='content' cols='65' rows='6'>"+
			"</textarea><span style='position:relative; top:-64px;right:-4px'><button type='button'  style='display:inline' onclick='repleComent(this)' class='comentRepleAddBtn' value='"+$(cNo).val()+"'>댓글입력</button><button type='button'  style='position:relative; right:-450px' onclick='canselArea()' class='canselBtn'>취소</button></span>"));
}

var updateComent = function(cNo){
	var coment ={
			cNo:$(cNo).val(),
			content:$(".comentContent").val()
	}
	$.ajax({
		method:"POST",
		url:"updateComent",
		data:coment,
		success:function(result){
			$(".comentLine").empty();
			comentView(coment);
		}
	});
}

var repleComent = function(cNo){
	console.log($(cNo).val());
	var coment= {
			scNo:$(cNo).val(),
			pNo:"${dto.pNo}",
			userId:"${user.userId}",
			content:$(".comentContent").val()
	}
	comentAdd(coment);
}

var comentDel = function(cNo){
	var coment ={
			cNo:$(cNo).val()
	}
	$.ajax({
		method:"POST",
		url:"delComent",
		data:coment,
		success:function(result){
			$(".comentLine").empty();
			comentView(coment);
		}
	});
}

var canselArea = function(){
	comentView(null);
}

var comentList=function(coment){
	var div = $("<div class='replyDiv' style='border:1px solid black;border-width:2px 1px; width:510px; height:100px; line-height:35px; position:relative'></div><br>");
	var dateIn= $("<span>"+"입력날짜:"+coment.dateIn+"</span>&nbsp;&nbsp;<span>"+"수정날짜:"+coment.dateUp+"<span><br>");
	if(coment.dateUp == null){
		dateIn= $("<span>"+"입력날짜:"+coment.dateIn+"</span>&nbsp;&nbsp;<span>"+"수정날짜:"+""+"<span><br>");
	}else{
	}
	var contentUser=$("<span>"+coment.userId+"</span> &nbsp; &nbsp; <span>"+coment.content+"</span>"+
	"<span><button type='button' onclick='comentRepleArea(this)' value='"+coment.cNo+"'>댓글</button>"+
	"<button type='button' onclick='updateArea(this)' value='"+coment.cNo+"'>수정</button>"+
	"<button type='button' onclick='comentDel(this)' value='"+coment.cNo+"'>삭제</button></span><br>");
	var content=$("<span>"+coment.userId+"</span> &nbsp; &nbsp; <span>"+coment.content+"</span><br>");
	if(coment.userId == "${user.userId}"){
		if(coment.scNo == coment.cNo){
			div.append(dateIn);
			div.append(contentUser);
			$(".comentLine").append(div);
		}else{
			div.css("margin-left","200px");
			div.append(dateIn);
			div.append(contentUser);
			$(".comentLine").append(div);
		}
	}else{
		if(coment.scNo == coment.cNo){
			div.append(dateIn);
			div.append(content);
			$(".comentLine").append(div);
		}else{
			div.css("margin-left","200px");
			div.append(dateIn);
			div.append(content);
			$(".comentLine").append(div);
		}
		
	}
	
}
	var comentView = function(coment){
	
		if(coment == null){
			var coment ={
					pNo:"${dto.pNo}"
			}
		}
		
	$.ajax({
	url:"getComents",
	data: coment,
	success:function(coments){
		$(".comentHiden").text("댓글"+"("+coments.length+")");
		$(".comentLine").empty();
		$(coments).each(function(idx,coment){
				comentList(coment);
		});
	}
});
}
	comentView(null);

$(document).ready(function(){
	$(".comentAddBtn").on("click",function(){
		var scNo = 0;
		var coment= {
				scNo:scNo,
				pNo:"${dto.pNo}",
				userId:"${user.userId}",
				content:$(".comentContent").val()
		}
		comentAdd(coment);
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.comentHiden{
	cursor: pointer;
}
</style>
<title>글-상세보기</title>
</head>
<body>
<div class="container" style="position:relative">

	<table border=1>
		<tr>
			<th>작성자</th><td>${dto.user.userName}</td>
			<th>조회수</th><td>${dto.count}</td>
			<th>등록일</th><td>${dto.date_in}</td>
		</tr>
		<tr>
			<td>${dto.content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${!empty dto.attFile.file_name}">
					<a href="fileDownLoad?pNo=${dto.pNo}">${fn:substringAfter(dto.attFile.file_name,"_")}</a>
				</c:if>
				<c:if test="${empty dto.attFile.file_name}">
					파일없음
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
			<c:if test="${dto.plevel <3}">
				<a href="postAdd?pNo=${dto.pNo}">답변쓰기</a>
			</c:if>
				<c:choose>
					<c:when test="${dto.user_id eq user.userId }">
					<a href="postUpdate?pNo=${dto.pNo}">수정</a>
					</c:when>
					<c:otherwise>	</c:otherwise>
				</c:choose>
				
				
				
				<c:choose>
					<c:when test="${!empty dto.attFile.file_no}">
						<c:set var="fileNo" value="${dto.attFile.file_no}"/>
					</c:when>
					<c:otherwise>
						<c:set var="fileNo" value="0"/>
					</c:otherwise>
					</c:choose>
					파일:${fileNo}
					<c:choose>
					<c:when test="${dto.user_id eq user.userId }">
					<a href="postDelete?pNo=${dto.pNo}&spNo=${dto.spNo}&depth=${dto.depth}&fileNo=${fileNo}">삭제</a>
					</c:when>
					<c:otherwise>	</c:otherwise>
				</c:choose>
				
				<a href="postList">목록</a>
			</td>
		</tr>
	</table>
	<div><a class="comentHiden" onclick="comentsHiden()"></a></div>
	<div class="comentLine" style="display:none; position:relative">
	
	</div>
		<div><textarea id="content" class="comentContent" name="content" cols="77" rows="5"></textarea><br><button type="button" class="comentAddBtn">댓글</button></div>
</div><!-- end container -->
</html>