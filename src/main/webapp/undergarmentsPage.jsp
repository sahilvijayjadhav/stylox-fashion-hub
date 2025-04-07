<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                    <li class="py-2 ps-3 w-100"><a class="text-dark" href="./index.html">HOME</a></li>
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
            <a class="pe-3 d-none d-lg-block" href="./login.html">
                <i class="fa-regular fa-user fs-4 my-auto text-dark"></i>
            </a>
            <a class="pe-3" href="#">
                <i class="fa-regular fa-heart fs-4 my-auto text-dark"></i>
            </a>
            <a class="pe-3" href="#">
                <i class="fa-solid fa-cart-shopping fs-4 my-auto text-dark"></i>
            </a>
            <a class="btn btn-outline-dark pe-3 rounded-0 d-none d-lg-block" style="font-size: 14px; font-weight: 600;" href="#">Admin</a>
            <button class="px-1 moblil-view-btn btn dropdown-toggle d-block d-lg-none" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-three-dots-vertical fs-4"></i>
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="./login.html">Login</a></li>
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
                      <li class="breadcrumb-item"><a href="./index.html">Home</a></li>
                      <li class="breadcrumb-item" aria-current="page">Undergarments</li>
                    </ol>
                </nav>
            </div>
        </section>
    </header>
    <main>

        <section class="options container py-5">
            <div class="d-flex align-item-center justify-content-center">
                <div class="btn-group btn-group-sm " role="group" aria-label="Basic outlined example">
                    <button type="button" onclick="UnderGarmentsSelect('underShirts')" class="btn btn-outline-primary Buttons">Undershirts</button>
                    <button type="button" onclick="UnderGarmentsSelect('Socks')" class="btn btn-outline-primary Buttons">UnderWear</button>
                    <button type="button" onclick="UnderGarmentsSelect('Underwear')" class="btn btn-outline-primary Buttons">Socks</button>
                </div>
            </div>
        </section>
        <section class="container-fluid">
            <div class="row" id="shirtSection">
                <h2 class="pb-4">Men's Under Shirts</h2>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="w-100 py-3 shirt-card">
                        <a href="#" class="w-100">
                            <img class="img-fluid" src="./images/illustration/banyan1.jpg" alt="banyan1">
                        </a>
                        <div class="text-center product-detail">
                            <p class="py-3 mb-0">Stylox mens Under Shirt</p>
                            <Span class="fs-4">&#8377; 199</Span>
                            <a class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto " href="#">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row d-none" id="tshirtSection">
                <h2 class="pb-4">Men's Socks</h2>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="w-100 py-3 shirt-card">
                        <a href="#" class="w-100">
                            <img class="img-fluid" src="./images/illustration/socks1.jpg" alt="socks1">
                        </a>
                        <div class="text-center product-detail">
                            <p class="py-3 mb-0">Stylox Mens Socks</p>
                            <Span class="fs-4">&#8377; 199</Span>
                            <a class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto " href="#">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row d-none" id="hoodieSection">
                <h2 class="pb-4">Men's Under Wear</h2>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="w-100 py-3 shirt-card">
                        <a href="#" class="w-100">
                            <img class="img-fluid" src="./images/illustration/underwear1.jpg" alt="underwear1">
                        </a>
                        <div class="text-center product-detail">
                            <p class="py-3 mb-0">Stylox Mens Meduim Length Under Wear</p>
                            <Span class="fs-4">&#8377; 199</Span>
                            <a class="btn mt-2 btn-outline-dark rounded-0 d-block mx-auto " href="#">Shop Now</a>
                        </div>
                    </div>
                </div>
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
    <script src="./js/UnderGarmentsPage.js"></script>

</body>
</html>