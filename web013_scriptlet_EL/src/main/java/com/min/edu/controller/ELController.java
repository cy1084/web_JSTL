package com.min.edu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.min.edu.dto.ScoreDto;

@WebServlet("/el.do")
public class ELController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ScoreDto dto1 = new ScoreDto("놀부", 100, 100, 30, "Nol");
		ScoreDto dto2 = new ScoreDto("흥부", 100, 100, 30, "Heung");
		ScoreDto dto3 = new ScoreDto("까치", 100, 100, 30, "bird");
		
		/*
		 * EL의 scope 호출 우선순위
		 * page->request->session->application
		 */
		
		request.setAttribute("dto", dto1);//request scope
		
		HttpSession session=request.getSession(); //session scope
		session.setAttribute("dto",dto2);
		
		getServletContext().setAttribute("dto", dto3); //전형적으로 사용할 수 있는 application scope
	
		/*
		 * 이 설명 0613 2시 40분~
		 * 흐름 제어
		 * response.sendRedirect() => 요청된 페이지로 다시 (주소로) 전달/ getWriter() 바디에 전달/ 다시 전달하고 그 페이지에 뿌리므로 값을 들고 갈 수 없음
		 * request.getRequestDispatcher().forward(request,response)/ 요청된 것을 가지고 새로운 페이지를 만드므로 값을 들고 갈 수 있음
		 * */
		
		session.setAttribute("val", "session의 값");
		request.getRequestDispatcher("/ELPage.jsp").forward(request, response);
	}

}
