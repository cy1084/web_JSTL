package com.min.edu.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryManager {

	private static SqlSessionFactory factory;

	// static 변수보다 실행이 먼저되는 애
	// static 생성자
	static {
		String path = "com/min/edu/mybatis/Configuration.xml";
		try {
			Reader reader=Resources.getResourceAsReader(path);
			factory=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			System.out.println("SqlSessionFactory 객체 생성 성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}

}
