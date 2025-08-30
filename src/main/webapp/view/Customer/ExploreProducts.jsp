<%@page import="com.example.model.Cart"%>
<%@page import="com.example.dao.CartDAO"%>
<%@page import="com.example.model.Customer"%>
<%@page import="com.example.model.Products"%>
<%@page import="com.example.dao.ProductsDAO"%>
<%@page import="com.example.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Shipping and Payment Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
:root {
  --primary: #2c3e50;
  --secondary: #3498db;
  --accent: #e74c3c;
  --light: #f8f9fa;
  --dark: #34495e;
  --success: #27ae60;
  --warning: #f39c12;
  --danger: #c0392b;
  --text-color: #555;
  --background: #f0f4f8;
  --card-bg: #ffffff;
  --border-radius: 10px;
  --box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

body {
  padding-top: 60px;
  background-color: var(--background);
}

.sidebar {
  position: sticky;
  top: 80px;
  height: calc(100vh - 120px);
  overflow-y: auto;
  width: 250px;
  background: var(--light);
  padding: 20px;
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}

.sidebar h2 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  color: var(--dark);
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar ul li {
  margin: 10px 0;
}

.sidebar ul li a {
  display: block;
  text-decoration: none;
  color: var(--primary);
  font-size: 1.1rem;
  padding: 8px 12px;
  border-radius: 6px;
  transition: all 0.2s ease;
}

.sidebar ul li a:hover {
  color: var(--accent) !important;
  background-color: rgba(231,76,60,0.1);
}

/* Product Card Styles */
.product-card {
  background-color: white;
  border-radius: var(--border-radius);
  overflow: hidden;
  transition: all 0.3s ease;
  font-weight: 600;
  box-shadow: var(--box-shadow);
  margin-bottom: 25px;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.product-card:hover {
  box-shadow: 0 6px 20px rgba(0,0,0,0.15);
  transform: translateY(-5px);
}

.product-image-container {
  height: 200px;
  overflow: hidden;
  border-radius: 8px 8px 0 0;
  margin: 0;
  padding: 0;
  position: relative;
}

.carousel {
  height: 100%;
  width: 100%;
}

.carousel-inner {
  height: 100%;
  width: 100%;
  margin: 0 auto;
}

.carousel-item {
  height: 100%;
  width: 100%;
}

.product-image-container img {
  height: 100%;
  width: 100%;
  object-fit: cover;
  border-radius: 5px 5px 0 0;
}

.custom-control-btn {
  background-color: rgba(0, 0, 0, 0.5);
  border-radius: 50%;
  width: 36px;
  height: 36px;
  padding: 6px;
  top: 45%;
  transform: translateY(-50%);
}

.custom-control-btn:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  background-size: 70% 70%;
}

.card-body {
  padding: 15px;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}

.card-title {
  font-size: 1.1rem;
  color: var(--primary);
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.rating {
  display: flex;
  align-items: center;
  gap: 4px;
  margin-bottom: 0.5rem;
}

.rating-stars {
  color: #ffc107;
  font-size: 1rem;
}

.rating-value {
  font-size: 0.8rem;
  color: var(--text-color);
}

.card-text {
  color: var(--text-color);
  font-size: 0.85rem;
  margin-bottom: 0.5rem;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.price-info big {
  font-size: 1.2rem;
  color: var(--accent);
  margin-right: 8px;
}

.price-info small {
  font-size: 0.8rem;
  color: #888;
}

.discount {
  font-size: 0.85rem;
  font-weight: 500;
  color: var(--success);
}

.card-footer {
  border-top: 1px solid #eaeaea;
  padding: 10px 15px;
  background: transparent;
  display: flex;
  justify-content: space-between;
  gap: 10px;
}

.btn-wishlist {
  background-color: #f8f9fa;
  color: #dc3545;
  border: 1px solid #dee2e6;
  flex: 1;
}

.btn-wishlist:hover {
  background-color: #dc3545;
  color: white;
}

.btn-addtocart {
  flex: 2;
}

.container-title {
  font-size: 2rem;
  font-weight: 700;
  margin: 2rem 0 1.5rem;
  color: #11e6ec;
  text-align: center;
  border-bottom: 3px solid var(--accent);
  display: inline-block;
  padding-bottom: 0.3rem;
}

/* Grid Layout */
.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

@media (max-width: 992px) {
  .products-grid {
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  }
}

@media (max-width: 768px) {
  .sidebar {
    position: relative;
    top: auto;
    height: auto;
    width: 100%;
    margin-bottom: 1rem;
  }
  
  .products-grid {
    grid-template-columns: repeat(auto-fill, minmax(100%, 1fr));
  }
}

@keyframes slideInOutRight {
  0% {
    opacity: 0;
    transform: translateX(100%);
  }
  10% {
    opacity: 1;
    transform: translateX(0);
  }
  80% {
    opacity: 1;
    transform: translateX(0);
  }
  100% {
    opacity: 0;
    transform: translateX(100%);
  }
}
.alert {
  animation: slideInOutRight 3s ease forwards;
}

.badge-top-right {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 10;
}
</style>
</head>

<body>

<div class="container">
  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-3 mt-4">
      <div class="sidebar">
        <h2>Categories</h2>
        <ul>
          <%
          CategoryDAO catDAO = new CategoryDAO();
          ArrayList<Category> catList = catDAO.ShowCategories();
          for (Category cat : catList) {
          %>
          <li><a href="/EcommerceWebsite/view/index.jsp?categoryName=<%= cat.getCategoryName()%>"><%=cat.getCategoryName()%></a></li>
          <%
          }
          %>
        </ul>
      </div>
    </div>

    <!-- Product Grid -->
    <div class="col-md-9">
      <h1 class="container-title">Products</h1>
      <div class="products-grid">
        <%
        String categoryName = request.getParameter("categoryName");
        ProductsDAO dao = new ProductsDAO();
        ArrayList<Products> prodList = dao.ViewProducts();
        for (Products prod : prodList) {
          if (prod.getCategoryName().equals(categoryName)) {
        %>
        <div class="card product-card">
          <!-- Product Badge -->
          <% if(prod.getDiscount() > 15) { %>
            <span class="badge bg-danger badge-top-right">Save <%= prod.getDiscount() %>%</span>
          <% } %>
          
          <div class="product-image-container">
            <div id="carousel<%=prod.getProductCode()%>" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src='/uploads/<%=prod.getProductImage1()%>' class="d-block w-100 img-fluid h-100" alt="Product Image 1">
                </div>
                <div class="carousel-item">
                  <img src='/uploads/<%=prod.getProductImage2()%>' class="d-block w-100 img-fluid" alt="Product Image 2">
                </div>
                <div class="carousel-item">
                  <img src='/uploads/<%=prod.getProductImage3()%>' class="d-block w-100 img-fluid" alt="Product Image 3">
                </div>
              </div>
              <button class="carousel-control-prev custom-control-btn" type="button" data-bs-target="#carousel<%=prod.getProductCode()%>" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              </button>
              <button class="carousel-control-next custom-control-btn" type="button" data-bs-target="#carousel<%=prod.getProductCode()%>" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
              </button>
            </div>
          </div>
          
          <div class="card-body">
            <h5 class="card-title"><%=prod.getProductName()%></h5>
            <div class="rating">
              <div class="rating-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
              <div class="rating-value">(4.0)</div>
            </div>
            <p class="card-text"><%=prod.getDescription()%></p>
            
            <div class="mt-auto">
              <p class="price-info">
                <big>₹<%=prod.getCost() - (prod.getCost() * prod.getDiscount() / 100)%></big>
                <small>MRP: <del>₹<%=prod.getCost()%></del></small>
              </p>
            </div>
          </div>
          
          <div class="card-footer">
            <%
            Customer customer = (Customer)session.getAttribute("customer");
              CartDAO daoCart = new CartDAO();
              ArrayList<Cart> cartList = daoCart.getAllItems();
              boolean found = false;
              for(Cart cart : cartList){
                if(customer!=null){
                if(cart.getProductcode() == prod.getProductCode() && cart.getCustomerId() == customer.getCustomerId()){
                  found = true;
                  break;
                }
                }
              }
              if(!found){
            %>            
              <button class="btn btn-warning btn-addtocart" name="addToCart" onclick="window.location.href='/EcommerceWebsite/AddtoCart?productCode=<%=prod.getProductCode() %>'">
                <i class="fas fa-shopping-cart"></i> Add to Cart
              </button>
            <%
              }
              else{
            %>
              <button class="btn btn-success btn-addtocart" name="goToCart" onclick="window.location.href='/EcommerceWebsite/view/customer/ViewCart.jsp'">
                <i class="fas fa-check"></i> In Cart
              </button>
            <%
              }
            %>
            
            <button class="btn btn-wishlist" name="addToWishlist">
              <i class="fas fa-heart"></i> Wishlist
            </button>
          </div>
        </div>
        <%
          }
        }
        %>
      </div>
    </div>
  </div>
</div>

<%
  if (request.getParameter("added") != null) {
    int added = Integer.parseInt(request.getParameter("added"));
    if (added == 0) {
%>
<div class="alert alert-danger alert-dismissible position-fixed top-0 end-0 m-3" style="width: 400px; z-index: 9999;">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Failed!</strong> Unable to Add product to cart!.
</div>
<%
    } else if (added == 1) {
%>
<div class="alert alert-success alert-dismissible position-fixed top-0 end-0 m-3" style="width: 400px; z-index: 9999;">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Success!</strong> Added to Cart.
</div>
<%
    }
  }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>