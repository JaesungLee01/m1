<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
	}
	
	TeacherDao teaDao = new TeacherDao();
	
	int totalRow = teaDao.selectTeacherCnt();
	
	int rowPerPage = 10;
	
	int beginRow = (currentPage-1) * rowPerPage;
	
	int lastPage = totalRow / rowPerPage;
	
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> list = teaDao.selectTeacherListByPage(beginRow, rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, td{
		border : 1px solid #FF0000;
	}
</style>
</head>
<body>
	<h1>강사</h1>
	<table>
		<tr>
			<th>강사 아이디</th>
			<th>강사 이름</th>
			<th>과목</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for(HashMap<String, Object> m : list) {
		%>
				<tr>
					<td>
						<%=m.get("teacherId")%>
					</td>
					<td>
						<%=m.get("teacherName")%>
					</td>
					<td>
						<%=m.get("teacherSubjectName")%>
					</td>
					<td>
						<a href="<%=request.getContextPath()%>/Teacher/modifyTeacher.jsp?teacherNo="<%=m.get("teacherNo")%>>수정</a>
					</td>
					<td>
						<a href="<%=request.getContextPath()%>/Teacher/deleteTeacher.jsp?teacherNo="<%=m.get("teacherNo")%>>삭제</a>
					</td>
					
				</tr>
		<%
			}
		%>
	</table>
	
	<%
		int pagePerPage = 10;
	
		int minPage = (currentPage - 1)/pagePerPage * pagePerPage + 1;
		
		int maxPage = minPage + pagePerPage - 1;
		
		if(minPage>1){
	%>
		<a href="<%=request.getContextPath()%>/Teacher/teacherList.jsp?currentPage=<%=minPage-pagePerPage%>">이전</a>
	<%
		}
		
		for(int i=minPage; i<= maxPage; i++){
			if(i == currentPage){
	%>
			<%=i %>
	<%
			} else {
	%>
			<a href="<%=request.getContextPath()%>/Teacher/teacherList.jsp?currentPage=<%=i%>"><%=i %></a>
	<%
			}
		}
		
		if(maxPage != lastPage){
			
	%>
		<a href="<%=request.getContextPath()%>/Teacher/teacherList.jsp?currentPage=<%=minPage+pagePerPage%>">다음</a>
	<%
		}
	%>
</body>
</html>