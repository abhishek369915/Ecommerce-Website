<!DOCTYPE html>
<%@page import="com.example.model.Products"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product View Form</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .gradient-form {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .form-header {
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .form-body {
            padding: 30px;
        }
        
        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.8);
            transition: all 0.3s;
        }
        
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.25);
            border-color: #667eea;
            background-color: white;
        }
        
        .readonly-field {
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .image-preview-container {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        
        .image-preview {
            width: 100px;
            height: 100px;
            border-radius: 10px;
            object-fit: cover;
            border: 2px dashed #ddd;
            background: linear-gradient(45deg, #f3f4f6, #e5e7eb);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9ca3af;
        }
        
        .btn-save {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            border: none;
            border-radius: 50px;
            padding: 10px 30px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(0, 242, 254, 0.3);
        }
        
        .btn-save:hover {
            background: linear-gradient(to right, #3aa8fd, #00d9e1);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 242, 254, 0.4);
        }
        
        .form-label {
            font-weight: 600;
            color: #4b5563;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="gradient-form">
                    <div class="form-header">
                        <h2>Edit Product Details</h2>
                        <p class="mb-0">View and manage product information</p>
                    </div>
                    <%
                    Products product = (Products) session.getAttribute("product");
                    %>
                    
                    
                    <div class="form-body">
                        <form action="/EcommerceWebsite/UpdateProducts" method="post">
                            <!-- Product Code (Unchangeable) -->
                            <div class="mb-4">
                                <label for="productCode" class="form-label">Product Code</label>
                                <input type="text" class="form-control readonly-field" id="productCode" name="productCode" value="<%=product.getProductCode()%>" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="productCode" class="form-label">Category Name</label>
                                <input type="text" class="form-control readonly-field" id="productCode" name="productCode" value="<%=product.getCategoryName()%>">
                            </div>
                            
                            
                            
                            
                            
                            <!-- Product Name -->
                            <div class="mb-4">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" value="<%=product.getProductName()%>">
                            </div>
                            
                            <!-- Description -->
                            <div class="mb-4">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3"><%=product.getDescription()%></textarea>
                            </div>
                            
                            <div class="row">
                                <!-- Discount -->
                                <div class="col-md-6 mb-4">
                                    <label for="discount" class="form-label">Discount</label>
                                    <input type="number" class="form-control" id="discount" name="discount" value="<%=product.getDiscount()%>" min="0" max="100">
                                </div>
                                
                                <!-- Cost -->
                                <div class="col-md-6 mb-4">
                                    <label for="cost" class="form-label">Cost</label>
                                    <input type="number" class="form-control" id="cost" name="cost" value="<%=product.getCost()%>" step="0.01" min="0">
                                </div>
                            </div>  
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <button type="button" class="btn btn-outline-secondary me-md-2">Cancel</button>
                                <button type="submit" class="btn btn-save">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>