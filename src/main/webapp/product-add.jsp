<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*, com.org.main.CartItem"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Custom CSS -->
  <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
	<div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar" class="bg-navy z-3 position-absolute">
      <div class="sidebar-header d-flex align-items-center justify-content-evenly">
        <h3 class="pb-0">Admin Panel</h3>
        <button type="button" id="sidebarCollapseClose" class="btn bg-white btn-close d-lg-none d-block ">
        </button>
      </div>
      <ul class="list-unstyled components">
        <hr class="mt-0">
        <li class="active">
          <a href="./Dashboard.jsp">Dashboard</a>
        </li>
        <hr>
        <li>
          <a href="./DashboardUserPage.jsp">Users</a>
        </li>
        <hr>
        <li>
          <a href="./DashboardProductPage.jsp">Products</a>
        </li>
        <hr>
        <li>
          <a href="./product-add.jsp">Add Product</a>
        </li>
        <hr>
        <li>
          <a href="./Dashboardorders.jsp">My Orders</a>
        </li>
        <hr>
        <li>
          <a href="./DashboardDeletedOrders.jsp">Previous Orders</a>
        </li>
        <hr class="mb-0">
        <li>
          <a href="./DashboardDeletedProducts.jsp">Deleted Products</a>
        </li>
        <hr>
      </ul>
    </nav>

    <!-- Page Content -->
    <div id="content">
      <!-- Top Navigation Bar -->
      <nav class="navbar navbar-expand-lg navbar-light bg-light d-flex align-items-center justify-content-between">
        <div class="d-flex flex-row">
            <button type="button" id="sidebarCollapse" class="btn btn-navy d-lg-none d-block">
                <span class="navbar-toggler-icon"></span>
              </button>
              <a class="navbar-brand ms-3 fs-3 fw-bold text-uppercase" style="color: #003366;" href="#">Stylox</a>
        </div>
        <a href="./index.jsp" class="btn btn-outline-danger float-end">
            <i class="fa-solid fa-right-from-bracket"></i>
        </a>
      </nav>

      <!-- Main Content -->
      <div class="container-fluid p-4">
        <h1>Add Product</h1>
        <hr>
        <% if (request.getAttribute("alertMessage") != null) { %>
            <div class="alert alert-<%= request.getAttribute("alertType") %> alert-dismissible fade show" role="alert">
                <%= request.getAttribute("alertMessage") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
	    <form action="ProductAddServlet" method="post" class="bg-body-secondary form-control w-75 px-4 py-5" enctype="multipart/form-data">
	        <div class="form-floating mb-3">
	        	<input type="text" id="productName" name="productName" class="form-control" placeholder="Product Name" required>
	        	<label for="productName"> Product Name:</label>
	        </div>
	        
	        <div class="form-floating mb-3">
				<textarea id="ProductDetails" class="form-control" placeholder="Product Details" name="ProductDetails"></textarea>
	        	<label for="ProductDetails">Product Details:</label>
	        </div>
			
			<div class="form-floating mb-3">
				<input type="text" id="ProductPrize" class="form-control" placeholder="Product Prize" name="ProductPrize" required>
				<label for="ProductPrize">Product Prize:</label>
			</div>
	        
	        <div class="form-floating mb-3">
	        	<input type="text" id="ProductQuantity" class="form-control" placeholder="Product Quantity" name="ProductQuantity" required>
	        	<label for="ProductQuantity">Product Quantity:</label>
	        </div>
	        
	        <div class="form-floating mb-3">
	        	<select id="ProductCatogary" class="form-control" placeholder="Product Catogary" name="ProductCatogary" required>
				  <option selected>Select Catogary</option>
				  <option value="shirts">shirts</option>
				  <option value="tshirts">tshirts</option>
				  <option value="hoddies">hoddies</option>
				  <option value="jacket">jacket</option>
				  <option value="jeans">jeans</option>
				  <option value="formals">formals</option>
				  <option value="tracks">tracks</option>
				  <option value="shorts">shorts</option>
				  <option value="sports_Shoes">sports Shoes</option>
				  <option value="formal_shoes">formal shoes</option>
				  <option value="chappal">chappal</option>
				  <option value="casual_shoes">casual shoes</option>
				  <option value="watch">watch</option>
				  <option value="caps">caps</option>
				  <option value="perfume">perfume</option>
				  <option value="belts">belts</option>
				  <option value="undershirt">undershirt</option>
				  <option value="underwear">underwear</option>
				  <option value="socks">socks</option>
				</select>
				<label for="ProductCatogary">Product Catogary:</label>
	        </div>
	        
	        <div class="form-floating mb-3">
	        	<input type="text" id="ProductSizes" class="form-control" placeholder="Product Sizes" name="ProductSizes" required>
	        	<label for="ProductSizes">Product Sizes:</label>
	        </div>
	        
	        <div class="form-floating mb-3">
	        	<input type="text" id="Productcolors" class="form-control" placeholder="Product colors" name="Productcolors" required>
	        	<label for="Productcolors">Product colors:</label>
	        </div>
	        
	        <div class="form-floating mb-3">
	        	<input type="number" id="ImagesCount" class="form-control" placeholder="Product Count" name="ImagesCount" required>
	        	<label for="ImagesCount">Images Count:</label>
	        </div>
			
			<div class="mb-3">
				<label for="productImage">Product Images:</label>
	        	<input type="file" id="productImage" name="productImage" class="form-control" placeholder="Product Images" accept="image/*" multiple required>
			</div>
			
			<div class="col-auto">
				<input type="submit" class="btn btn-primary mb-3" name="submit" value="Add Product">
			</div>
	    </form>
      </div>
    </div>
  </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
  <!-- jQuery (for sidebar toggle) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Custom JS -->
  <script>
    $(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
      });
      $('#sidebarCollapseClose').on('click', function () {
          $('#sidebar').toggleClass('active');
        });
    });
  </script>
</body>
</html>