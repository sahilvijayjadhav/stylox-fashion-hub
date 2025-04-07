package com.org.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pleaseLogin")
public class pleaseLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		if(req.getParameter("addToCart")!=null) {
			out.print("<script>alert('Please login') window.location='login.jsp'</script>");
			resp.sendRedirect("login.jsp");
		}
	}
}