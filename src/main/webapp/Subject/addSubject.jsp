<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 추가</h1>
	<form action="<%=request.getContextPath()%>/Subject/addSubjectAction.jsp" method="post">
		<table>
			<tr>
				<th>과목명</th>
				<td><input type="text" name="subjectName"></td>
			</tr>
			<tr>
				<th>시수</th>
				<td><input type="number" name="subjectTime"></td>
			</tr>
		</table>
		<button type="submit">추가</button>
	</form>
</body>
</html>