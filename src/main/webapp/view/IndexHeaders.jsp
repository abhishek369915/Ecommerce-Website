<%@page import="java.util.List"%>
<%@page import="com.example.dao.CartDAO"%>
<%@page import="com.example.model.Cart"%>
<%@page import="com.example.model.Category"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.model.Category" %>
<%@ page import="com.example.dao.CategoryDAO" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
<%
    CategoryDAO dao = new CategoryDAO();  
    ArrayList<Category> categoryList = dao.ShowCategories();         
    int count = 1; %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ColorShop - Explore Categories</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@800;900&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary: #6a11cb;
            --secondary: #2575fc;
            --accent: #ff3366;
            --success: #00c9a7;
            --warning: #ffd166;
            --light: #f8f9fa;
            --dark: #212529;
            --card-gradient-1: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            --card-gradient-2: linear-gradient(135deg, #ff3366 0%, #ff758c 100%);
            --card-gradient-3: linear-gradient(135deg, #00c9a7 0%, #92fe9d 100%);
            --card-gradient-4: linear-gradient(135deg, #ff7e5f 0%, #feb47b 100%);
            --card-gradient-5: linear-gradient(135deg, #834d9b 0%, #d04ed6 100%);
            --card-gradient-6: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom, #f5f7fa, #e4e8f0);
            color: #333;
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }
        
        .navbar-brand {
            font-family: 'Montserrat', sans-serif;
            font-weight: 900;
            font-size: 2rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: -1px;
        }
        
        .navbar-brand span {
            color: var(--accent);
        }
        
        .nav-link {
            font-weight: 500;
            color: #555;
            transition: all 0.3s;
            position: relative;
            padding: 8px 15px !important;
            border-radius: 50px;
        }
        
        .nav-link:hover, .nav-link:focus {
            color: var(--primary);
            background: rgba(106, 17, 203, 0.05);
        }
        
        .nav-link i {
            margin-right: 8px;
            font-size: 1.1rem;
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 5rem 0 4rem;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }
        
        .hero-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.1)" d="M0,128L48,117.3C96,107,192,85,288,101.3C384,117,480,171,576,170.7C672,171,768,117,864,112C960,107,1056,149,1152,165.3C1248,181,1344,171,1392,165.3L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-size: cover;
            background-position: bottom;
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
        }
        
        .hero-title {
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        
        .hero-subtitle {
            font-size: 1.5rem;
            max-width: 600px;
            margin: 0 auto 2rem;
            opacity: 0.9;
        }
        
        .category-card {
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            position: relative;
            background: white;
        }
        
        .category-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            z-index: 5;
        }
        
        .card-gradient {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            opacity: 0.8;
        }
        
        .card-img-top {
            height: 220px;
            object-fit: cover;
            position: relative;
            z-index: 2;
            transition: transform 0.5s ease;
        }
        
        .category-card:hover .card-img-top {
            transform: scale(1.1);
        }
        
        .card-body {
            padding: 25px;
            position: relative;
            z-index: 3;
            background: white;
        }
        
        .card-title {
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: var(--dark);
        }
        
        .card-text {
            color: #666;
            margin-bottom: 25px;
            min-height: 60px;
        }
        
        .btn-explore {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border: none;
            border-radius: 50px;
            padding: 10px 30px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            font-size: 0.9rem;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
        }
        
        .btn-explore:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(106, 17, 203, 0.4);
        }
        
        .badge-wishlist {
            position: absolute;
            top: 15px;
            right: 15px;
            background: white;
            color: var(--accent);
            border-radius: 50%;
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }
        
        .badge-wishlist:hover {
            transform: scale(1.1);
            background: var(--accent);
            color: white;
        }
        
        .search-box {
            position: relative;
            width: 100%;
            max-width: 400px;
        }
        
        .search-box input {
            padding: 12px 20px;
            padding-right: 50px;
            border-radius: 50px;
            border: 2px solid #e2e8f0;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .search-box input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(106, 17, 203, 0.15);
        }
        
        .search-box button {
            position: absolute;
            right: 5px;
            top: 5px;
            border: none;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }
        
        .search-box button:hover {
            transform: rotate(10deg) scale(1.1);
        }
        
        .login-btn {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border: none;
            border-radius: 50px;
            padding: 8px 25px;
            font-weight: 600;
            color: white;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
        }
        
        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(106, 17, 203, 0.4);
        }
        
        .brand-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            height: 100%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            border: 1px solid #f0f0f0;
        }
        
        .brand-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .brand-img {
            height: 70px;
            object-fit: contain;
            margin-bottom: 15px;
            filter: grayscale(100%);
            transition: all 0.3s;
        }
        
        .brand-card:hover .brand-img {
            filter: grayscale(0);
        }
        
        .brand-title {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 5px;
        }
        
        .footer {
            background: linear-gradient(135deg, #2c3e50, #1a2530);
            color: white;
            padding: 5rem 0 2rem;
            margin-top: 5rem;
            position: relative;
        }
        
        .footer::before {
            content: "";
            position: absolute;
            top: -100px;
            left: 0;
            width: 100%;
            height: 100px;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%232c3e50" d="M0,192L48,197.3C96,203,192,213,288,229.3C384,245,480,267,576,261.3C672,256,768,224,864,197.3C960,171,1056,149,1152,165.3C1248,181,1344,235,1392,261.3L1440,288L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-size: cover;
            background-position: center;
        }
        
        .section-title {
            position: relative;
            margin-bottom: 3rem;
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            text-align: center;
        }
        
        .section-title::after {
            content: "";
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 5px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border-radius: 10px;
        }
        
        .social-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            margin-right: 10px;
            transition: all 0.3s;
        }
        
        .social-link:hover {
            transform: translateY(-5px);
            background: linear-gradient(to right, var(--primary), var(--secondary));
        }
        
        .newsletter-form {
            display: flex;
            margin-top: 20px;
        }
        
        .newsletter-form input {
            flex: 1;
            padding: 12px 15px;
            border: none;
            border-radius: 50px 0 0 50px;
        }
        
        .newsletter-form button {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            border: none;
            padding: 0 25px;
            border-radius: 0 50px 50px 0;
            font-weight: 600;
        }
        
        .footer-link {
            color: #bbb;
            text-decoration: none;
            transition: all 0.3s;
            display: block;
            margin-bottom: 10px;
        }
        
        .footer-link:hover {
            color: white;
            transform: translateX(5px);
        }
        
        .category-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 5px 15px;
            border-radius: 50px;
            margin: 5px;
            font-size: 0.9rem;
            transition: all 0.3s;
        }
        
        .category-badge:hover {
            background: white;
            color: var(--primary);
        }
        
        .banner {
            background: linear-gradient(135deg, var(--accent), #ff758c);
            color: white;
            padding: 15px 0;
            margin: 30px 0;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(255, 51, 102, 0.2);
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
            }
            
            .navbar-brand {
                font-size: 1.5rem;
            }
        }
        /* Success Alert Style */
