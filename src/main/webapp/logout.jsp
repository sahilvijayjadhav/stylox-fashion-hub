<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loging Out</title>
</head>
<body>
	<%
    HttpSession sessionUser = request.getSession(false);
    if(sessionUser != null) {
        sessionUser.invalidate(); // Destroy session
    }
    response.sendRedirect("index.jsp");
	%>
</body>
</html>