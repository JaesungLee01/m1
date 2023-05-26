<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%

	if(request.getParameter("subjectNo") == null
			|| request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/Subject/subjectList.jsp");
		return;
	}

	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao subDao = new SubjectDao();
	
	int row = subDao.deleteSubject(subjectNo);
	
	if(row == 1){
		System.out.println("과목삭제 성공");
	}
	
	response.sendRedirect(request.getContextPath()+"/Subject/subjectList.jsp");
%>
