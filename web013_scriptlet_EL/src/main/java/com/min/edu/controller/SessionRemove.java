package com.min.edu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.min.edu.dto.ScoreDto;

@WebServlet("/sessionRemove.do")
public class SessionRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 현재 사용되고 있는 Session의 이름: dto, val Session 이름을 통해 하나의 Session 값만 삭제 =>
		 * removeAttribute Session 자체를 삭제 => invalidate
		 */

		HttpSession session = request.getSession();

		// 1)invalidate를 통한 삭제
		// session.invalidate();
		// getAttribute: 세션이 이미 무효화되었습니다. 출력
		// 로그아웃 때 이거 사용하면 망함

		// 2)removeAttribute를 통한 삭제
		session.removeAttribute("val");
		//session val의 값: null
		//세션은 살아있고, val의 값만 삭제

		// scope는 객체이므로 down casting
		ScoreDto sDto = (ScoreDto) session.getAttribute("dto");
		String sVal = (String) session.getAttribute("val");

		System.out.println("session dto의 값: " + sDto);
		System.out.println("session val의 값: " + sVal);
		
		session.invalidate();
		
		ScoreDto dto=(ScoreDto)getServletContext().getAttribute("dto");
		System.out.println("application scope: "+dto);
	}

}
