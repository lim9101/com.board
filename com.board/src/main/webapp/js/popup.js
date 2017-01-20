var openPopup = function(url,name,width,height){
	 var winPosLeft = (screen.width - width) / 2;
	 var winPosTop = (screen.height - height) / 2;
	 var winOpt = "width="+width+",height="+height+",top="+winPosTop+",left="+winPosLeft;
	 window.open(url, name, winOpt + ",menubar=no,status=no,scrollbars=no,resizable=no"); 
}