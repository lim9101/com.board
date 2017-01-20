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
	if($(".comentContent").val().length > 200){
		alert("200자까지 가능합니다.");
		return;
	}
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
			pNo:"${pdto.pNo}",
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
			comentView(null);
		}
	});
}

var canselArea = function(){
	comentView(null);
}

var comentList=function(coment){
	var div = $("<div class='replyDiv' style='border:1px solid black;padding-left:7px;border-width:2px 1px; width:510px; height: auto; line-height:35px; position:relative'></div><br>");
	var dateIn= $("<span>"+"입력날짜:"+coment.dateIn+"</span>&nbsp;&nbsp;<span>"+"수정날짜:"+coment.dateUp+"<span><br>");
	if(coment.dateUp == null){
		dateIn= $("<span>"+coment.userId+"</span>  <span>"+"입력날짜:"+coment.dateIn+"</span>&nbsp;&nbsp;<span>"+"수정날짜:"+""+"<span><br>");
	}else{
	}
	var adminContent=$("<span>"+coment.content+"</span>"+
			"<span><button type='button' onclick='comentDel(this)' value='"+coment.cNo+"'>삭제</button></span><br>");
	var contentUser=$("<span>"+coment.content+"</span>"+
	"<span><button type='button' onclick='comentRepleArea(this)' value='"+coment.cNo+"'>댓글</button>"+
	"<button type='button' onclick='updateArea(this)' value='"+coment.cNo+"'>수정</button>"+
	"<button type='button' onclick='comentDel(this)' value='"+coment.cNo+"'>삭제</button></span><br>");
	var reContentUser=$("<span>"+coment.content+"</span>"+
			"<span><button type='button' onclick='updateArea(this)' value='"+coment.cNo+"'>수정</button>"+
			"<button type='button' onclick='comentDel(this)' value='"+coment.cNo+"'>삭제</button></span><br>");
	var content=$("<span>"+coment.content+"</span><br>");
	var reContent=$("<span>"+coment.content+"<button type='button' onclick='comentRepleArea(this)' value='"+coment.cNo+"'>댓글</button>"+"</span><br>");
	
	if(coment.userId == "${user.userId}"){
		if(coment.scNo == coment.cNo){
			div.append(dateIn);
			div.append(contentUser);
			$(".comentLine").append(div);
		}else{
			div.css("margin-left","200px");
			div.append(dateIn);
			div.append(reContentUser);
			$(".comentLine").append(div);
		}
	}else if("${user.userId}" == "admin"){
		if(coment.scNo == coment.cNo){
			div.append(dateIn);
			div.append(adminContent);
			$(".comentLine").append(div);
		}else{
			div.css("margin-left","200px");
			div.append(dateIn);
			div.append(adminContent);
			$(".comentLine").append(div);
		}
	}else{
		if(coment.scNo == coment.cNo){
			div.append(dateIn);
			div.append(reContent);
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
					pNo:"${pdto.pNo}"
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


function updateClick(){
	if(confirm("수정하시겠습니까?")==true){
		location.href="postUpdate?pNo=${pdto.pNo}";
	}else{
		return;
	}
}	

function deleteClick(){
	if(confirm("삭제하시겠습니까?")==true){
		location.href="postDelete?pNo=${pdto.pNo}&spNo=${pdto.spNo}&depth=${pdto.depth}&fileNo="+$('.fileNo').val()+"&plevel=${pdto.plevel}";
	}else{
		return;
	}
}
$(document).ready(function(){
	
	$('[name=content]').val($('[name=content]').val().trim());
	$('[name=content]').val($('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));
	$(".comentAddBtn").on("click",function(){
		var scNo = 0;
		var coment= {
				scNo:scNo,
				pNo:"${pdto.pNo}",
				userId:"${user.userId}",
				content:$(".comentContent").val()
		}
		comentAdd(coment);
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.comentHiden {
	cursor: pointer;
}

.container {
	margin: 0 auto;
	width: 700px;
}

.view table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 700px;
	border-top: 2px solid #BFAD9F;
	border-bottom: 2px solid #BFAD9F;
}

.view table th {
	font-weight: normal;
	height: 43px;
	text-align: center;
	background: #f7f6f4;
	border-bottom: 1px solid #E6E2DE;
	font-size: 14px;
	color: #664738;
	text-align: center;
}

.view table td {
	border-bottom: 1px solid #E6E2DE;
	color: #464646;
	font-size: 14px;
	padding-left: 10px;
	height: 32px;
	word-break: break-all;
}

.replyDiv {
	word-break: break-all;
}
</style>
<title>글-상세보기</title>
</head>
<body>
<div class="container" style="position:relative">
	<div class="view">
	<h1>
	<c:if test="${pdto.kind==1}">공지</c:if>
	글 보기</h1>
		<table>
			<tr>
				<th>작성자</th><td>${pdto.user.userId}</td>
				<th>조회수</th><td>${pdto.count}</td>
				<th>등록일</th><td>${pdto.date_in}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5">
					${pdto.title }
				</td>
			</tr>
			<tr>
				<td colspan="6">${pdto.content}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="5">
				<c:forEach items="${adto}" var="dto">
					<a href="fileDownLoad?file_no=${dto.file_no}&pNo=${pdto.pNo}">${fn:substringAfter(dto.file_name,"_")}</a>
				</c:forEach>

				</td>
			</tr>
		</table>
	</div><!-- end view -->
	<div class="btn">
		<c:if test="${pdto.kind ==0}">
			<c:if test="${pdto.plevel <3}">
				<a href="postAdd?pNo=${pdto.pNo}"><button>답변쓰기</button></a>
			</c:if>
		</c:if>
				
					<c:if test="${pdto.user_id eq user.userId || user.userId eq 'admin'}">
					<button onclick="updateClick()" type="button">수정</button>
					</c:if>			
				<c:choose>
					<c:when test="${!empty adto}">
						<c:forEach items="${adto}" var="dto">
							<c:set var="fileNo" value="${dto.file_no}"/>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:set var="fileNo" value="0"/>
					</c:otherwise>
					</c:choose>
					<input type="hidden" class="fileNo" value="${fileNo}"/>
					<c:choose>
					<c:when test="${pdto.user_id eq user.userId || user.userId eq 'admin' }">
					<button onclick="deleteClick()" type="button">삭제</button>
					</c:when>
				</c:choose>
				<a href="postList"><button>목록</button></a>
	</div>
	<div><a class="comentHiden" onclick="comentsHiden()"></a></div>
	<div class="comentLine" style="display:none; position:relative">
	
	</div>
		<div><textarea id="content" class="comentContent" name="content" cols="77" rows="5"></textarea><br><button type="button" class="comentAddBtn">댓글</button></div>
</div><!-- end container -->
</html>