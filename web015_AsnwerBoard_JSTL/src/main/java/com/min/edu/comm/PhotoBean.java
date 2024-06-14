package com.min.edu.comm;

public class PhotoBean {

	private int depth;

	public void setDepth(int depth) {
		this.depth = depth;
	}

	// 답글 depth에 따라서 공백과 이미지를 넣어 주는 메소드
	public String getPhoto(){
		String replyStr = "";

		String img = "<img alt='답글' src='./img/reply.png'>";
		String blank ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

		for(int i=0; i<depth;i++){
			replyStr += blank;
		}
		return (depth>0)?replyStr+img:replyStr;
	}
}
