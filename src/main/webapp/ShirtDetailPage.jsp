<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*"%>
<%
HttpSession ses = request.getSession(false);
String userName = (ses != null) ? (String) ses.getAttribute("unsername") : null;
String email = (ses != null) ? (String) ses.getAttribute("email") : null;
String city = (ses != null) ? (String) ses.getAttribute("city") : null;
Integer productId = (ses != null) ? (Integer) ses.getAttribute("productId") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product details</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet" href="./css/style.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

html, body {
	position: relative;
	height: 100%;
}

body {
	/* background: #eee; */
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	margin: 0;
	padding: 0;
}

.productImg {
	height: 620px;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	/* background: #fff; */
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper {
	width: 100%;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
}

.swiper-slide {
	background-size: cover;
	background-position: center;
}

.mySwiper2 {
	height: 80%;
	width: 100%;
}

.mySwiper {
	height: 20%;
	box-sizing: border-box;
	padding: 10px 0;
}

.mySwiper .swiper-slide {
	width: 25%;
	height: 100%;
	opacity: 0.4;
}

.mySwiper .swiper-slide-thumb-active {
	opacity: 1;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%
	String path = "jdbc:mysql://localhost:3306/styloxfashionhub";
	String username = "root";
	String SqlPassword = "root";
	Connection con = null;
	String[] colorsArray;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(path, username, SqlPassword);
		PreparedStatement ps = con.prepareStatement("select * from products where id = ?");
		ps.setInt(1, productId);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			String colors = rs.getString("colors");
			String[] colorArray = colors.split(",");
			String size = rs.getString("sizes");
			String[] sizeArray = size.split(",");
			String image = rs.getString("pImg");
			String[] imagesName = image.split(",");
			String catogary = rs.getString("catogary");
			
	%>
	<section
		class="container-fluid shadow nav-bar d-flex justify-content-between align-items-center shadow-sm">
		<button class="btn" type="button" data-bs-toggle="offcanvas"
			data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
			<i class="fa-solid fa-bars fs-3 text-dark"></i>
		</button>
		<div class="offcanvas offcanvas-start" tabindex="-1"
			id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title fs-2 fw-bold" id="offcanvasExampleLabel">Menu</h5>
				<button type="button" class="btn-close fs-5 text-dark"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body mx-0 px-0">
				<ul class="main-nav px-0 mx-0 h-75">
					<li class="py-2 ps-3 w-100"><a class="text-dark"
						href="./index.jsp">HOME</a></li>
					<li class="py-2 ps-3 w-100"><a class="text-dark" href="#">ABOUT
							US</a></li>
					<li class="py-2 ps-3 w-100 dropdown"><a class="text-dark"
						data-bs-toggle="collapse" href="#collapseExample" role="button"
						aria-expanded="false" aria-controls="collapseExample">SHOP
							ONLINE</a></li>
					<div class="collapse " id="collapseExample">
						<div class="card card-body border-0  ps-0 pe-4">
							<ul class=" ">
								<li><a href="./ShirtsPage.jsp"
									class="text-dark text-uppercase">Shirts</a></li>
								<hr class="mt-2">
								<li><a href="./BottomWearPage.jsp"
									class="text-dark text-uppercase">Bottom Wear</a></li>
								<hr class="mt-2">
								<li><a href="./FootwearPage.jsp"
									class="text-dark text-uppercase">Footwear</a></li>
								<hr class="mt-2">
								<li><a href="./accesoriesPage.jsp"
									class="text-dark text-uppercase">Accesories</a></li>
								<hr class="mt-2">
								<li><a href="./undergarmentsPage.jsp"
									class="text-dark text-uppercase">Undergarments</a></li>
								<hr class="mt-2">
							</ul>
						</div>
					</div>
					<li class="py-2 ps-3 w-100"><a class="text-dark" href="#">STORE
							LOCATOR</a></li>
					<li class="py-2 ps-3 w-100"><a class="text-dark" href="#">MEDIA</a></li>
					<li class="py-2 ps-3 w-100"><a class="text-dark" href="#">CONTACT</a></li>
				</ul>
			</div>
		</div>
		<div class=" d-flex justify-content-center">
			<h1 class="fs-2 fw-bold d-flex flex-column justify-content-center">
				<a class="text-dark" href="#">STYLOX</a> <span class=""
					style="line-height: 0; font-size: 13px; font-weight: 400; letter-spacing: 2px;">Fashion
					Hub</span>
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
					<h5 class="offcanvas-title" id="offcanvasRightLabel">My
						Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body p-0 d-flex flex-column ">
					<div class="bg-light py-4 mx-0">
						<div class="w-50 mx-auto py-2">
							<img src="./images/illustration/account.png" alt="profileImg"
								class="img-fluid">
						</div>
						<div class="w-50 mx-auto text-center">
							<h5><%=userName%></h5>
							<p><%=email%></p>
							<p><%=city%></p>
						</div>
					</div>
					<a class="rounded-0 btn btn-outline-secondary text-center "
						href="logout.jsp">LogOut</a>
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
			<a class="d-block d-lg-none" data-bs-toggle="offcanvas"
				href="#offcanvasRight" role="button"
				aria-controls="offcanvasExample"><i
				class="fa-regular fa-user fs-4 my-auto text-dark"></i> </a>
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
						<li class="breadcrumb-item"><a href="./ShirtsPage.jsp">Shirts</a></li>
						<li class="breadcrumb-item" aria-current="page">Details</li>
					</ol>
				</nav>
			</div>
		</section>
	</header>
	<main>

		<section class="container py-5">
			<div class="row py-4 px-3 rounded-3 bg-light">
				<div class="col-12 col-lg-6">
					<div class="productImg">
						<div
							style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
							class="swiper mySwiper2">
							<div class="swiper-wrapper">
								<%
								for (int i = 0; i < imagesName.length; i++) {
								%>
								<div class="swiper-slide">
									<img
										src="./images/illustration/<%=catogary %>/<%=imagesName[i] %>" alt="<%=imagesName[i] %>" />
								</div>
								<%
								}
								%>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
						<div thumbsSlider="" class="swiper mySwiper">
							<div class="swiper-wrapper">
								<%
								for (int i = 0; i < imagesName.length; i++) {
								%>
								<div class="swiper-slide">
									<img
										src="./images/illustration/<%=catogary %>/<%=imagesName[i] %>" alt="<%=imagesName[i] %>"/>
								</div>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-6">
					<div class="py-5">
						<div class="border-bottom">
							<h1 class="text-uppercase fw-bold fs-3"><%=rs.getString("pName")%></h1>
							<p class="text-secondary"><%=rs.getString("pDetail")%></p>
							<span class="fs-2 fw-bold ">&#8377; <%=rs.getInt("prize")%></span>
						</div>
						<div class="py-4">
							<%
								if(userName == null){
							%>
							<form action="login.jsp" method="post" >
							<%
								}else{
							%>
							<form action="addToCartServlet" method="post" >
							<%		
								}
							%>
								<label>select color</label>
								<%
								for (int i = 0; i < colorArray.length; i++) {
								%>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="selectedColors" value="<%=colorArray[i]%>" id="<%=colorArray[i]%>" required> <label
										class="form-check-label" for="<%=colorArray[i]%>"><%=colorArray[i]%></label>
								</div>
								<%
								}
								%>
								<select class="form-select my-3"
									aria-label="Default select example" name="selectedSize" required>
									<option selected>Open this select Size</option>
									<%
									for (int i = 0; i < sizeArray.length; i++) {
									%>
									<option class="text-uppercase text-bold"
										value="<%=sizeArray[i]%>"><%=sizeArray[i]%></option>
									<%
									}
									%>
								</select>
								<input type="hidden" value="<%=productId %>" name="ProductId">
								<input type="hidden" value="1" name="quantity"/>
								<%
								if(userName == null){
								%>
								<div class="py-4">
									<p class="fw-medium text-danger">Please Login First!!</p>
									<button class="btn btn-outline-dark rounded-0" type="submit"
										name="addToCart">Log In</button>
								</div>
								<%
								}else{
								%>
								<div class="py-4">
									<button class="btn btn-outline-dark rounded-0" type="submit"
										name="addToCart">Add To Cart</button>
								</div>
								<%	
								}
								%>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<footer class="pt-5">
		<section class="container-fluid footer">
			<div class="row w-100 py-5">
				<menu
					class="col-12 col-md-6 col-lg-4 d-flex align-items-center justify-content-center">
					<li><a href="#" class="pe-4 text-dark">Support</a></li>
					<li><a href="#" class="pe-4 text-dark">Terms</a></li>
					<li><a href="#" class="pe-4 text-dark">Returns</a></li>
				</menu>
				<div
					class="col-12 col-md-6 col-lg-4 d-flex align-items-center justify-content-center">
					<p class="text-center">Copyright 2025 &#169; Stylox Fashion Hub
						Pvt. Ltd.</p>
				</div>
				<div
					class="col-12 col-md-6 col-lg-4 d-flex align-items-center justify-content-center">
					<a href="#" class="pe-4"><i
						class="bi bi-facebook fs-4 text-dark"></i></a> <a href="#"
						class="pe-4"><i class="bi bi-instagram fs-4 text-dark"></i></a> <a
						href="#"><i class="bi bi-whatsapp fs-4 text-dark"></i></a>
				</div>
			</div>
		</section>
		<%
		}
		} catch (Exception e) {
		e.getMessage();
		}
		%>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script>
		var swiper = new Swiper(".mySwiper", {
			loop : true,
			spaceBetween : 5,
			slidesPerView : 4,
			freeMode : true,
			watchSlidesProgress : true,
		});
		var swiper2 = new Swiper(".mySwiper2", {
			loop : true,
			spaceBetween : 5,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			thumbs : {
				swiper : swiper,
			},
		});
	</script>
</body>
</html>