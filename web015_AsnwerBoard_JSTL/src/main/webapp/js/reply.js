window.onload = function(){
	document.forms[0].onsubmit=function(event){
		console.log("서브밋 버튼 작동")
		var chkContent = document.getElementById("chkContent").value;
		if(chkContent == "y"){
			alert("답글 내용을 필수 입력입니다");
			event.preventDefault();
		}
	}
	
	document.getElementById("txtArea").onclick=function(){
		console.log("textarea 클릭");
		var obj1 = document.getElementById("hiddenContent").value; //원본글
		var obj2 = document.getElementById("txtArea").value; //작성글
		
		var obj3 = obj2.replace("원본글>","");
		
		if(obj1 == obj3){
			document.getElementById("txtArea").value="";
			document.getElementById("contxt").innerHTML="내용";
			document.getElementById("chkContent").value="n";
		}
	}
	
	document.querySelector("input[type=reset]").onclick=function(){
		document.getElementById("contxt").innerHTML="내용<br>(원본)";
		document.getElementById("chkContent").value="y";
	}
	
}







