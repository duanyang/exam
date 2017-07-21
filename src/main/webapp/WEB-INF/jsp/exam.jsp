<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>Insert title here</title>
</head>
<body class="home">
<c:choose>
<c:when test="${not empty sessionScope.userid }">
<table class="courseList">
<c:forEach items="${exams}" var="exam">
<tr>
<th>${exam.title}</th>
<th><a href="${pageContext.request.contextPath}/onlineexam/getQuestion?id=${exam.id}">take this exam</a></th>
</tr>
</c:forEach>
</table>
</c:when>
<c:otherwise>
<jsp:forward page="home.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
</body>
</html>