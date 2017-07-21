<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>Insert title here</title>
</head>
<body class="home">
<form class="login" action="login" method="post">
<input type="text"  class="username" name="username" placeholder="Username"/>
<input type="password" name="password" placeholder="Password"/>
<input type="submit" class="login" value="login"/>
<a href="${pageContext.request.contextPath}/onlineexam/register">Register</a>
</form>
</body>
</html>