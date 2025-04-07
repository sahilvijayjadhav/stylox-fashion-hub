<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*, com.org.main.CartItem, java.text.DecimalFormat, org.json.JSONArray, org.json.JSONObject"%>
<!DOCTYPE html>
<html lang="en">
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
        <div class="container">
        	<%
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/styloxfashionhub","root","root");
	        	PreparedStatement ps = null;
	        	PreparedStatement ps1 = null;
	        	ResultSet rs = null;
        	%>
        	<div class="row">
        		<div class="col-4">
        			<div class="card text-bg-danger">
        				<div class="card-header">
        					Deleted Orders
						</div>
						<div class="card-body">
						<%
							ps = con.prepareStatement("select count(b_id) as deletedOrders from b_orders");
							rs = ps.executeQuery();
							if(rs.next()){
						%>
							<h1><%=rs.getInt("deletedOrders") %></h1>
						<%		
							}
						%>
							<h2>Orders</h2>
						</div>
        			</div>
        		</div>
        	</div>
        	<hr>
        	<div id="orderSee table-responsive-md">
        		<table class="table ">
        			<thead>
        				<tr>
        					<td></td>
        					<td colspan="6">
        						<form action="#" method="get" class="row g-3">
        							<div class="col-auto">
        								<input type="search" name="searchName" class="form-control" placeholder="Enter name of product" />
        							</div>
        							<div class="col-auto">
        								<button type="submit" class="btn btn-secondary">Search</button>
        							</div>
        						</form>
        					</td>
        				</tr>
        				<tr>
        					<th scope="col">Order ID</th>
        					<th scope="col">Customer Name</th>
        					<th scope="col">Phone No.</th>
        					<th scope="col">Email</th>
        					<th scope="col">Address</th>
        					<th scope="col">Customer Details</th>
        					<th scope="col">Product Details</th>
        					<th scope="col">Total Amount</th>
        					<th scope="col">Delete Time</th>
        				</tr>
        			</thead>
        			<tbody>
        			<%
        				String searchName = request.getParameter("searchName");
        				String sql;
        				if (searchName != null && !searchName.isEmpty()) {
                            sql = "SELECT * FROM b_orders WHERE b_name LIKE ?";
                            ps = con.prepareStatement(sql);
                            ps.setString(1, "%" + searchName + "%");
                        } else {
                            sql = "SELECT * FROM b_orders";
                            ps = con.prepareStatement(sql);
                        }
        				rs = ps.executeQuery();
        				while(rs.next()){
        					double price = rs.getDouble("b_total_amount");
        					DecimalFormat df = new DecimalFormat("#,##0.00");
        					String orders = rs.getString("b_product_details");
    						JSONArray jsonArray = new JSONArray(orders);
        			%>
        				<tr>
        					<th scop="row"><%=rs.getInt("b_id") %></th>
        					<td><%=rs.getString("b_name") %></td>
        					<td><%=rs.getString("b_phone") %></td>
        					<td><%=rs.getString("b_email") %></td>
        					<td>
        						<button type="button" class="btn btn-sm btn-primary fs-6"  data-bs-toggle="modal" data-bs-target="#exampleModal<%=rs.getInt("b_id") %>">
								  Address
								</button>
								<div class="modal fade" id="exampleModal<%=rs.getInt("b_id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">Customer Address</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <form class="row g-3">
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs.getString("b_flatBuilding") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs.getString("b_landmark") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs.getString("b_area") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs.getString("b_city") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs.getString("b_state") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs.getInt("b_pincode") %>" aria-label="Disabled input example" disabled readonly>
											</div>
										</form>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
        					</td>
        					<td>
        						<button type="button" class="btn btn-sm btn-info fs-6"  data-bs-toggle="modal" data-bs-target="#cDetails<%=rs.getInt("b_id") %>">
								  Customer
								</button>
								<div class="modal fade" id="cDetails<%=rs.getInt("b_id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">User Details</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      <%
								      	ps = con.prepareStatement("select * from users where id = ?");
								      	ps.setInt(1, rs.getInt("b_CustomerId"));
								      	ResultSet rs2 = ps.executeQuery();
								      	if(rs2.next()){
								      %>
								      	<form class="row g-3">
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getInt("id") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("name") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("email") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("flatBuilding") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("landmark") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("area") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("city") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("state") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getInt("pincode") %>" aria-label="Disabled input example" disabled readonly>
											</div>
											<div class="col-auto">
												<input class="form-control" type="text" value="<%=rs2.getString("contact") %>" aria-label="Disabled input example" disabled readonly>
											</div>
										</form>
								      <%
								      	}
								      %>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
        					</td>
        					<td>
        						<button type="button" class="btn btn-sm btn-success fs-6"  data-bs-toggle="modal" data-bs-target="#openOrdersDetails<%=rs.getInt("b_id") %>">
								  Orders
								</button>
								<div class="modal fade" id="openOrdersDetails<%=rs.getInt("b_id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">Customer Orders</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <table class="table table-hover">
								        	<thead>
												<tr>
													<th scope="col">Product Id</th>
													<th scope="col">Product</th>
											      	<th scope="col">Product Name</th>
											      	<th scope="col">Ordered Quantity</th>
											      	<th scope="col">Selected Color</th>
											      	<th scope="col">Selected Size</th>
											      	<th scope="col">Product Prize</th>
											      	<th scope="col">Product Catogary</th>
											    </tr>
											</thead>
											<tbody>
											<%
											for(int i = 0; i< jsonArray.length(); i++){
												JSONObject jsonObject = jsonArray.getJSONObject(i);
												int pId = jsonObject.getInt("pId");
												String selectedColor = jsonObject.optString("selectedColor", jsonObject.optString("selectedColor", "N/A"));
												String selectedSize = jsonObject.optString("selectedSize", jsonObject.optString("selectedSize", "N/A"));
												int Quantity = jsonObject.getInt("quantity");
												ps = con.prepareStatement("select * from products where id = ?");
												ps.setInt(1, pId);
												ResultSet rs1 = ps.executeQuery();
												if(rs1.next()){
													double productTotal = rs1.getInt("prize") * Quantity;
													String imageNames = rs1.getString("pImg");
						                    		int comma = imageNames.indexOf(",");
						                    		if(comma == -1){
						                    			comma = imageNames.length();
						                    		}
						                    		String image = imageNames.substring(0, comma);
						                    		String catogary = rs1.getString("catogary");
											%>
												<tr>
													<td><%=pId %></td>
													<td>
														<img alt="<%=image %>" class="" width="100px" src="./images/illustration/<%=catogary %>/<%=image %>">
													</td>
													<td><%=rs1.getString("pName") %></td>
													<td><%=Quantity %></td>
													<td><%=selectedColor %></td>
													<td><%=selectedSize %></td>
													<td>&#8377; <%=rs1.getInt("prize")  %></td>
													<td><%=catogary %></td>
												</tr>
											<%	
												}
											}
											%>
											</tbody>
								        </table>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
        					</td>
        					<td>&#8377; <%=df.format(price) %></td>
        					<td><%=rs.getString("b_delete_at") %></td>
        				</tr>
        			<%
        				}
        			%>
        			</tbody>
        		</table>
        	</div>
        </div>
      </div>
    </div>
  </div>
  

  <!-- Bootstrap 5 JS and Popper -->
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