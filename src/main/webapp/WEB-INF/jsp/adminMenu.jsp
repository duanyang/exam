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
<div class="adminMenu">
<a href="${pageContext.request.contextPath}/onlineexam/addExam">Add Exam</a>
<a href="${pageContext.request.contextPath}/onlineexam/addQuestion">Add Question</a>
<a href="${pageContext.request.contextPath}/onlineexam/getExam">Get Score</a>
<a href="${pageContext.request.contextPath}/onlineexam/logout">Log Out</a>
</div>
</c:when>
<c:otherwise>
<jsp:forward page="home.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
</body>
</html>