package com.min.edu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.min.edu.dto.ScoreDto;

public class JSTL_Servlet extends HttpServlet {

	private static final long serialVersionUID = -235277079887384411L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");

		List<ScoreDto> lists = new ArrayList<ScoreDto>();
		for (int i = 0; i < 10; i++) {
			ScoreDto d = new ScoreDto("피카" + i, i + 10, i * 20, i * 30, "캬");
			lists.add(d);
		}

		req.setAttribute("lists", lists);
		req.getRequestDispatcher("/WEB-INF/views/jstlPage.jsp").forward(req, resp);

	}
}
