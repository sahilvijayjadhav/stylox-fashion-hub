package com.org.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/styloxfashionhub";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "root";
    //detailsSubmit
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String flatBuilding = request.getParameter("flatBuilding");
		String landmark = request.getParameter("landmark");
		String area = request.getParameter("area");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        String productDetails = request.getParameter("productDetails");
        int cId = Integer.parseInt(request.getParameter("cId"));
        String paymentId = request.getParameter("paymentId");
        HttpSession ses = request.getSession();
        List<CartItem> cart = (List<CartItem>) ses.getAttribute("cart");
        if (cart != null) {
            for (CartItem item : cart) {
                System.out.println("enters");
                int pId = item.getpId();
                System.out.println(pId);
                int quantity = item.getQuantity();
                try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                    // Retrieve the current quantity from the database
                    String sql = "SELECT quantity FROM products WHERE id = ?";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setInt(1, pId);
                        try (ResultSet rs = statement.executeQuery()) {
                            if (rs.next()) {
                                int TableQuantity = rs.getInt("quantity");
                                int now_quantity = TableQuantity - quantity;

                                // Update the quantity in the database
                                String sql2 = "UPDATE products SET quantity = ? WHERE id = ?";
                                try (PreparedStatement updateStatement = connection.prepareStatement(sql2)) {
                                    updateStatement.setInt(1, now_quantity);
                                    updateStatement.setInt(2, pId);
                                    updateStatement.executeUpdate();
                                    
                                }
                                try(PreparedStatement delete = connection.prepareStatement("SELECT quantity FROM products WHERE id = ?")){
                                	delete.setInt(1, pId);
                                	try(ResultSet rs1 = delete.executeQuery()){
                                		if(rs1.next()) {
                                			if(rs1.getInt("quantity") == 0) {
                                				try(PreparedStatement deleteProduct = connection.prepareStatement("delete from products where id = ?")){
                                					deleteProduct.setInt(1, pId);
                                					int deleted = deleteProduct.executeUpdate();
                                					if(deleted>0) {
                                						System.out.println("deleted");
                                					}else {
                                						System.out.println("error");
                                					}
                                				}
                                			}
                                		}
                                	}
                                	
                                }
                            } else {
                                System.out.println("Product not found");
                            }
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.out.println("Cart is empty");
        }
        
        // Insert customer details into the database
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "INSERT INTO orders (name, phone, email, flatBuilding, landmark, area, city, state, pincode, CustomerId, product_details, total_amount, payment_status, ordersStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, phone);
                statement.setString(3, email);
                statement.setString(4, flatBuilding);
                statement.setString(5, landmark);
                statement.setString(6, area);
                statement.setString(7, city);
                statement.setString(8, state);
                statement.setInt(9, pincode);
                statement.setInt(10, cId);
                statement.setString(11, productDetails);
                statement.setDouble(12, totalAmount);
                statement.setString(13, "Paid");
                statement.setString(14, "pending");
                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to a success page
        response.sendRedirect("paymentSuccess.jsp");
    }
}