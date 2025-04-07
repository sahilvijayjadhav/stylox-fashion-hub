package com.org.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addToCartServlet")
public class addToCartServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("ProductId"));
		String selectedColors = req.getParameter("selectedColors");
		String selectedSize = req.getParameter("selectedSize");
		int quantity = Integer.parseInt(req.getParameter("quantity")); 
		
		CartItem cartitem = new CartItem(id, quantity, selectedColors, selectedSize);
		
		HttpSession session = req.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<>();
		}
		
		cart.add(cartitem);
		session.setAttribute("cart", cart);
		resp.sendRedirect("cart.jsp");
	}

}
