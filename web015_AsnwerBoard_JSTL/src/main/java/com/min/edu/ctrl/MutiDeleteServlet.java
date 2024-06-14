package com.min.edu.ctrl;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.min.edu.model.AnswerboardDaoImpl;
import com.min.edu.model.IAnswerboardDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MutiDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 2042047264982580129L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("MutiDeleteServlet 다중삭제 POST");
		String[] chs = req.getParameterValues("ch");
		log.info("전달받은 요청 값 {}", Arrays.toString(chs) );
		
		IAnswerboardDao dao = new AnswerboardDaoImpl();
		
		boolean isc = dao.mutiDeleteBoard(Arrays.asList(chs));
		if(isc) {
			resp.sendRedirect("./boardList.do");
		}else {
			req.getRequestDispatcher("/WEB-INF/views/error.html").forward(req, resp);
		}
	}

}
