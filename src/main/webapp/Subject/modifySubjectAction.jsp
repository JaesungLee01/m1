<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("subjectNo") == null
			|| request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/Subject/subjectList.jsp");
		return;
	}
	
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	if(request.getParameter("subjectName") == null
			|| request.getParameter("subjectTime") == null
			|| request.getParameter("subjectName").equals("")
			|| request.getParameter("subjectTime").equals("")){
			
			response.sendRedirect(request.getContextPath()+"/Subject/modifySubject.jsp?subjectNo="+subjectNo);
			return;
			
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	System.out.printf("test %s, %s", subjectName, subjectTime);
	
	SubjectDao subDao = new SubjectDao();
	
	Subject subject = new Subject();
	subject.setSubjectNo(subjectNo);
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	int row = subDao.updateSubject(subject);
	
	if(row == 1){
		System.out.println("과목수정성공");
	}
	response.sendRedirect(request.getContextPath()+"/Subject/subjectList.jsp?subjectNo="+subjectNo);
	
%>


