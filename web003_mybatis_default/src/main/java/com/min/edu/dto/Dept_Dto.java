package com.min.edu.dto;

import java.io.Serializable;

//TODO 006 쿼리의 결과 및 전송을 위한 객체
//DTO (Data Transfer Object) 혹은 VO(Variable Object)
public class Dept_Dto implements Serializable{
	//메모리에서 객체의 고유값으로 직렬화를 만들기 위해서
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 4253123314956891482L;
	private String deptno;
	private String dname;
	private String loc;
	
	public Dept_Dto() {
		super();
	}

	public Dept_Dto(String deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	public String getDeptno() {
		return deptno;
	}

	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	@Override
	public String toString() {
		return "Dept_Dto [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
	}

	
}
