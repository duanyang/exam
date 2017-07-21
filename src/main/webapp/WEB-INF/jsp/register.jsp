<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<title>Insert title here</title>
</head>
<body>
<form action="processRegister" method="post">

  <div class="container">
  
  	<label><b>Name</b></label>
    <input  class="name" type="text" placeholder="Enter Name" name="name" required>
    
    <label><b>Email</b></label>
    <input  class="email" type="email" placeholder="Enter Email" name="email" required>
    
    <label><b>Username</b></label>
    <input  class="username" type="text" placeholder="Enter Username" name="username" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <button class="register" type="submit">Sign Up</button>
  </div>

</form>
</body>
</html>