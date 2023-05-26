<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>

<%	
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("subjectName") == null
		|| request.getParameter("subjectTime") == null
		|| request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime").equals("")){
		
		response.sendRedirect(request.getContextPath()+"subject/addSubject.jsp");
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	SubjectDao subDao = new SubjectDao();
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	int row = subDao.insertSubject(subject);
	
	if(row == 1) {
		System.out.println("과목추가 성공");
	}
	
	response.sendRedirect(request.getContextPath()+"/Subject/subjectList.jsp");
%>
