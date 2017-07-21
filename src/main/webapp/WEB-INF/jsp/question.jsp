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
<form action="calculateScores" method="post">
<table>
<c:forEach items="${questions}" var="question">
<tr>
<td>${question.content}</td>
</tr>
<c:if test="${not empty question.piturePath}">
<tr>
<td><img src="../img/${question.piturePath }"></img></td>
</tr>
</c:if>
<tr>
<td>
<c:forEach items="${question.answers }" var="answer">
<input type="radio" name="${question.id }" value="${answer.content }">${answer.content }
</c:forEach>
</td>
</tr>
</c:forEach>
<tr>
<td><input type="submit" value="submit"/></td>
</tr>
</table>
</form>
</c:when>
<c:otherwise>
<jsp:forward page="home.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
</body>
</html>