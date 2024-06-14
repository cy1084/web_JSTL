<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.min.edu.dto.ScoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 초간단 설명</title>
</head>
<body>
	<fieldset>
		<legend>JSTL(Java Standard Tag Library)</legend>
		<div>
			객체의 길이: ${fn:length(lists)}<br>
			<!-- ${lists.size()}처럼 script와 섞어 써도 문제 없음 -->
			객체의 0번을 출력: ${lists[0]}<br> 
		</div>
		<table border="1">
			<thead>
				<tr>
				 	<td>연번</td>
				 	<td>이름</td>
				 	<td>국어</td>
				 	<td>영어</td>
				 	<td>수학</td>
				 
				 	<td>총점</td>
				 	<td>평균</td>
				 	<td>등급</td>
				</tr>
			</thead>
			<tbody>
				<!-- 전달받은 객체의 이름을 바꿔서 사용 set -->
				<!-- lists란 애는 infos란 이름으로 불림 -->
				<c:set var="infos" value="${lists}"/>
				<!--1) <c: set var="size" value="{fn:length(lists)}" 위에 이렇게 선언해놓고, 아래에 -->
				
				<c:forEach var="d" items="${infos}" varStatus="vs">
				<!-- 향상된 for문 -->
					<tr>
					<td>${fn:length(lists)-vs.index}, ${vs.index}, ${vs.count}</td>
					<!--2) ${size}-vs.index 도 가능 -->
						<td>
						<c:if test="${d.name eq '피카1'}">
							<c.out value="첫번째 피카"/>
							${d.name }
						</c:if>
						
						<c:choose>
							<c:when test="${d.name eq '피카3'}">
								${d.name }님 반갑습니다
							</c:when>
							<c:when test="${d.name eq '피카7'}">
								${d.name }님 환영합니다
							</c:when>
							<c:otherwise>
								누구???
							</c:otherwise>
						</c:choose>
					</td>
						
						<td>${d.kor}</td>
						<td>${d.eng}</td>
						<td>${d.math}</td>
						
						<c:set var="total" value="${d.kor+d.eng+d.math}"/>
						<td>${total}</td>
						<td>${total/3}</td>
						<td>${total>200?"합격":"과락"}</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<hr>
		
		<!-- index for문 연습 -->
		<!-- 그냥 for문 -->
		<c:forEach var="i" begin="1" end="9" step="1">
			${i}
		</c:forEach>
		
		<br>
		
		<!-- fmt 형 변환/ 날짜의 형태가 String이거나 혹은 Date 타입으로 되어 있다면 이를 변환-->
		<!-- 입력에서 변환 parse: 문자열의 값을 특정 타입으로 변경 -->
		<!-- 출력에서 변환 format: 문자열로 출력 -->
		
		<fmt:formatDate value="<%=new Date()%>" pattern="yyyy년도 MM월 dd일 hh:mm:ss"/>
		<!-- date 타입을 문자열로 -->
		
		<br>
		<fmt:parseDate var="convertDate" value="2024-06-14 10:14:00" pattern="yyyy-MM-dd hh:mm:ss"/>
		<!-- 문자열을 date 타입으로 -->
		<fmt:formatDate value="${convertDate }" pattern="yyyy년도 MM월 dd일"/>
		<!-- 바꾼 것을 다시 포맷! -->
		
	</fieldset>
	
	
	
	<fieldset>
		<legend>scriptlet 문법으로 작성해보자</legend>
		<div>
			<%
			Object obj = request.getAttribute("lists");
			List<ScoreDto> o = (List<ScoreDto>) obj; //다운캐스팅 
			for (ScoreDto dto : o) {
			%>
			<%=o%><br>
			<%
			}
			%>
		</div>
	</fieldset>

</body>
</html>