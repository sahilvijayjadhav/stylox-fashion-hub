<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*"%>
<%
HttpSession ses = request.getSession(false);
String userName = (ses != null) ? (String) ses.getAttribute("unsername") : null;
String email = (ses != null) ? (String) ses.getAttribute("email") : null;
String city = (ses != null) ? (String) ses.getAttribute("city") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Men's Shirts Wear</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

        <section class="options container py-5">
            <div class="d-flex align-item-center justify-content-center">
                <div class="btn-group btn-group-sm " role="group" aria-label="Basic outlined example">
                    <button type="button" onclick="shirtsSelect('shirts')" class="btn btn-outline-primary Buttons">Shirts</button>
                    <button type="button" onclick="shirtsSelect('tshirts')" class="btn btn-outline-primary Buttons">T-Shirts</button>
                    <button type="button" onclick="shirtsSelect('hoodies')" class="btn btn-outline-primary Buttons">Hoodies</button>
                    <button type="button" onclick="shirtsSelect('jackets')" class="btn btn-outline-primary Buttons">Jackets</button>
                </div>
            </div>
        </section>
        <section class="container-fluid">
            <div class="row" id="shirtSection">
                <h2 class="pb-4">Men's Shirts</h2>
                <%
                	String path = "jdbc:mysql://localhost:3306/styloxfashionhub";
                	String username = "root";
                	String SqlPassword = "root";
                	Connection con = null;
                	Statement st = null;
                	try{
                		Class.forName("com.mysql.cj.jdbc.Driver");
                    	con = DriverManager.getConnection(path, username, SqlPassword);
                    	st = con.createStatement();
                    	ResultSet rs = st.executeQuery("SELECT * FROM products where catogary = 'shirts'");
                    	while(rs.next()){
                    		int id = rs.getInt("id");
                    		String imageNames = rs.getString("pImg");
                    		int comma = imageNames.indexOf(",");
                    		if(comma == -1){
                    			comma = imageNames.length();
                    		}
                    		String image = imageNames.substring(0, comma);
                    		String name = rs.getString("pName");
                    		int prize = rs.getInt("prize");
                %>
                <div class="col-6 col-md-4 col-lg-3">
                	<div class="w-100 py-3 shirt-card">
                		<img class="img-fluid" src="./images/illustration/shirts/<%=image %>" alt="<%=image %>">
                		<div class="text-center product-detail">
                			<p class="py-3 mb-0"><%=name %></p>
                			<Span class="fs-4">&#8377; <%=prize %></Span>
                			<form action="#" method="post">
                				<input type="hidden" name="id" value="<%=id %>">
                				<button type="submit" name="shopnow" class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto">Shop Now</button>
                			</form>
                		</div>
                	</div>
                </div>
                <%	
                
                		if(request.getParameter("shopnow")!=null){
                			int productId = Integer.parseInt(request.getParameter("id"));
                			ses.setAttribute("productId", productId);
                			response.sendRedirect("ShirtDetailPage.jsp");
                		}
                	}
                }catch(Exception e){
                	e.getMessage();
                }
                %>
            </div>
            <div class="row d-none" id="tshirtSection">
                <h2 class="pb-4">Men's Tshirts</h2>
                <%
                	try{
                		Class.forName("com.mysql.cj.jdbc.Driver");
                    	con = DriverManager.getConnection(path, username, SqlPassword);
                    	st = con.createStatement();
                    	ResultSet rs = st.executeQuery("SELECT * FROM products where catogary = 'tshirts'");
                    	while(rs.next()){
                    		int id = rs.getInt("id");
                    		String imageNames = rs.getString("pImg");
                    		int comma = imageNames.indexOf(",");
                    		if(comma == -1){
                    			comma = imageNames.length();
                    		}
                    		String image = imageNames.substring(0, comma);
                    		String name = rs.getString("pName");
                    		int prize = rs.getInt("prize");
                %>
                <div class="col-6 col-md-4 col-lg-3">
                	<div class="w-100 py-3 shirt-card">
                		<img class="img-fluid" src="./images/illustration/tshirts/<%=image %>" alt="<%=image %>">
                		<div class="text-center product-detail">
                			<p class="py-3 mb-0"><%=name %></p>
                			<Span class="fs-4">&#8377; <%=prize %></Span>
                			<form action="#" method="post">
                				<input type="hidden" name="id" value="<%=id %>">
                				<button type="submit" name="shopnow" class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto">Shop Now</button>
                			</form>
                		</div>
                	</div>
                </div>
                <%	
		                if(request.getParameter("shopnow")!=null){
		        			int productId = Integer.parseInt(request.getParameter("id"));
		        			ses.setAttribute("productId", productId);
		        			response.sendRedirect("ShirtDetailPage.jsp");
		        		}
                	}
                }catch(Exception e){
                	e.getMessage();
                }
                %>
            </div>
            <div class="row d-none" id="hoodieSection">
                <h2 class="pb-4">Men's Hoodies</h2>
                <%
                	try{
                		Class.forName("com.mysql.cj.jdbc.Driver");
                    	con = DriverManager.getConnection(path, username, SqlPassword);
                    	st = con.createStatement();
                    	ResultSet rs = st.executeQuery("SELECT * FROM products where catogary = 'hoddies'");
                    	while(rs.next()){
                    		int id = rs.getInt("id");
                    		String imageNames = rs.getString("pImg");
                    		int comma = imageNames.indexOf(",");
                    		if(comma == -1){
                    			comma = imageNames.length();
                    		}
                    		String image = imageNames.substring(0, comma);
                    		String name = rs.getString("pName");
                    		int prize = rs.getInt("prize");
                %>
                <div class="col-6 col-md-4 col-lg-3">
                	<div class="w-100 py-3 shirt-card">
                		<img class="img-fluid" src="./images/illustration/hoddies/<%=image %>" alt="<%=image %>">
                		<div class="text-center product-detail">
                			<p class="py-3 mb-0"><%=name %></p>
                			<Span class="fs-4">&#8377; <%=prize %></Span>
                			<form action="#" method="post">
                				<input type="hidden" name="id" value="<%=id %>">
                				<button type="submit" name="shopnow" class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto">Shop Now</button>
                			</form>
                		</div>
                	</div>
                </div>
                <%		
                		if(request.getParameter("shopnow")!=null){
		        			int productId = Integer.parseInt(request.getParameter("id"));
		        			ses.setAttribute("productId", productId);
		        			response.sendRedirect("ShirtDetailPage.jsp");
        				}
                	}
                }catch(Exception e){
                	e.getMessage();
                }
                %>
            </div>
            <div class="row d-none" id="jacketSection">
                <h2 class="pb-4">Men's Jacket</h2>
                <%
                	try{
                		Class.forName("com.mysql.cj.jdbc.Driver");
                    	con = DriverManager.getConnection(path, username, SqlPassword);
                    	st = con.createStatement();
                    	ResultSet rs = st.executeQuery("SELECT * FROM products where catogary = 'jacket'");
                    	while(rs.next()){
                    		int id = rs.getInt("id");
                    		String imageNames = rs.getString("pImg");
                    		int comma = imageNames.indexOf(",");
                    		if(comma == -1){
                    			comma = imageNames.length();
                    		}
                    		String image = imageNames.substring(0, comma);
                    		String name = rs.getString("pName");
                    		int prize = rs.getInt("prize");
                %>
                <div class="col-6 col-md-4 col-lg-3">
                	<div class="w-100 py-3 shirt-card">
                		<img class="img-fluid" src="./images/illustration/jacket/<%=image %>" alt="<%=image %>">
                		<div class="text-center product-detail">
                			<p class="py-3 mb-0"><%=name %></p>
                			<Span class="fs-4">&#8377; <%=prize %></Span>
                			<form action="#" method="post">
                				<input type="hidden" name="id" value="<%=id %>">
                				<button type="submit" name="shopnow" class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto">Shop Now</button>
                			</form>
                		</div>
                	</div>
                </div>
                <%		
		                if(request.getParameter("shopnow")!=null){
		        			int productId = Integer.parseInt(request.getParameter("id"));
		        			ses.setAttribute("productId", productId);
		        			response.sendRedirect("ShirtDetailPage.jsp");
						}
                	}
                }catch(Exception e){
                	e.getMessage();
                }
                %>
            </div>
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