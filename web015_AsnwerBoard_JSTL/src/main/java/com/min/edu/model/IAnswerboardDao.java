package com.min.edu.model;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.AnswerboardDto;

public interface IAnswerboardDao {

//	전체글조회   selectAllBoard
	public List<AnswerboardDto> selectAllBoard();
	
//	상세글조회   selectDetailBoard
	public AnswerboardDto selectDetailBoard(String seq);
	
//	글수정       modifyBoard
	public boolean modifyBoard(Map<String, Object> map);
	
//	글삭제        mutiDeleteBoard
	public boolean mutiDeleteBoard (List<String> list);
	
//	글입력        insertBoard     
	public boolean insertBoard(AnswerboardDto dto);
	
//	글삭제      deleteBoard     
	public boolean deleteBoard(String seq);
	
//	답글 업데이트  replyUpdate
	public int replyUpdate(AnswerboardDto dto);
//	답글 입력        replyInsert     
	public int replyInsert(AnswerboardDto dto);
	
//  Transaction Reply 처리 reply
	public boolean reply(AnswerboardDto dto);
               
}





