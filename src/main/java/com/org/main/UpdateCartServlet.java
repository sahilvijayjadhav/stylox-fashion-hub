package com.org.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int productId = Integer.parseInt(request.getParameter("productId"));
	     int quantity = Integer.parseInt(request.getParameter("quantity"));
	     HttpSession session = request.getSession();
	     List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
	     if (cart != null) {
	            for (CartItem item : cart) {
	                if (item.getpId() == productId) {
	                    item.setQuantity(quantity);
	                    break;
	                }
	            }
	        }
	     response.sendRedirect("cart.jsp");
	}

}
