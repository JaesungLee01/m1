<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("teacherNo") == null
			|| request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		return;
	}
	
	int teacherNo = Integer.getInteger(request.getParameter("teacherNo"));
	
	if(request.getParameter("teacherName") == null
			|| request.getParameter("teacherId") == null
			|| request.getParameter("teacherHistory") == null
			|| request.getParameter("teacherName").equals("")
			|| request.getParameter("teacherId").equals("")
			|| request.getParameter("teacherHistory").equals("")){
		response.sendRedirect(request.getContextPath()+"/Teacher/updateTeacher.jsp?teacherNo="+teacherNo);
		return;
	}
	
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	String updatedate = request.getParameter("updatedate");
	
	System.out.println(teacherId + "<-- updateTeacherId");
	System.out.println(teacherName + "<-- updateTeacherId");
	System.out.println(teacherHistory + "<-- updateTeacherId");
	
	TeacherDao teaDao = new TeacherDao();
	
	Teacher t = new Teacher();
	t.setTeacherNo(teacherNo);
	t.setTeacherId(teacherId);
	t.setTeacherName(teacherName);
	t.setTeacherHistory(teacherHistory);
	t.setUpdatedate(updatedate);
	
	int row = teaDao.updateTeacher(t);
	
	if(row == 1){
		System.out.println("수정성공");
	}
	response.sendRedirect(request.getContextPath()+"/Teacher/teacherOne.jsp?teacherNo="+teacherNo);
	
%>