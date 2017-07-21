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
<form action="processAddExam" method="post">
<table class="addExam">
<tr>
<td>Title</td>
<td><input type="text" name="title"/></td>
</tr>
<tr>
<td>Course</td>
<td>
<select name="courseid">
<c:forEach items="${courses}" var="course">
<option value="${course.id }">${course.title }</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td><input type="submit" value="add"/></td>
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