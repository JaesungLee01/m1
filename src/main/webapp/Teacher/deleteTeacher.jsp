<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		return;
	}
	
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	TeacherDao teaDao = new TeacherDao();
	
	Teacher one = teaDao.selectTeacherOne(teacherNo);
	
	int row = teaDao.deleteTeacher(teacherNo);
	
	if( row == 1){
		System.out.println("강사삭제성공");
		
	}
	response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
%>