.alert-success-temporary {
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 9999;
    animation: fadeInOut 4s ease-in-out forwards;
    opacity: 0;
    width: auto;
    max-width: 80%;
    box-shadow: 0 5px 15px rgba(0,0,0,0.15);
}

@keyframes fadeInOut {
    0% { opacity: 0; top: 0; }
    20% { opacity: 1; top: 20px; }
    80% { opacity: 1; top: 20px; }
    100% { opacity: 0; top: 0; }
}
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-palette me-2"></i>Ecommerce<span>Website</span>
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- Search Box -->
                <div class="search-box me-3">
                    <input type="text" class="form-control" placeholder="Search products..." name="searchQuery">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </div>
                
                <ul class="navbar-nav me-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-list me-1"></i> Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
                            <li><h6 class="dropdown-header">Popular Categories</h6></li>
                            <li><a class="dropdown-item" href="#electronics"><i class="fas fa-laptop me-2"></i>Electronics</a></li>
                            <li><a class="dropdown-item" href="#fashion"><i class="fas fa-tshirt me-2"></i>Fashion</a></li>
                            <li><a class="dropdown-item" href="#home"><i class="fas fa-home me-2"></i>Home & Kitchen</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="categories.jsp"><i class="fas fa-arrow-right me-2"></i>View All</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="deals.jsp"><i class="fas fa-bolt me-1"></i> Today's Deals</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="track-order.jsp"><i class="fas fa-truck me-1"></i> Track Order</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item me-2">
                        <a class="nav-link position-relative" href="wishlist.jsp" title="Wishlist">
                            <i class="fas fa-heart"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                        </a>
                    </li>
                    <!-- CART -->
                    <%
// Get the cart items from DAO
CartDAO cartDAO = new CartDAO();
List<Cart> cartItems = cartDAO.getAllItems();

// Get the number of items in cart
int cartItemCount = cartItems.size();

// If you need the cart IDs in an array
int[] cartIds = new int[cartItemCount];
for(int i = 0; i < cartItemCount; i++) {
    cartIds[i] = cartItems.get(i).getCartId();
}
%>

<!-- Example usage in a loop -->
<% for(int i = 0; i < cartItemCount; i++) { %>
    <div>Cart ID: <%= cartItems.get(i).getCartId() %></div>
<% } %>
                    
                    
                    <li class="nav-item me-3">
                        <a class="nav-link position-relative" href="/EcommerceWebsite/view/Customer/showCart.jsp" title="Cart">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary"><%= cartItemCount %></span>
                        </a>
                    </li>
                    
                    <!-- Login Button -->
                    <li class="nav-item">
                        <a class="login-btn" href="loginpage.jsp">
                            <i class="fas fa-sign-in-alt me-2"></i>Login
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

   <!-- Hero Section -->
<section class="hero-section">
    <div class="container text-center hero-content">
        <h1 class="hero-title">Explore Our Vibrant Categories</h1>
        <p class="hero-subtitle">Discover a world of colorful products that will transform your shopping experience</p>
        <div class="mt-4">
            <% for(Category cat : categoryList) { %>
                <span class="category-badge"><%=cat.getCategoryName() %></span>
            <% } %>
        </div>
    </div>
</section>
