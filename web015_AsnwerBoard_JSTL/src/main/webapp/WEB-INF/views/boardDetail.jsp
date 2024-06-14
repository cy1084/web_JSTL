<%@page import="com.min.edu.dto.AnswerboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세 페이지</title>
</head>


<%@include file="./header.jsp"%>
<body>
	<div id="container">
		<table class="table table-condensed">
			<tbody>
				<tr>
					<td class=info>아이디</td>
					<td>${dto.id}</td>
					<!-- 서블릿의 req.setAttribute("dto",dto) 이름으로 부르는 것! -->
				</tr>
				<tr>
					<td class=info>제목</td>
					<td>${dto.title}</td>
				</tr>
				<tr>
					<td class=info>내용</td>
					<td>${dto.content}</td>
				</tr>
				<tr>
					<td class=info>내용</td>
					<td><textarea rows="5" cols="20" readonly="readonly">${dto.content}</textarea>
					</td>
				</tr>
				<tr>
					<td class=info>등록일</td>
					<td>${dto.regdate}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<form class="btn-group btn-group-justified">
							<input type="hidden" name="seq" value="${dto.seq}">
							<c:if test="${loginDto.auth eq 'A'}">
							<!-- loginDto는 session 이름! -->

								<div class="btn-group">
									<button class="btn btn-danger" onclick="del(event)">관리자삭제</button>
								</div>
							</c:if>

							<c:if test="${loginDto.id eq dto.id}">
								<div class="btn-group">
									<button class="btn btn-info" onclick="modify(event)">내글수정</button>
								</div>
							</c:if>

							<div class="btn-group">
								<button type="button" class="btn btn-primary"
									onclick="reply(event)">답글</button>
							</div>
						</form>

					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<%@include file="./footer.jsp"%>
</html>