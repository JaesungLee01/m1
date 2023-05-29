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
	<h1>강사 수정</h1>
	<form action="<%=request.getContextPath()%>/Teacher/updateTeacherAction.jsp
	" method="post">
	<table>
		<tr>
			<th>강사 번호</th>
			<th>강사 아이디</th>
			<th>강사 이름</th>
			<th>강사경력</th>
			<th>수정일</th>
		</tr>
		<tr>
			<td>	
				<input type="number" name="teacherNo" readonly="readonly" value="<%=one.getTeacherNo() %>">  
			</td>
			<td>
				<input type="text" name="teacherId" value="<%=one.getTeacherId() %>">  
			</td>
			<td>
				<input type="text" name="teacherName" value="<%=one.getTeacherName() %>">  
			</td>
			<td>
				<input type="text" name="teacherHistory" value="<%=one.getTeacherHistory() %>">  
			</td>
			<td>
				<input type="text" name="teacherId" readonly="readonly" value="<%=one.getUpdatedate() %>">  
			</td>
		</tr>
	</table>
	<button type="submit">수정</button>
	</form>
</body>
</html>