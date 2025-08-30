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


<!DOCTYPE html>
<html lang="en">
<jsp:include page="IndexHeaders.jsp"/>
<!-- Categories Section - This should be outside the loop -->
<section class="categories-section py-5">
    <div class="container">
        <div class="row">
            <% for(Category cat : categoryList) { %>
                <!-- Category Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="category-card card h-100">
                        <div class="card-gradient" style="background: var(--card-gradient-1);"></div>
                        <div class="position-relative">
                            <img src="/uploads/<%=cat.getCategoryPic() %>" class="card-img-top" alt="<%=cat.getCategoryName() %>">
                            <div class="badge-wishlist" title="Add to Wishlist">
                                <i class="fas fa-heart"></i>
                            </div>
                        </div>
                        <div class="card-body text-center">
                            <h3 class="card-title"><%=cat.getCategoryName() %></h3>
                            <img src="/uploads/<%=cat.getCategoryPic() %>" height="100px" width="100px" alt="Category Pic" class="img-thumbnail">
                            <a href="/EcommerceWebsite/view/Customer/ExploreProducts.jsp?categoryName=<%=cat.getCategoryName() %>" class="btn btn-explore text-white">Explore Collection</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</section>
    <!-- Special Offer Banner -->
    <div class="container">
        <div class="banner">
            <div class="container">
                <h2 class="mb-0"><i class="fas fa-gift me-3"></i>Summer Special: Get 30% OFF on All Fashion Items! Use Code: <strong>SUMMER30</strong></h2>
            </div>
        </div>
    </div>

    <!-- Featured Brands Section -->
    <section class="brands-section py-5">
        <div class="container">
            <h2 class="section-title">Featured Brands</h2>
            <div class="row g-4">
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="brand-card">
                        <img src="https://via.placeholder.com/120x60?text=TechPro" alt="TechPro" class="brand-img">
                        <h4 class="brand-title">TechPro</h4>
                        <p class="text-muted small">Electronics</p>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="brand-card">
                        <img src="https://via.placeholder.com/120x60?text=StyleHub" alt="StyleHub" class="brand-img">
                        <h4 class="brand-title">StyleHub</h4>
                        <p class="text-muted small">Fashion</p>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="brand-card">
                        <img src="https://via.placeholder.com/120x60?text=HomeLife" alt="HomeLife" class="brand-img">
                        <h4 class="brand-title">HomeLife</h4>
                        <p class="text-muted small">Home & Kitchen</p>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="brand-card">
                        <img src="https://via.placeholder.com/120x60?text=BookWorm" alt="BookWorm" class="brand-img">
                        <h4 class="brand-title">BookWorm</h4>
                        <p class="text-muted small">Books & Media</p>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="brand-card">
                        <img src="https://via.placeholder.com/120x60?text=Glamour" alt="Glamour" class="brand-img">
                        <h4 class="brand-title">Glamour</h4>
                        <p class="text-muted small">Beauty</p>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="brand-card">
                        <img src="https://via.placeholder.com/120x60?text=ActiveX" alt="ActiveX" class="brand-img">
                        <h4 class="brand-title">ActiveX</h4>
                        <p class="text-muted small">Sports</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5">
                    <h3 class="mb-4"><i class="fas fa-palette me-2"></i>ColorShop</h3>
                    <p class="mb-4">Your one-stop destination for colorful and vibrant shopping experiences. Quality products at affordable prices.</p>
                    <div class="social-icons mb-4">
                        <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-pinterest"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-youtube"></i></a>
                    </div>
                    <h5 class="mb-3">Subscribe to Newsletter</h5>
                    <form class="newsletter-form">
                        <input type="email" placeholder="Your email address" name="email">
                        <button type="submit">Join</button>
                    </form>
                </div>
                <div class="col-lg-2 col-md-4 mb-5">
                    <h5 class="mb-4">Quick Links</h5>
                    <a href="#" class="footer-link">Home</a>
                    <a href="#" class="footer-link">About Us</a>
                    <a href="#" class="footer-link">Products</a>
                    <a href="#" class="footer-link">New Arrivals</a>
                    <a href="#" class="footer-link">Best Sellers</a>
                    <a href="#" class="footer-link">Special Offers</a>
                </div>
                <div class="col-lg-2 col-md-4 mb-5">
                    <h5 class="mb-4">Customer Service</h5>
                    <a href="#" class="footer-link">FAQs</a>
                    <a href="#" class="footer-link">Shipping Policy</a>
                    <a href="#" class="footer-link">Return Policy</a>
                    <a href="#" class="footer-link">Privacy Policy</a>
                    <a href="#" class="footer-link">Terms & Conditions</a>
                    <a href="#" class="footer-link">Contact Us</a>
                </div>
                <div class="col-lg-4 col-md-4 mb-5">
                    <h5 class="mb-4">Contact Us</h5>
                    <p class="mb-3"><i class="fas fa-map-marker-alt me-2"></i> 123 Color Street, Design District, CA 90210</p>
                    <p class="mb-3"><i class="fas fa-phone me-2"></i> +1 (555) 123-4567</p>
                    <p class="mb-4"><i class="fas fa-envelope me-2"></i> info@colorshop.com</p>
                    <h5 class="mb-3">Payment Methods</h5>
                    <img src="https://via.placeholder.com/250x40?text=Credit+Cards+Accepted" alt="Payment Methods" class="img-fluid">
                </div>
            </div>
            <hr class="bg-light my-4">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    <p class="mb-0">&copy; 2023 ColorShop. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="#" class="footer-link me-3">Privacy Policy</a>
                    <a href="#" class="footer-link me-3">Terms of Service</a>
                    <a href="#" class="footer-link">Sitemap</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Add to wishlist functionality
        document.querySelectorAll('.badge-wishlist').forEach(button => {
            button.addEventListener('click', function() {
                this.classList.toggle('active');
                if (this.classList.contains('active')) {
                    this.innerHTML = '<i class="fas fa-check"></i>';
                    this.style.background = '#00c9a7';
                    // Here you would typically make an AJAX call to add to wishlist
                    setTimeout(() => {
                        this.innerHTML = '<i class="fas fa-heart"></i>';
                        this.style.background = 'white';
                    }, 1500);
                }
            });
        });
        
        // Animation on scroll
        const observerOptions = {
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        document.querySelectorAll('.category-card, .brand-card').forEach(card => {
            observer.observe(card);
        });

        // Search functionality
        document.querySelector('.search-box button').addEventListener('click', function() {
            const searchQuery = document.querySelector('.search-box input').value;
            if (searchQuery.trim() !== '') {
                alert(`Searching for: ${searchQuery}`);
                // In a real application, this would submit the search form
            }
        });
        
        // Press Enter in search box
        document.querySelector('.search-box input').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.querySelector('.search-box button').click();
            }
        });
        
     // Check for success parameter in URL
        const urlParams = new URLSearchParams(window.location.search);
        const resParam = urlParams.get('res');

        if (resParam === '1') {
            // Create and show success alert
            const alertDiv = document.createElement('div');
            alertDiv.className = 'alert alert-success alert-success-temporary';
            alertDiv.innerHTML = '<i class="fas fa-check-circle me-2"></i> Your order was successfully completed!';
            document.body.appendChild(alertDiv);
            
            // Remove the alert after 4 seconds
            setTimeout(() => {
                alertDiv.remove();
                // Remove the res parameter from URL without reloading
                const newUrl = window.location.pathname + window.location.search.replace(/[?&]res=1/, '');
                window.history.replaceState({}, document.title, newUrl);
            }, 4000);
        }
        
    </script>
</body>
</html>