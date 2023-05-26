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
	
	SubjectDao subDao = new SubjectDao();
	
	Subject one = subDao.selectSubjectOne(subjectNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 수정</h1>
	<form action="<%=request.getContextPath()%>/Subject/modifySubjectAction.jsp" method="post">
		<table>
			<tr>
				<th>과목번호</th>
				<td>
					<input type="hidden" name="subjectNo" value="<%=one.getSubjectNo()%>">
				</td>
			</tr>
			<tr>
				<th>과목명</th>
				<td>
					<input type="text" name="subjectName" value="<%=one.getSubjectName()%>">
				</td>
			</tr>
			<tr>
				<th>시수</th>
				<td>
					<input type="number" name="subjectTime" value="<%=one.getSubjectTime()%>">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
		</form>
</body>
</html>