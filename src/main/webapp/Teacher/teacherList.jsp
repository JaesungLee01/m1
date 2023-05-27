<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	// 현재페이지
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
	}
	
	TeacherDao teaDao = new TeacherDao();
	// 전체 행의 수 구하기
	int totalRow = teaDao.selectTeacherCnt();
	// 페이지 당 해의 개수
	int rowPerPage = 10;
	// 시작 행의 번호
	int beginRow = (currentPage-1) * rowPerPage;
	// 마지막 페이지
	int lastPage = totalRow / rowPerPage;
	
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	}
	// 페이지에 표시하는 
	ArrayList<HashMap<String, Object>> list = teaDao.selectTeacherListByPage(beginRow, rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<div class="container">
<body>
	<h1>강사목록</h1>
	<table class="table table-info">
		<tr>
			<th>강사 아이디</th>
			<th>강사 이름</th>
			<th>과목</th>
		</tr>
		<%
			for(HashMap<String, Object> m : list) {
		%>
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/Teacher/teacherOne.jsp?teacherNo=<%=m.get("teacherNo")%>">
							<%=m.get("teacherId")%>
						</a>
					</td>
					<td>
						<%=m.get("teacherName")%>
					</td>
					<td>
						<%=m.get("teacherSubjectName")%>
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
	</div>
</body>
</html>