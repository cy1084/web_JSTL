<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.min.edu.dto.AnswerboardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 전체글보기</title>
</head>
<%!
	// JSP에서 java의 메소드를 작성 할 수 있는 영역
	// 날짜 표시 형식을 2024-06-11 14:33:19 을 2024년 06월 11일 : String => Date => String
	
	
%>


<!-- 헤더영역 include -->
<%@ include file="./header.jsp" %>
<body>

<!-- JAVA의 객체를 action tag를 통해서 객체를 생성(instance)한다 -->
<jsp:useBean id="dBean" class="com.min.edu.comm.DateFormatPatternBean" scope="page"/>
<jsp:useBean id="pBean" class="com.min.edu.comm.PhotoBean" scope="page"/>

<!-- content영역 -->
	<div id="container" class="container">
		<form action="./multiDelete.do" method="post" onsubmit="return chkSubmit()">
			<table class="table table-hover">
				<thead>
					<tr class="info">
						<th><input type="checkbox" id="chkbox" class="allCheckBox" onclick="checkAll(this.checked)" > </th>
						<th>연번</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
						<c:if test="${fn:length(lists) == 0 }">
								<tr>
									<td colspan="5" style="color: blue; font-size: 8px; text-align: center;"> -- 작성된 글이 없습니다 --</td>
								</tr>
							
						</c:if>
						
						<c:if test="${fn:length(lists) != 0 }">
							 
							
							<c:forEach var="dto" items="${lists}" varStatus="vs">
							<c:set var="size" value="${fn:length(lists)}"/>
									<tr>
										<td><input type="checkbox" name="ch" class="ch" value="${dto.seq} "></td>
										<td>${size-vs.index}</td>
										<td>${dto.name}</td>
										<td>
											<jsp:setProperty property="depth" name="pBean" value="${dto.depth}"/>
											<jsp:getProperty property="photo" name="pBean"/>
											<c:choose>
												<c:when test="${dto.delflag eq 'y' }">
												
														<span style="font-size: 8px; color: #ccc;">관리자에 의해서 삭제되었습니다</span>
												</c:when>
												<c:otherwise>
												
														<a href="./detailBoard.do?seq=${dto.seq}">${dto.title}</a>
												</c:otherwise>
												</c:choose>
												
										</td>
																			
										<td>
											<fmt:parseDate var="convertDate" value="${dto.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
											<!-- 문자열을 date 타입으로 -->
											<fmt:formatDate value="${convertDate }" pattern="yyyy년도 MM월 dd일"/>
											<!-- 바꾼 것을 다시 포맷! -->
										</td>
									</tr>
								</c:forEach>
					
							</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="text-align: center;">
							<!-- form의 속성인 onsubmit을 통한 제어 -->
							<input type="submit" class="btn btn-success" value="다중삭제01">
							<!-- javascript와 sweetalert을 통한 submit제어 -->
							<input type="button" class="btn btn-info" value="다중삭제02" onclick="chSubmit(event)">
							<input type="button" class="btn btn-primary" value="새글입력" onclick="location.href='./writeBoard.do'">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>




	
<!-- 푸터영역 include -->
<%@ include file="./footer.jsp" %>	
</body>
</html>