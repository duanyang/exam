<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${not empty sessionScope.userid }">
<table class="scoreList">
<tr>
<td>Student Name</td>
<td>Student Score</td>
<td>Exam Total Point</td>
<td>Exam</td>
</tr>
<c:forEach items="${scores}" var="score">
<tr>
<td>${score.user.name }</td>
<td>${score.point }</td>
<td>${score.totalPoint }</td>
<td>${score.exam.title }</td>
</tr>
</c:forEach>
</table>
</c:when>
<c:otherwise>
<jsp:forward page="home.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath}/onlineexam/logout">Log Out</a>
<a href="${pageContext.request.contextPath}/onlineexam/getExam">Back</a>
</body>
</html>