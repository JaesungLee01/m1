<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	SubjectDao subjectDao = new SubjectDao();

	int totalRow = subjectDao.selectSubjectCnt();
	
	int rowPerPage = 10;
	
	int beginRow = (currentPage - 1) * rowPerPage;
	
	int lastPage = totalRow / rowPerPage;
	
	if(totalRow % rowPerPage != 0){
		lastPage = lastPage + 1;
	}
	ArrayList<Subject> list = subjectDao.selectSubjectListByPage(beginRow,rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subject List</title>
</head>
<body>
	<h1>과목 목록</h1>
	<a href="<%=request.getContextPath()%>/Subject/addSubject.jsp">과목추가</a>
	<table>
		<tr>
			<th>과목번호</th>
			<th>과목명</th>
			<th>시수</th>
			<th>수정일</th>
			<th>등록일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for(Subject s : list){
		%>
			<tr>
				<td>
					<%=s.getSubjectNo() %>
				</td>
				<td>
					<%=s.getSubjectName() %>
				</td>
				<td>
					<%=s.getSubjectTime() %>
				</td>
				<td>
					<%=s.getUpdatedate() %>
				</td>
				<td>
					<%=s.getCreatedate() %>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/Subject/modifySubject.jsp?subjectNo=<%=s.getSubjectNo()%>">수정</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/Subject/deleteSubjectAction.jsp?subjectNo=<%=s.getSubjectNo()%>">삭제</a>
				</td>
			</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>