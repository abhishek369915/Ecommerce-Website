<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.example.dao.CartDAO"%>
<%@page import="com.example.model.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.Customer"%>
<%@page import="com.example.dao.ProductsDAO"%>
<%@page import="com.example.model.Cart"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #6c5ce7;
            --secondary-color: #a29bfe;
            --accent-color: #fd79a8;
            --light-color: #f8f9fa;
            --dark-color: #2d3436;
            --success-color: #00b894;
            --danger-color: #d63031;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        .cart-header {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(108, 92, 231, 0.2);
        }
        
        .cart-item {
            background-color: white;
            border-radius: 15px;
            margin-bottom: 20px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 5px solid var(--primary-color);
        }
        
        .cart-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .product-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }
        
        .product-image:hover {
            transform: scale(1.05);
        }
        
        .product-title {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 5px;
        }
        
        .product-code {
            color: var(--secondary-color);
            font-size: 0.9rem;
            font-weight: 600;
        }
        
        .product-description {
            color: #636e72;
            font-size: 0.9rem;
            margin: 10px 0;
        }
        
        .price-tag {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.2rem;
        }
        
        .discount-tag {
            color: var(--success-color);
            font-weight: 600;
        }
        
        .final-price {
            font-weight: 800;
            color: var(--dark-color);
            font-size: 1.3rem;
        }
        
        .quantity-selector {
            width: 100px;
            border-radius: 50px;
            border: 2px solid var(--secondary-color);
            text-align: center;
            padding: 5px 10px;
            font-weight: 600;
        }
        
        .delete-btn {
            background-color: var(--danger-color);
            color: white;
            border: none;
            border-radius: 50px;
            padding: 8px 15px;
            transition: all 0.3s ease;
        }
        
        .delete-btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        
        .summary-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-top: 5px solid var(--primary-color);
        }
        
        .summary-title {
            color: var(--primary-color);
            font-weight: 700;
            border-bottom: 2px dashed #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        
        .summary-label {
            color: #636e72;
            font-weight: 600;
        }
        
        .summary-value {
            font-weight: 700;
        }
        
        .total-value {
            color: var(--primary-color);
            font-size: 1.3rem;
        }
        
        .checkout-btn {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: 50px;
            padding: 12px 30px;
            font-weight: 700;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.4);
            width: 100%;
            margin-top: 20px;
        }
        
        .checkout-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(108, 92, 231, 0.6);
        }
        
        .empty-cart {
            text-align: center;
            padding: 50px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .empty-cart-icon {
            font-size: 5rem;
            color: var(--secondary-color);
            margin-bottom: 20px;
        }
        
        .empty-cart-text {
            color: var(--dark-color);
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 20px;
        }
        
        .continue-shopping {
            color: var(--primary-color);
            font-weight: 700;
            text-decoration: none;
        }
        
        .continue-shopping:hover {
            text-decoration: underline;
        }
        
        .cart-animation {
            animation: fadeInUp 0.5s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    
    <script>
    function changeQuantity(totalProducts,slno, productCost, discountAmount){
        //alert("slno:" + slno +", " + productCost +", " + discount);
        
        let qty = parseInt(document.getElementById("qty"+slno).value);
        console.log("qty=" + qty);
        
        let productCost1 = (qty * productCost);
        document.getElementById("productCost"+slno).innerHTML = productCost1;
        
        let finalCost = (qty * productCost) - (qty * discountAmount);
        document.getElementById("discountAmount"+slno).innerHTML = ""+(qty * discountAmount);
        
        document.getElementById("finalCost"+slno).innerHTML = ""+finalCost;
        
        let totalProductsCost = 0;
        let totalDiscountAmount = 0;
        let payableAmount = 0;
        for(let i=1; i<=totalProducts; i++){
            console.log('inside loop...');
            let productCost = parseInt(document.getElementById('productCost'+i).innerHTML);
            totalProductsCost += productCost;
            
            let discountAmount = parseInt(document.getElementById('discountAmount'+i).innerHTML);
            totalDiscountAmount += discountAmount;
            
            let finalCost = parseInt(document.getElementById('finalCost'+i).innerHTML);
            payableAmount += finalCost;
            
        }
        
        document.getElementById("totalProductsCost").innerHTML = "" + totalProductsCost; 
        document.getElementById("totalDiscountAmount").innerHTML = "" + totalDiscountAmount; 
        document.getElementById("payableAmount").innerHTML = "" + payableAmount; 
    }
    </script>
</head>
<body>
<%
Cart cart = (Cart) session.getAttribute("cart");
Customer customer = (Customer)session.getAttribute("customer");
if(customer == null) {  //customer not login
    response.sendRedirect("/EcommerceWebsite/view/Customer/CustomerLogin.jsp");
}

ProductsDAO dao = new ProductsDAO();
ArrayList<Products> pList = dao.ViewProducts();
%>

<div class="container py-5">
    <div class="cart-header text-center">
        <h1><i class="fas fa-shopping-cart me-2"></i> Your Shopping Cart</h1>
        <p class="mb-0">Review and manage your items before checkout</p>
    </div>
    
    <div class="row">
        <div class="col-lg-8">
            <%
            CartDAO catDAO = new CartDAO();
            List<Cart> clist = catDAO.getAllItems();
            
            if(clist.isEmpty()) {
            %>
                <div class="empty-cart cart-animation">
                    <div class="empty-cart-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <div class="empty-cart-text">
                        Your cart is empty
                    </div>
                    <a href="/EcommerceWebsite/view/customer/Products.jsp" class="continue-shopping">
                        <i class="fas fa-arrow-left me-2"></i>Continue Shopping
                    </a>
                </div>
            <%
            } else {
                int slno=0;
                double totalProductsCost = 0.0, totalDiscountAmout=0.0, payableAmount=0.0;
                int totalProducts = clist.size();
            %>
            <form name='f1' method='post' action='payment.jsp'>
                <%
                for(Cart c :  clist){
                    slno++;
                    ProductsDAO dao1 = new ProductsDAO();
                    Products product = dao1.GetProductByProductCode(c.getProductcode());
                    double discountAmount= product.getDiscount()/100.0* product.getCost();
                    
                    totalProductsCost += product.getCost();
                    totalDiscountAmout += discountAmount;
                    payableAmount += (product.getCost() - discountAmount);
                %>
                <div class="cart-item p-4 mb-4 cart-animation">
                    <div class="row align-items-center">
                        <div class="col-md-3 mb-3 mb-md-0">
                            <img src="/uploads/<%=product.getProductImage1() %>" class="product-image" alt="<%=product.getProductName()%>">
                        </div>
                        <div class="col-md-5">
                            <h4 class="product-title"><%=product.getProductName()%></h4>
                            <div class="product-code">Code: <%=product.getProductCode()%></div>
                            <div class="product-description"><%=product.getDescription()%></div>
                            
                            <div class="mt-3">
                                <span class="me-3 price-tag">₹<span id='productCost<%=slno%>'><%=product.getCost() %></span></span>
                                <span class="discount-tag"><i class="fas fa-tag me-1"></i>Save ₹<span id='discountAmount<%=slno%>'><%=discountAmount %></span></span>
                            </div>
                            <div class="final-price mt-2">Final: ₹<span id='finalCost<%=slno%>'><%=product.getCost() - discountAmount %></span></div>
                        </div>
                        <div class="col-md-2">
                            <input type="number" id="qty<%=slno%>" name="qty<%=slno%>" 
                                   value="1" min="1" 
                                   onchange="changeQuantity(<%=totalProducts%>,<%=slno%>, <%=product.getCost()%>,<%=discountAmount%>)"
                                   class="quantity-selector">
                        </div>
                        <div class="col-md-2 text-center">
                            <a href="/EcommerceWebsite/deleteCartItem?cartId=<%=c.getCartId() %>" class="delete-btn">
                                <i class="fas fa-trash-alt me-1"></i> Remove
                            </a>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
            </div>
            
            <div class="col-lg-4">
                <div class="summary-card sticky-top" style="top: 20px;">
                    <h3 class="summary-title"><i class="fas fa-receipt me-2"></i> Order Summary</h3>
                    
                    <div class="summary-item">
                        <span class="summary-label">Subtotal:</span>
                        <span class="summary-value">₹<span id='totalProductsCost'><%=totalProductsCost %></span></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Discount:</span>
                        <span class="summary-value text-success">-₹<span id='totalDiscountAmount'><%=totalDiscountAmout %></span></span>
                    </div>
                    
                    <div class="summary-item pt-3" style="border-top: 1px dashed #eee;">
                        <span class="summary-label"><strong>Total:</strong></span>
                        <span class="summary-value total-value">₹<span id='payableAmount'><%=payableAmount %></span></span>
                    </div>
                    
                    <button type="submit" name="submit" class="checkout-btn">
                        <i class="fas fa-lock me-2"></i> PROCEED TO CHECKOUT
                    </button>
                    
                    <div class="text-center mt-3">
                        <a href="/EcommerceWebsite/view/customer/Products.jsp" class="continue-shopping">
                            <i class="fas fa-arrow-left me-1"></i> Continue Shopping
                        </a>
                    </div>
                </div>
            </div>
            </form>
            <%
            }
            %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>