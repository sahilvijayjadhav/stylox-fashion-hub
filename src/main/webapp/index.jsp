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
<title>Stylox Fashion Hub</title>
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
</head>
<body>
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
								<li><a href="#"
									class="text-dark text-uppercase">Footwear</a></li>
								<hr class="mt-2">
								<li><a href="#"
									class="text-dark text-uppercase">Accesories</a></li>
								<hr class="mt-2">
								<li><a href="#"
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
					<a class="rounded-0 btn btn-outline-secondary text-center " href="./userOrders.jsp">My Orders</a>
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
				style="font-size: 14px; font-weight: 600;" target="_blank" href="./AdminLogin.jsp">Admin</a>
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
		<section class="hero">
			<section class=" hero-section">
				<strong>Stylox <span>Fashion Hub</span></strong>
				<div class="hero-h2">
					<h2>Online Shopping For Men</h2>
					<a class="my-4 rounded-0 btn btn-primary" href="#shop-now">Shop
						Now</a>
				</div>
			</section>
		</section>
	</header>
	<main>
		<section class="container-fluid py-5 mens-brand" id="shop-now">
			<h2 class="mens-brand-h2 py-5">MENS SHOPING CATEGORIES</h2>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<figure>
							<a href="./ShirtsPage.jsp" class="mx-0"> <img
								src="./images/illustration/shirts.jpg" alt="shirts-catalog"
								class="shirts-catalog">
							</a>
							<figcaption>
								<h3>Men's Shirts</h3>
								<a class="btn btn-outline-dark rounded-0"
									href="./ShirtsPage.jsp">Shop Now</a>
							</figcaption>
						</figure>
					</div>
					<div class="swiper-slide">
						<figure>
							<a href="./BottomWearPage.jsp" class="mx-0"> <img
								src="./images/illustration/bottom.jpg" alt="bottom-catalog"
								class="shirts-catalog">
							</a>
							<figcaption>
								<h3>Men's Bottom Wear</h3>
								<a class="btn btn-outline-dark rounded-0"
									href="./BottomWearPage.jsp">Shop Now</a>
							</figcaption>
						</figure>
					</div>
					<div class="swiper-slide">
						<figure>
							<a href="#" class="mx-0"> <img
								src="./images/illustration/footwear.jpeg" alt="footwear-catalog"
								class="shirts-catalog">
							</a>
							<figcaption>
								<h3>Men's Footwear</h3>
								<a class="btn btn-outline-dark rounded-0"
									href="#">Shop Now</a>
							</figcaption>
						</figure>
					</div>
					<div class="swiper-slide">
						<figure>
							<a href="#" class="mx-0"> <img
								src="./images/illustration/accesories.jpg"
								alt="accesories-catalog" class="shirts-catalog">
							</a>
							<figcaption>
								<h3>Men's Accesories</h3>
								<a class="btn btn-outline-dark rounded-0"
									href="#">Shop Now</a>
							</figcaption>
						</figure>
					</div>
					<div class="swiper-slide">
						<figure>
							<a href="#" class="mx-0"> <img
								src="./images/illustration/undergarments.webp"
								alt="undergarments-catalog" class="shirts-catalog">
							</a>
							<figcaption>
								<h3>Men's Undergarments</h3>
								<a class="btn btn-outline-dark rounded-0"
									href="#">Shop Now</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</section>
		<section
			class="ABOUT-us pt-4 pb-3 d-flex align-items-center justify-content-center">
			<div class="text-center px-5">
				<h3>Spot the Best Online Shopping for Men's Fashion at Stylox
					Fashion Hub</h3>
				<p>
					It is our pleasure to introduce Stylox Men's Wear as the ultimate
					store for all men's wear needs. Our products include <strong>Men's
						Formal Shirts, Men's casual wear T-shirts,</strong> Men's Formal and Party
					<strong>Bottom Wear, Men's Suits & Blazers,</strong> and Men's
					Ethnic Wear <strong>Kurta Pajama.</strong> Want to buy normal wear
					or some ethnic wear for any occasion we have it all for you. Make
					your purchases online with convenience and have your products
					delivered right to your home.
				</p>
				<h3>Try Trendy Men's Fashion with Ease</h3>
				<p>There can be nothing easier than shopping for men's fashion.
					Stylox Men's Wear therefore offers you an effortless shopping
					experience to accessorize yourself with the newest trends. Whether
					you are looking for Formal wear such as Men's Suits & Blazers or
					Casual wear like Fashion T-shirts men, or ethnic wear like Men's
					Kurta Pajama we have a good number in stock for you. Every product
					is selected through great consideration so that one gets the best
					comfort and fashion. In addition, there are clear size charts and
					good pictures that make the selection of the desired thing very
					easy.</p>
				<h3>Why Stylox Men's Wear is the Best for Online Shopping?</h3>
				<p>
					We, at Stylox Men's Wear, are committed to providing our customers
					with a hassle-free shopping experience when shopping online.
					Customers enjoy the simple structure of our website, clear
					descriptions of products, and safe methods of payment that do not
					cause any trouble. Starting from <strong>Ethnic &
						Traditional Wear</strong> to casual wear such as <strong>Men's
						Shirts</strong> and <strong>Men's Bottom Wear,</strong> you will be able to
					find clothing pieces that characterise your personality.
					Furthermore, we offer user-friendly services such as easy returns
					and quick delivery services so that you can buy with ease.
				</p>

			</div>
		</section>
	</main>
	<footer>
		<section
			class="d-none d-md-flex follow-section justify-content-end align-items-center">
			<div class="">
				<h2>
					Follow Us on <a href="#" class="btn btn-dark rounded-0">@Stylox_fashion</a>
				</h2>
			</div>
		</section>
		<section class="container-fluid py-4">
			<form class="mx-auto hear py-5">
				<h2 class="text-center py-3">hear from us</h2>
				<p class=" text-center">Be the first to know about new
					collections and exclusive offers.</p>
				<input type="email" class="py-3 px-3 rounded-0 form-control"
					id="exampleFormControlInput1" placeholder="Email">
			</form>
		</section>
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
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script src="./js/script.js"></script>
</body>
</html>