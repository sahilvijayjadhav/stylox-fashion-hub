<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*"%>
    <%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<%
HttpSession ses = request.getSession(false);
String userName = (ses != null) ? (String) ses.getAttribute("unsername") : null;
String email = (ses != null) ? (String) ses.getAttribute("email") : null;
String city = (ses != null) ? (String) ses.getAttribute("city") : null;
Integer id = (ses != null) ? (Integer) ses.getAttribute("id") : null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<section class="container-fluid shadow nav-bar d-flex justify-content-between align-items-center shadow-sm">
        <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
            <i class="fa-solid fa-bars fs-3 text-dark"></i>
        </button>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
              <h5 class="offcanvas-title fs-2 fw-bold" id="offcanvasExampleLabel">Menu</h5>
              <button type="button" class="btn-close fs-5 text-dark" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body mx-0 px-0">
                <ul class="main-nav px-0 mx-0 h-75">
                    <li class="py-2 ps-3 w-100"><a class="text-dark" href="./index.jsp">HOME</a></li>
                    <li class="py-2 ps-3 w-100"><a class="text-dark" href="#">ABOUT US</a></li>
                    <li class="py-2 ps-3 w-100 dropdown"><a class="text-dark" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">SHOP ONLINE</a>
                    </li>
                    <div class="collapse " id="collapseExample">
                        <div class="card card-body border-0  ps-0 pe-4">
                          <ul class=" ">
                            <li><a href="./ShirtsPage.jsp" class="text-dark text-uppercase">Shirts</a></li>
                            <hr class="mt-2">
                            <li><a href="./BottomWearPage.jsp" class="text-dark text-uppercase">Bottom Wear</a></li>
                            <hr class="mt-2">
                            <li><a href="./FootwearPage.jsp" class="text-dark text-uppercase">Footwear</a></li>
                            <hr class="mt-2">
                            <li><a href="./accesoriesPage.jsp" class="text-dark text-uppercase">Accesories</a></li>
                            <hr class="mt-2">
                            <li><a href="./undergarmentsPage.jsp" class="text-dark text-uppercase">Undergarments</a></li>
                            <hr class="mt-2">
                        </ul>
                        </div>
                      </div>
                    <li class="py-2 ps-3 w-100"><a class="text-dark" href="#">STORE LOCATOR</a></li>
                    <li class="py-2 ps-3 w-100"><a class="text-dark" href="#">MEDIA</a></li>
                    <li class="py-2 ps-3 w-100"><a class="text-dark" href="#">CONTACT</a></li>
                </ul>
            </div>
        </div>
        <div class=" d-flex justify-content-center">
            <h1 class="fs-2 fw-bold d-flex flex-column justify-content-center">
                <a class="text-dark" href="#">STYLOX</a>
                <span class="" style="line-height: 0; font-size: 13px; font-weight: 400; letter-spacing: 2px;">Fashion Hub</span>
            </h1>
        </div>
        <div
			class="d-flex align-items-center justify-content-between dropdown">
			<%
			if (userName == null) {
			%>
			<a class="pe-3 d-none d-lg-block" href="./login.jsp"> <i
				class="fa-regular fa-user fs-4 my-auto text-dark"></i>
			</a>
			<%
			} else {
			%>
			<a class="pe-3 d-none d-lg-block text-dark"
				data-bs-toggle="offcanvas" href="#offcanvasRight" role="button"
				aria-controls="offcanvasExample"> Welcome, <%=userName%>
			</a>
			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasRightLabel">My Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body p-0 d-flex flex-column ">
					<div class="bg-light py-4 mx-0">
						<div class="w-50 mx-auto py-2">
							<img src="./images/illustration/account.png" alt="profileImg" class="img-fluid">
						</div>
						<div class="w-50 mx-auto text-center">
							<h5><%=userName %></h5>
							<p><%=email %></p>
							<p><%=city %></p>
						</div>
					</div>
					<a class="rounded-0 btn btn-outline-secondary text-center " href="logout.jsp">LogOut</a>
				</div>
			</div>
			<%
			}
			%>
			<a class="pe-3" href="#"> <i
				class="fa-regular fa-heart fs-4 my-auto text-dark"></i>
			</a> <a class="pe-3" href="./cart.jsp"> <i
				class="fa-solid fa-cart-shopping fs-4 my-auto text-dark"></i>
			</a>
			<%
			if (userName == null) {
			%>
			<a class="btn btn-outline-dark pe-3 rounded-0 d-none d-lg-block"
				style="font-size: 14px; font-weight: 600;" href="./AdminLogin.jsp">Admin</a>
			<%
			}
			%>
			<%
			if (userName == null) {
			%>
			<button
				class="px-1 moblil-view-btn btn dropdown-toggle d-block d-lg-none"
				type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="bi bi-three-dots-vertical fs-4"></i>
			</button>
			<ul class="dropdown-menu">

				<li><a class="dropdown-item" href="./login.jsp">Login</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="./AdminLogin.jsp">Admin Login</a></li>
			</ul>
			<%
			} else {
			%>
			<a class="d-block d-lg-none"
				data-bs-toggle="offcanvas" href="#offcanvasRight" role="button"
				aria-controls="offcanvasExample"><i
				class="fa-regular fa-user fs-4 my-auto text-dark"></i>
			</a>
			<%
			}
			%>
		</div>
    </section>
    <header>
        <section class="CATEGORIES-top">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb py-3">
                      <li class="breadcrumb-item"><a href="./index.jsp">Home</a></li>
                      <li class="breadcrumb-item" aria-current="page">Shirts</li>
                    </ol>
                </nav>
            </div>
        </section>
    </header>
	<main>
		<section class="container table-responsive">
			<h1 class="text-center py-4">My Orders</h1>
			<table class="table table-hover">
				<thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Name</th>
                        <th scope="col">Color</th>
                        <th scope="col">Size</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Prize</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
			<%
				try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/styloxfashionhub","root","root");
					PreparedStatement ps = con.prepareStatement("select * from orders where CustomerId = ?");
					ps.setInt(1, id);
					double TotalOrderPrize = 0;
					ResultSet rs = ps.executeQuery();
					while(rs.next()){
						String orders = rs.getString("product_details");
						JSONArray jsonArray = new JSONArray(orders);
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
								TotalOrderPrize += productTotal;
								String imageNames = rs1.getString("pImg");
	                    		int comma = imageNames.indexOf(",");
	                    		if(comma == -1){
	                    			comma = imageNames.length();
	                    		}
	                    		String image = imageNames.substring(0, comma);
	                    		String catogary = rs1.getString("catogary");
			%>
					<tr>
						<td>
							<img alt="<%=image %>" class="" width="100px" src="./images/illustration/<%=catogary %>/<%=image %>">
						</td>
						<td><%=rs1.getString("pName") %></td>
						<td><%=selectedColor %></td>
						<td><%=selectedSize %></td>
						<td><%=Quantity %></td>
						<td>&#8377; <%=rs1.getInt("prize")  %></td>
						<td>&#8377; <%=productTotal %></td>
						<td><%=rs.getString("ordersStatus") %></td>
					</tr>
			<%
							}
						}
			%>
					
			<%
					}
			%>
					<tr>
            			<td colspan="5" align="right"><strong class="fs-3">Total Price:</strong></td>
            			<td class="fs-3">&#8377; <%=TotalOrderPrize %></td>
            			<td></td>
        			</tr>
			<%
				}catch(Exception e){
					e.getMessage();
				}
			%>  	
                </tbody>
			</table>
		</section>
	</main>
	<footer class="pt-5">
        <section class="container-fluid footer">
            <div class="row w-100 py-5">
                <menu class="col-12 col-md-6 col-lg-4 d-flex align-items-center justify-content-center">
                    <li><a href="#" class="pe-4 text-dark">Support</a></li>
                    <li><a href="#" class="pe-4 text-dark">Terms</a></li>
                    <li><a href="#" class="pe-4 text-dark">Returns</a></li>
                </menu>
                <div class="col-12 col-md-6 col-lg-4 d-flex align-items-center justify-content-center">
                    <p class="text-center">Copyright 2025 &#169; Stylox Fashion Hub Pvt. Ltd.</p>
                </div>
                <div class="col-12 col-md-6 col-lg-4 d-flex align-items-center justify-content-center">
                    <a href="#" class="pe-4"><i class="bi bi-facebook fs-4 text-dark"></i></a>
                    <a href="#" class="pe-4"><i class="bi bi-instagram fs-4 text-dark"></i></a>
                    <a href="#" ><i class="bi bi-whatsapp fs-4 text-dark"></i></a>
                </div>
            </div>
        </section>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./js/shirtPage.js"></script>
</body>
</html>