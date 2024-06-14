package com.test.edu;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.min.edu.database.SqlSessionFactoryManager;
import com.min.edu.dto.AnswerboardDto;
import com.min.edu.model.AnswerboardDaoImpl;
import com.min.edu.model.IAnswerboardDao;
import com.util.edu.Utility;

public class AnswerBoard_JUnitTest {

//	@Test
	public void test() throws IOException {
		SqlSessionFactory factory = SqlSessionFactoryManager.getFactory();
		SqlSession session = factory.openSession();
//		Utility.servlet_alert(null, null, null);
		assertNotNull(session);
	}
	
//	@Test
	public void answerboard_JUnitTest01() {
		IAnswerboardDao dao = new AnswerboardDaoImpl();
		
		//입력
		AnswerboardDto insertDto = new AnswerboardDto();
		insertDto.setId("A001");
		insertDto.setTitle("test");
		insertDto.setContent("test");
		boolean iscInsert = dao.insertBoard(insertDto);
		assertTrue(iscInsert);
		
		//상세조회
		AnswerboardDto selectDetailDto 
			= dao.selectDetailBoard(String.valueOf(insertDto.getSeq()));
		assertNotNull(selectDetailDto);
		
		//수정
		Map<String, Object> map =
				new HashMap<String,Object>();
		map.put("seq", String.valueOf(insertDto.getSeq()));
		map.put("content", "  ");
		boolean iscModify = dao.modifyBoard(map);
		assertTrue(iscModify);
		
		//삭제
		boolean iscDelete = dao.deleteBoard(String.valueOf(insertDto.getSeq()));
		assertTrue(iscDelete);
		
		//전체조회
		List<AnswerboardDto> lists = dao.selectAllBoard();
		assertNotEquals(0, lists.size());
		
	}
	
//	@Test
	public void mutiDelete_Trancation_JUnitTest() {
		IAnswerboardDao dao  = new AnswerboardDaoImpl();
		String[] seqs = {"8","9","7"};
		boolean isc =dao.mutiDeleteBoard(Arrays.asList(seqs));
		assertTrue(isc);
	}
	
	@Test
	public void reply() {
		IAnswerboardDao dao = new AnswerboardDaoImpl();
		AnswerboardDto dto = new AnswerboardDto();
		
		dto.setSeq(3); // 부모의 seq 값
		dto.setId("A001"); // 입력될 답글 아이디
		dto.setTitle("답글테스트"); // 입력될 답글 제목
		dto.setContent("답글 테스트 내용"); // 입력될 답글 내용
		
		boolean isc =  dao.reply(dto);
		assertTrue(isc);
	}
}










