<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 문법 정리</title>
<!--

	scriptlet이란?
	jsp에서 html과 javascript 영역을 구분하는 tag이다
	<% %>: java의 문법을 작성하는 영역 - scriptlet
	<%! %>: java의 메소드를 작성하는 영역 - declaration
	<%=1 %>: java의 값을 화면에 출력해주는 영역 - expression

 -->

</head>
<%!//declaration 선언, 자바의 문법 선언 영역
	int x = 0;

	public int val() {
		return x;
	}%>
<%
//scriptlet 연산 문법 작성 영역
int y = 0;
request.setAttribute("yy", y);
request.setAttribute("xx", val());
%>

<body>
	<fieldset>
		<legend>scriptlet의 구성요소에 따른 메모리의 사용 영역</legend>
		<p>
			declaration: <%=x++%><br>
			scriptlet: <%=y++%><br>
		</p>
		<p>
		<!-- script 방식의 문법 -->
			declaration에서 담은 scope 값:<%=request.getAttribute("xx")%>
			scriptlet에서 담은 scope 값:<%=request.getAttribute("yy")%>
			<br>
			<br>
		<!-- el을 통한 문법(el은 자동으로 scope를 호출) -->
			declaration에서 담은 scope 값: ${xx}, ${requestScope.xx}<br> 
			scriptlet에서 담은 scope 값:${yy} <br>
		</p>
	</fieldset>
	
	<h1>EL(Expression Language) 설명</h1>
	<fieldset>
		<legend>EL란?</legend>
			<ul>
				<li>scope(page,request,session,application) 객체를 자동으로 호출</li>
				<li>scope를 호출할 때 name이 없다면 null 반환<br>하지만 EL에서는 ""를 반환</li>
			</ul>
			<div>
				scriptlet의 처리 방식: request.getAttribute("age")<%=request.getAttribute("age")%><br> <!-- null -->
				EL의 처리 방식: ${age}<br> <!-- 값 안나옴 -->
			</div>
	</fieldset>
	<table border="1">
		<col width="300px">
		<col width="500px">
		<thead>
			<tr>
				<th>EL문법</th>
				<th>결과</th>
			</tr>
		</thead>
		<tbody>
			<tr>	
				<td>\${1+10}</td>
				<td>${1+10}</td>
			</tr>
			<tr>	
				<td>\${"A"=="A"}</td>
				<td>${"A"=="A"}</td>
			</tr>
			<tr>	
				<td>\${"A" eq "A"}</td> <!-- equals -->
				<td>${"A" eq "A"}</td>
			</tr>
<!-- 			<tr>	 -->
<!-- 				<td>\${"A" ne "A"}</td>not equal -->
<%-- 				<td>${"A" ne "A"}</td> --%>
<!-- 			</tr> -->
			<tr>	
				<td>\${10/3}</td>
				<td>${10/3}</td>
			</tr>
			<tr>	
				<td>\${10 mod 3}</td>
				<td>${10 mod 3}</td>
			</tr>
			<tr>	
				<td>\${empty "" }</td>
				<td>${empty "" }</td>
			</tr>
			<tr>	
				<td>\${empty null}</td>
				<td>${empty null}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>