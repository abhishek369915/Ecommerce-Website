<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product Pic</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    int productCode = Integer.parseInt(request.getParameter("productCode"));
%>

<div class="container mt-5 card p-4">
    <form action="/EcommerceWebsite/UpdateProductPic" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="productCode" value="<%=productCode%>">

        <div class="mb-3">
            <label for="categoryPic" class="form-label">Upload 1st Product Pic to Update</label>
            <input type="file" class="form-control" id="productImage1" name="productImage1" accept="image/*" required>
        </div>
        
        <div class="mb-3">
            <label for="categoryPic" class="form-label">Upload 2nd Product Pic to Update</label>
            <input type="file" class="form-control" id="productImage2" name="productImage2" accept="image/*" required>
        </div>
        
        <div class="mb-3">
            <label for="categoryPic" class="form-label">Upload 3rd Product Pic to Update</label>
            <input type="file" class="form-control" id="productImage3" name="productImage3" accept="image/*" required>
        </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/EcommerceWebsite/view/admin/Product/ViewProducts.jsp?res=5" class="btn btn-danger">Cancel</a>
    </form>
</div>
</body>
</html>
