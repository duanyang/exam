<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>Insert title here</title>
</head>
<body>
<table class="score">
<tr>
<td>Your Score</td>
<td>Total Point</td>
<td>Exam</td>
</tr>
<tr>
<td>${score }</td>
<td>${totalScore }</td>
<td>${exam }</td>
</tr>
</table>
<a href="${pageContext.request.contextPath}/onlineexam/logout">Log Out</a>
</body>
</html>