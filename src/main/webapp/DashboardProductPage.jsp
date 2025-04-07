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
        			<div class="card text-bg-warning">
        				<div class="card-header">
        					Total Products
						</div>
						<div class="card-body">
						<%
							ps = con.prepareStatement("select count(id) as totalProducts from products");
							rs = ps.executeQuery();
							if(rs.next()){
						%>
							<h1><%=rs.getInt("totalProducts") %></h1>
						<%		
							}
						%>
							<h2>Products</h2>
						</div>
						<div class="card-footer">
							<a href="#productsSee" class="text-black">See Details</a>
						</div>
        			</div>
        		</div>
        	</div>
        	<hr>
        	<div id="productsSee table-responsive-md">
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
        					<td colspan="2">
        						<a href="./product-add.jsp" class="btn btn-info">Add Product</a>
        					</td>
        				</tr>
        				<tr>
        					<th scope="col">ID</th>
        					<th scope="col">Product</th>
        					<th scope="col">Product Name</th>
        					<th scope="col">Prize</th>
        					<th scope="col">Quantity</th>
        					<th scope="col">Catogary</th>
        					<th scope="col">Colors & Sizes</th>
        					<th scope="col">Edit</th>
        					<th scope="col">Delete</th>
        				</tr>
        			</thead>
        			<tbody>
        			<%
        				String searchName = request.getParameter("searchName");
        				String sql;
        				if (searchName != null && !searchName.isEmpty()) {
                            sql = "SELECT * FROM products WHERE pName LIKE ?";
                            ps = con.prepareStatement(sql);
                            ps.setString(1, "%" + searchName + "%");
                        } else {
                            sql = "SELECT * FROM products";
                            ps = con.prepareStatement(sql);
                        }
        				rs = ps.executeQuery();
        				while(rs.next()){
        					String colors = rs.getString("colors");
        					String[] colorArray = colors.split(",");
        					String size = rs.getString("sizes");
        					String[] sizeArray = size.split(",");
        					String imageNames = rs.getString("pImg");
                    		int comma = imageNames.indexOf(",");
                    		if(comma == -1){
                    			comma = imageNames.length();
                    		}
                    		String image = imageNames.substring(0, comma);
        			%>
        				<tr>
        					<th scop="row"><%=rs.getInt("id") %></th>
        					<td>
        						<img alt="<%=image %>" class="" width="100px" src="./images/illustration/<%=rs.getString("catogary") %>/<%=image %>">
        					</td>
        					<td><%=rs.getString("pName") %></td>
        					<td>&#8377; <%=rs.getString("prize") %></td>
        					<td><%=rs.getString("quantity") %></td>
        					<td><%=rs.getString("catogary") %></td>
        					<td>
        						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=rs.getInt("id") %>">Colors & Sizes</button>
        						<div class="modal fade" id="exampleModal<%=rs.getInt("id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        							<div class="modal-dialog">
        								<div class="modal-content">
        									<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Colors & Sizes</h1>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										   	</div>
										   	<div class="modal-body">
										   		<h5>Colors</h5>
											<%
												for(int i = 0; i<colorArray.length; i++){
											%>
												<span class="badge text-bg-secondary text-wrap" style="width: 6rem;"><%=colorArray[i] %></span>
											<%		
												}
											%>
												<hr>
												<h5>Sizes</h5>
											<%
												for(int i = 0; i<sizeArray.length; i++){
											%>
												<span class="badge text-bg-secondary text-wrap" style="width: 6rem;"><%=sizeArray[i] %></span>
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
        						<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editDetails<%=rs.getInt("id") %>">Edit</button>
        						<div class="modal fade" id="editDetails<%=rs.getInt("id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        							<div class="modal-dialog">>
        								<div class="modal-content">>
        									<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Edit</h1>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										   	</div>
										   	<div class="modal-body">
										   		<form action="#" method="post" class="row g-3 form-control">
										   			<div class="col-auto">
										   				<input type="text" class="form-control" id="productName" name="productName" value="<%=rs.getString("pName") %>" placeholder="Product Name">
										   			</div>
										   			<div class="col-auto">
										   				<textarea id="ProductDetails" class="form-control" name="ProductDetails"><%=rs.getString("pDetail") %></textarea>
										   			</div>
										   			<div class="col-auto">
										   				<input type="text" id="ProductPrize" class="form-control" name="ProductPrize" value="<%=rs.getString("prize") %>" placeholder="Product Prize">
										   			</div>
										   			<div class="col-auto">
										   				<input type="text" id="ProductQuantity" class="form-control" name="ProductQuantity" value="<%=rs.getString("quantity") %>" placeholder="Quantity">
										   			</div>
										   			<div class="col-auto">
										   				<label for="ProductCatogary">Product Catogary:</label>
												        <select id="ProductCatogary" class="form-select" name="ProductCatogary" required>
														  <option selected><%=rs.getString("catogary") %></option>
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
										   			</div>
										   			<div class="col-auto">
										   				<input type="text" id="ProductSizes" class="form-control" name="ProductSizes" value="<%=rs.getString("sizes") %>" placeholder="Sizes">
										   			</div>
										   			<div class="col-auto">
										   				<input type="text" id="Productcolors" class="form-control" name="Productcolors" value="<%=rs.getString("colors") %>" placeholder="Colors">
										   			</div>
										   			<input type="hidden" name="pId" value="<%=rs.getInt("id") %>">
										   			<button type="submit" name="editDetails" class="btn btn-primary">Update Product</button>
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
        				ps = con.prepareStatement("delete from products where id = ?");
        				ps.setInt(1, id);
        				ps.executeUpdate();
        				response.sendRedirect("DashboardProductPage.jsp");
					}
        			if(request.getParameter("editDetails")!=null){
        				int pId = Integer.parseInt(request.getParameter("pId"));
        				String productName = request.getParameter("productName");
        		        String ProductDetails = request.getParameter("ProductDetails");
        		        int ProductPrize = Integer.parseInt(request.getParameter("ProductPrize"));
        		        int ProductQuantity = Integer.parseInt(request.getParameter("ProductQuantity"));
        		        String ProductCatogary = request.getParameter("ProductCatogary");
        		        String ProductSizes = request.getParameter("ProductSizes");
        		        String Productcolors = request.getParameter("Productcolors");
        		        ps = con.prepareStatement("update products set pName = ?, pDetail = ?, prize = ?, quantity = ?, catogary = ?, sizes = ?, colors = ? where id = ?");
        		        ps.setString(1, productName);
        		        ps.setString(2, ProductDetails);
        		        ps.setInt(3, ProductPrize);
        		        ps.setInt(4, ProductQuantity);
        		        ps.setString(5, ProductCatogary);
        		        ps.setString(6, ProductSizes);
        		        ps.setString(7, Productcolors);
        		        ps.setInt(8, pId);
        		        ps.executeUpdate();
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