<!DOCTYPE html>
<%@page import="com.example.model.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dao.ProductsDAO"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.gradient-header {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border-radius: 10px 10px 0 0;
}

.gradient-table {
	background: linear-gradient(to right, #f5f7fa 0%, #c3cfe2 100%);
}

.gradient-table thead {
	background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
}

.gradient-table tbody tr:hover {
	background: rgba(255, 255, 255, 0.7);
	transition: all 0.3s ease;
}

.action-btn {
	border-radius: 20px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.edit-btn {
	background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
	border: none;
}

.delete-btn {
	background: linear-gradient(to right, #ff758c 0%, #ff7eb3 100%);
	border: none;
}

.action-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
	border-radius: 5px;
	border: 2px solid white;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

.table-container {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
<%
if (request.getParameter("res") != null) {
    int res = Integer.parseInt(request.getParameter("res"));
    if (res == 1) {
%>
<div class="alert alert-success">
    <strong>Success!</strong> Product Deleted.
</div>
<% } else if (res == 0) { %>
<div class="alert alert-danger">
    <strong>Failed!</strong> Product Not Deleted.
</div>
<% } else if (res == 3) { %>
<div class="alert alert-danger">
    <strong>Failed!</strong> Product Not Updated.
</div>
<% } else if (res == 2) { %>
<div class="alert alert-success">
    <strong>Success!</strong> Product Updated.
</div>
<% } else if(res == 4){ %>
 <div class="alert alert-success">
    <strong>Success!</strong> Product Pic Updated.
</div>
<%
}else if(res==5){%>
<div class="alert alert-danger">
    <strong>Failed!</strong> Product Pic Not Updated.
</div>
<%}
}
%>


	<div class="container py-5">
		<div class="table-container">
			<div class="gradient-header p-4">
				<h2 class="mb-0">
					<i class="bi bi-box-seam"></i> Product Inventory
				</h2>
			</div>

			<div class="table-responsive gradient-table">
				<table class="table table-hover mb-0">

					<%
					ProductsDAO dao = new ProductsDAO();
					ArrayList<Products> proList = dao.ViewProducts();
					int count = 1;
					%>
					<thead>
						<tr>
							<th>Product Code</th>
							<th>Category</th>
							<th>Product Name</th>
							<th>Description</th>
							<th>Discount</th>
							<th>Cost</th>
							<th>Images</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>

						<%
						for (Products product : proList) {
						%>
						<!-- Sample Product Row 1 -->
						<tr>
							<td name="productCode"><%=product.getProductCode()%></td>
							<td name="categoryName"><%=product.getCategoryName()%></td>
							<td name="ProductName"><%=product.getProductName()%></td>
							<td name="description"><%=product.getDescription()%></td>
							<td name="discount"><%=product.getDiscount()%></td>
							<td name="cost"><%=product.getCost()%></td>
							<td>
								<div class="d-flex">
									<a href="/EcommerceWebsite/view/admin/Product/UpdateProductPic.jsp?productCode=<%=product.getProductCode()%>"><img src="/uploads/<%=product.getProductImage1()%>"
										alt="Product 1" class="product-img me-1" name="productImage1">
									<img src="/uploads/<%=product.getProductImage2()%>"
										alt="Product 2" class="product-img me-1" name="productImage2">
									<img src="/uploads/<%=product.getProductImage3()%>"
										alt="Product 3" class="product-img" name="productImage3">
									</a>
								</div>
							</td>
							<td><a
								href="/EcommerceWebsite/EditProducts?productCode=<%=product.getProductCode()%>"><button
										class="btn btn-sm edit-btn action-btn me-2">Edit</button></a> <a
								href="/EcommerceWebsite/DeleteProduct?productCode=<%=product.getProductCode()%>"><button
										class="btn btn-sm delete-btn action-btn">Delete</button></a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</body>
</html>