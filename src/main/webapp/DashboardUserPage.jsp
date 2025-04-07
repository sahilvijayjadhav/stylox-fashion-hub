<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*, com.org.main.CartItem"%>
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
        	ResultSet rs = null;
        %>
        	<div class="row pb-4">
        		<div class="col-4">
        			<div class="card text-bg-primary">
        				<div class="card-header">
        					Total Users
						</div>
						<div class="card-body">
						<%
							ps = con.prepareStatement("select count(id) as totalUsers from users");
							rs = ps.executeQuery();
							if(rs.next()){
						%>
							<h1><%=rs.getInt("totalUsers") %></h1>
						<%		
							}
						%>
							<h2>Users</h2>
						</div>
						<div class="card-footer">
							<a href="#usersSee" class="text-white">See Details</a>
						</div>
        			</div>
        		</div>
        	</div>
        	<hr>
        	<div id="usersSee">
        		<table class="table">
        			<thead>
        				<tr>
        					<td></td>
        					<td colspan="5">
        						<form action="#" method="get" class="row g-3">
        							<div class="col-auto">
        								<input type="search" name="searchName" class="form-control" placeholder="Enter name to search" />
        							</div>
        							<div class="col-auto">
        								<button type="submit" class="btn btn-secondary">Search</button>
        							</div>
        						</form>
        					</td>
        				</tr>
        				<tr>
        					<th scope="col">ID</th>
        					<th scope="col">Name</th>
        					<th scope="col">Email</th>
        					<th scope="col">Contact</th>
        					<th scope="col">Address</th>
        					<th scope="col">Update</th>
        				</tr>
        			</thead>
        			<tbody>
        			<%
        				String searchName = request.getParameter("searchName");
        				String sql;
        				if (searchName != null && !searchName.isEmpty()) {
                            sql = "SELECT * FROM users WHERE name LIKE ?";
                            ps = con.prepareStatement(sql);
                            ps.setString(1, "%" + searchName + "%");
                        } else {
                            sql = "SELECT * FROM users";
                            ps = con.prepareStatement(sql);
                        }
        				rs = ps.executeQuery();
        				while(rs.next()){
        			%>
        				<tr>
        					<th scop="row"><%=rs.getInt("id") %></th>
        					<td><%=rs.getString("name") %></td>
        					<td><%=rs.getString("email") %></td>
        					<td><%=rs.getString("contact") %></td>
        					<td>
        						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=rs.getInt("id") %>">See Address</button>
        						<div class="modal fade" id="exampleModal<%=rs.getInt("id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        							<div class="modal-dialog">
        								<div class="modal-content">
        									<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Address</h1>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										   	</div>
										   	<div class="modal-body">
												<form class="row g-3">
													<div class="col-auto">
														<input class="form-control" type="text" value="<%=rs.getString("flatBuilding") %>" aria-label="Disabled input example" disabled readonly>
													</div>
													<div class="col-auto">
														<input class="form-control" type="text" value="<%=rs.getString("landmark") %>" aria-label="Disabled input example" disabled readonly>
													</div>
													<div class="col-auto">
														<input class="form-control" type="text" value="<%=rs.getString("area") %>" aria-label="Disabled input example" disabled readonly>
													</div>
													<div class="col-auto">
														<input class="form-control" type="text" value="<%=rs.getString("city") %>" aria-label="Disabled input example" disabled readonly>
													</div>
													<div class="col-auto">
														<input class="form-control" type="text" value="<%=rs.getString("state") %>" aria-label="Disabled input example" disabled readonly>
													</div>
													<div class="col-auto">
														<input class="form-control" type="text" value="<%=rs.getInt("pincode") %>" aria-label="Disabled input example" disabled readonly>
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
        						<form action="#" method="post">
        							<input type="hidden" value="<%=rs.getInt("id") %>" name="id">
        							<button type="submit" name="delete" class="btn btn-danger">Delete</button>
        						</form>
        					</td>
        				</tr>
        			<%		
        				}
        			%>
        			</tbody>
        		</table>
        		<%
        			if(request.getParameter("delete")!=null){
        				int id = Integer.parseInt(request.getParameter("id"));
        				ps = con.prepareStatement("delete from users where id = ?");
        				ps.setInt(1, id);
        				ps.executeUpdate();
        				response.sendRedirect("DashboardUserPage.jsp");
					}
        		%>
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