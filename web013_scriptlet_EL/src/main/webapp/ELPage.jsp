<%@page import="com.min.edu.dto.ScoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope 확인(EL)</title>
</head>
<body>
	<!-- 
		ELController에서 request, session, application scope에 같은 이름으로 전달
		scope는 parameter와 다르게 주소 전달이 아닌 객체(Object) 전달! 
	-->
	<%
	// scriptlet으로 전달 값을 사용해본다
	ScoreDto v1 = (ScoreDto) request.getAttribute("dto");
	ScoreDto v2 = (ScoreDto) session.getAttribute("dto");
	ScoreDto v3 = (ScoreDto) application.getAttribute("dto");
	String v4=request.getParameter("query");
	%>
	<fieldset>
		<legend><a href="./ScopeTest.jsp">scope 출력</a></legend>
		<p>
			요청 형태는 key/value 형태로 되어 있다<br>
			주소로 값을 전달하는 것을 queryString이라고 한다
			http://search.naver.com?query=날씨<br>
			query=날씨, 쿼리스트링 => param
		</p>
		<ul>
			<li><%=v1.getName()%></li>
			<li><%=v2.getName()%></li>
			<li><%=v3.getName()%></li>
			<li><%=v4%></li>
		</ul>
		<ol>
			<li>name과 값이 있는 경우: name에 맞는 값을 출력</li>
			<li>name만 있는 경우: ""을 출력</li>
			<li>name이 없는 경우: null을 출력</li>
		</ol>
	</fieldset>
	<fieldset>
		<legend>EL 처리를 통한 scope</legend>
		<p>
			scriptlet 문법은 자바의 문법을 통해 호출하고 casting해서 사용했다<br>
			화면에 출력되는 모든 값은 결국에는 String으로 처리된다<br>
			따라서 EL을 통해 출력되는 방식은 자동으로 scope를 호출할 수 있도록 한다
		</p>
		<ul>
			<li>각 scope는 이름이 같은 경우 page, request, session, application 순으로 검색되어 출력된다</li>
			<li>명확한 scope를 선택하기 위해 prefix를 선언해줘야 한다 (ex. requestScope, sessionScope, applicationScope, param)</li>
		</ul>
		<ol>
			<li>scope 우선순위 / dto 이름의 request 호출: ${dto}</li>
			<li>prefix를 통한 scope 호출- session 호출: ${sessionScope.dto}</li>
			<li>OGML 문법을 통한 get 메소드 호출: ${applicationScope.dto.firstName}/${applicationScope.dto.getFirstName()}</li>
			<li>parameter 호출: ${param.query}</li>
		</ol>
	</fieldset>
	<fieldset>
		<legend>session의 삭제 방법 removeAttribute(), invalidate()</legend>
		<button>session 삭제</button>
		<script type="text/javascript">
			document.querySelector("button").onclick=function(){
				location.href="./sessionRemove.do";
			}
		</script>
	</fieldset>

</body>
</html>