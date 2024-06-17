package com.min.edu.dto;




public class ScoreDto {

	private String name;
	private int kor;
	private int math;
	private int eng;
	private String firstName;
	
	public ScoreDto(String name, int kor, int math, int eng, String firstName) {
		super();
		this.name = name;
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.firstName = firstName;
	}

	@Override
	public String toString() {
		return "ScoreDto [name=" + name + ", kor=" + kor + ", math=" + math + ", eng=" + eng + ", firstName="
				+ firstName + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public String getFirstName() {
		return firstName;
	}

	public ScoreDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	
	
}
