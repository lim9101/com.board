<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>달팽이 보드-관리자 페이지</title>
<link href="images/control.css" id="test" rel="stylesheet" type="text/css" />
<script type="text/javascript">
// <![CDATA[

// 업로드 파일 지정
function uploadForm(obj){

	var ele=document.getElementById("upload_form");
	var fEle=document.createElement("INPUT");

	fEle.type='file';
	fEle.name='upload_form[]';
	fEle.onchange=function(){

		uploadForm(this);		

	}

	ele.appendChild(fEle);
	obj.style.display='none';
	setList(ele);

}

// 업로드 대기 중인 파일 리스트를 가져온다.
function setList(ele){

	this.getFileName=function(str){

		var segment=str.split('\\');
		var len=segment.length;

		return segment[(len-1)];

	}

	// 파일리스트 초기화
	var sEle=document.getElementById("files_list");
	var len=sEle.length;
	for(var i=0 ; i < len ; i++){ sEle[i]=null; }	// 한번에 다 없어지지 않으므로 두번실행

	// 업로드 폼과 업로드 파일들을 읽어온다.
	var uEle=ele.getElementsByTagName('INPUT');
	var len=uEle.length;

	for(var i=0 ; i < len ; i++){

		if(uEle[i].value=='') continue;

		var text=this.getFileName(uEle[i].value);
		var value=uEle[i].value;

		sEle[i]=new Option(text, value);

	}

}

// select 폼의 파일을 선택하면 이미지 미리보기를 할수 있다.
function chooseThis(obj){

	var ele=document.getElementById("display");
	var str=obj.value;

	ele.src=str;

}

// 파일리스트에 있는 파일 항목을 제거한다.
function deleteFile(){

	var ele=document.getElementById('files_list');

	// get file list
	var uForm=document.getElementById('upload_form');
	var uEle=uForm.getElementsByTagName('INPUT');
	var len=uEle.length;

	for(var i=0 ; i < len ; i++){

		if(!uEle[i]) continue;
		if(uEle[i].value==ele.value) uForm.removeChild(uEle[i]);

	}

	setList(uForm);

}

// ]]>
</script>
</head>

<body>

	<form name="Qform" id="Qform" method="post" enctype="multipart/form-data" action="index.php" >

		<table>
			<tr>
				<td colspan="2">
					<div id="upload_form">
						<input type="file" name="upload_form[]" onchange="uploadForm(this)" />
					</div>
				</td>
			</tr>
			<tr>
				<td><img src="test.gif" id="display" width="100" alt="선택된 이미지" /></td>
				<td>
					<select name="files_list" id="files_list" size="5" onclick="chooseThis(this)" style="width:200px;"><option></option></select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span><input type="button" value="삭제" onclick="deleteFile()" /></span>
					<span><input type="submit" value="전송" /></span>
				</td>
			</tr>
		</table>

	</form>

</body>
</html>