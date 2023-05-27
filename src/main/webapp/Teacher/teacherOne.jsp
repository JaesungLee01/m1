<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacherList.jsp");
		return;
	}
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	TeacherDao teaDao = new TeacherDao();
	
	Teacher one = teaDao.selectTeacherOne(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강사상세보기</h1>
		<table>
		<tr>
			<th>강사 아이디</th>
			<th>강사 이름</th>
			<th>과목</th>
			<th>강사경력</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
			<tr>
				<td>
					<%=one.getTeacherId()%>
				</td>
				<td>
					<%=one.getTeacherName() %>
				</td>
				<td>
					<%=one.getTeacherHistory()%>
				</td>
				<td>
					<%=one.getCreatedate()%>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/Teacher/updateTeacher.jsp?teacherNo=<%=one.getTeacherNo()%>">수정</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/Teacher/deleteTeacher.jsp?teacherNo=<%=one.getTeacherNo()%>">삭제</a>
				</td>
			</tr>
		</table>
</body>
</html>