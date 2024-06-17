package com.edu.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;

import com.min.edu.dto.Dept_Dto;
import com.min.edu.mybatis.SqlSessionFactoryManager;

public class Mybatis_JUnitTest {
   
   private SqlSession session;
   
   @Before
   public void createSessionTest() {
      SqlSessionFactory manager =   SqlSessionFactoryManager.getFactory();   
      session = manager.openSession();
      assertNotNull(session);
   
   }
   @Test
   public void getAllDept_JUnitTest() {
      List<Dept_Dto> lists = session.selectList("edu.deptselect.getAllDept");
      //session.selectList("namespace명.id명");
      for(Dept_Dto d : lists) {
         System.out.println(d);
      }
      assertEquals(4, lists.size()); //기대되는 값:4 , 반환 값: size

   }
}