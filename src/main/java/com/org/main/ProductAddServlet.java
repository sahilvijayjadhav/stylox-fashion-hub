package com.org.main;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/ProductAddServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ProductAddServlet extends HttpServlet {
    //private static final String UPLOAD_DIR = "images/illustration/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession ses = request.getSession();
    	
        String productName = request.getParameter("productName");
        String ProductDetails = request.getParameter("ProductDetails");
        int ProductPrize = Integer.parseInt(request.getParameter("ProductPrize"));
        int ProductQuantity = Integer.parseInt(request.getParameter("ProductQuantity"));
        String ProductCatogary = request.getParameter("ProductCatogary");
        String ProductSizes = request.getParameter("ProductSizes");
        String Productcolors = request.getParameter("Productcolors");
        int ImagesCount = Integer.parseInt(request.getParameter("ImagesCount"));

        String UPLOAD_DIR = "images/illustration/"+ProductCatogary;
        // Save the image to the uploads folder
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        StringBuilder imageNames = new StringBuilder();
        for(Part part : request.getParts()) {
        	if(part.getName().equals("productImage") && part.getSize() > 0) {
        		
        		String fileName = part.getSubmittedFileName();
        		String filePath = uploadFilePath + File.separator + fileName;
        		
        		try (InputStream input = part.getInputStream()) {
                    Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
        		if (imageNames.length() > 0) {
                    imageNames.append(",");
                }
                imageNames.append(fileName);
        	}
        }

        // Save product details to the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/styloxfashionhub", "root", "root");
            String sql = "INSERT INTO products (pName, pDetail, prize, quantity, catogary, sizes, colors, pImg, imgCount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, productName);
            st.setString(2, ProductDetails);
            st.setInt(3, ProductPrize);
            st.setInt(4, ProductQuantity);
            st.setString(5, ProductCatogary);
            st.setString(6, ProductSizes);
            st.setString(7, Productcolors);
            st.setString(8, imageNames.toString());
            st.setInt(9, ImagesCount);
            st.executeUpdate();
            
            request.setAttribute("alertMessage", "Product Added successfully!");
            request.setAttribute("alertType", "success");
            RequestDispatcher dis = request.getRequestDispatcher("product-add.jsp");
            dis.forward(request, response);
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}