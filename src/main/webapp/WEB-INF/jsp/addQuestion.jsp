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
<form action="processAddQuestion" method="post" enctype="multipart/form-data">
<table class="addQuestion">
<tr>
<td>Question</td>
<td><textarea name="question" cols="40" rows="5"></textarea></td>
</tr>
<tr>
<td>Answer 1</td>
<td><textarea name="answer1" cols="40" rows="5"></textarea></td>
</tr>
<tr>
<td>Answer 2</td>
<td><textarea name="answer2" cols="40" rows="5"></textarea></td>
</tr>
<tr>
<td>Answer 3</td>
<td><textarea name="answer3" cols="40" rows="5"></textarea></td>
</tr>
<tr>
<td>Answer 4</td>
<td><textarea name="answer4" cols="40" rows="5"></textarea></td>
</tr>
<tr>
<td>Correct Answer</td>
<td><textarea name="correct" cols="40" rows="5"></textarea></td>
</tr>
<tr>
<td>Total Point</td>
<td><input type="text" name="totalpoint"/></td>
</tr>
<tr>
<td>Picture</td>
<td><input name="file" type="file" id="file"></td>
</tr>
<tr>
<td>Exam</td>
<td>
<select name="examid">
<c:forEach items="${exams }" var="exam">
<option value="${exam.id }">${exam.title }</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td><input type="submit" value="add"></input></td>
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