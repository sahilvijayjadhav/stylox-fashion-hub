<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*"%>

<%
HttpSession ses = request.getSession();
Integer ImagesCount = (Integer) ses.getAttribute("ImagesCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Add Images</h1>
	<form action="ProductAddServlet" method="post" enctype="multipart/form-data">
	<%
	for(int i = 1; i<=ImagesCount; i++){
	%>
		<label for="productImage<%=i %>">Product Image <%=i %>:</label>
        <input type="file" id="productImage<%=i %>" name="productImage<%=i %>" accept="image/*" required><br><br>
	<%	
	}
	%>
		<input type="submit" name="submit" value="Add Images">
	</form>
	
</body>
</html>