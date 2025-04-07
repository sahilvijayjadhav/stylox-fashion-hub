<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
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
        <div class="d-flex align-items-center justify-content-between dropdown">
            <a class="pe-3 d-none d-lg-block" href="./login.jsp">
                <i class="fa-regular fa-user fs-4 my-auto text-dark"></i>
            </a>
            <a class="pe-3" href="#">
                <i class="fa-regular fa-heart fs-4 my-auto text-dark"></i>
            </a>
            <a class="pe-3" href="./cart.jsp">
                <i class="fa-solid fa-cart-shopping fs-4 my-auto text-dark"></i>
            </a>
            <a class="btn btn-outline-dark pe-3 rounded-0 d-none d-lg-block" style="font-size: 14px; font-weight: 600;" href="#">Admin</a>
            <button class="px-1 moblil-view-btn btn dropdown-toggle d-block d-lg-none" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-three-dots-vertical fs-4"></i>
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="./login.jsp">Login</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Admin Login</a></li>
            </ul>
        </div>
    </section>
    <header>
        <section class="CATEGORIES-top">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb py-3">
                      <li class="breadcrumb-item"><a href="./index.jsp">Home</a></li>
                      <li class="breadcrumb-item" aria-current="page">Login</li>
                    </ol>
                </nav>
            </div>
        </section>
    </header>
    <main>
        <section class="container d-flex align-item-center justify-content-center">
            <form class="login-form" action="#" method="post">
                <h2 class="text-center w-100">Login</h2>
                <input type="email" name="email" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Email">
                <input type="password" name="password" id="inputPassword5" class="my-3 border border-dark password rounded-0 form-control" aria-describedby="passwordHelpBlock" placeholder="Password">
                <a href="./forgotPassword.jsp">Forgot your password?</a>
                <div class="pt-4 w-100 d-flex align-item-center justify-content-center">
                    <button type="submit" class="btn btn-dark rounded-0 text-center py-2 px-4 fs-5" name="login">SIGN IN</button>
                </div>
                <div class="d-flex align-item-center justify-content-center pt-2 pb-5">
                    <a class="" href="./register.jsp">Create account</a>
                </div>
            </form>
            <%
            	String path = "jdbc:mysql://localhost:3306/styloxfashionhub";
            	String username = "root";
            	String sqlpassword = "root";
            	Connection con = null;
            	if(request.getParameter("login")!=null){
            		String email = request.getParameter("email");
            		String password = request.getParameter("password");
            		try{
            			Class.forName("com.mysql.cj.jdbc.Driver");
            			con = DriverManager.getConnection(path, username, sqlpassword);
            			PreparedStatement ps = con.prepareStatement("select * from users where email = ? and password = ?");
            			ps.setString(1, email);
            			ps.setString(2, password);
            			ResultSet rs = ps.executeQuery();
            			if(rs.next()){
            				String dbEmail = rs.getString("email");
     						if(dbEmail.equals(email)){
     							HttpSession ses = request.getSession();
                				ses.setAttribute("unsername", rs.getString("name"));
                				ses.setAttribute("email", rs.getString("email"));
                				ses.setAttribute("city", rs.getString("city"));
                				ses.setAttribute("id", rs.getInt("id"));
                				response.sendRedirect("index.jsp");	
     						}
     						else{
     		%>
     							<script>alert("User Not Found!! Please Register Now."); window.location="register.jsp";</script>
     		<%					
     						}
            			}else{
            				//response.sendRedirect("register.jsp");
            %>
            			<script>alert("User Not Found!! Please Register Now."); window.location="register.jsp";</script>
            <%
            			}
            		}catch(Exception e){
            			out.print("error "+e.getMessage());
            		}
            	}
            %>
        </section>
    </main>
    <footer class="mt-5">
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
</body>
</html>