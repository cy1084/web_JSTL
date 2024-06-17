<%@page import="com.min.edu.dto.ScoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scope 출력 예시</title>
</head>
<body>

<%
	// scriptlet으로 전달 값을 사용해본다
	
	ScoreDto v1 = (ScoreDto) request.getAttribute("dto");
	ScoreDto v2 = (ScoreDto) session.getAttribute("dto");
	ScoreDto v3 = (ScoreDto) application.getAttribute("dto");
	%>
	<fieldset>
		<legend>scope 출력</legend>
		<ul>
			<li><%=v1%></li>
			<li><%=v2%></li>
			<li><%=v3.getName()%></li>
		</ul>
	</fieldset>
</body>
</html>