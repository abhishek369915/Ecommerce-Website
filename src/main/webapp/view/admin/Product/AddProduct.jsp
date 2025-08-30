<!DOCTYPE html>
<%@page import="com.example.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dao.CategoryDAO"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Product</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<style>
:root {
	--primary: #4361ee;
	--secondary: #3a0ca3;
	--accent: #f72585;
	--light: #f8f9fa;
	--dark: #212529;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: #f5f7fa;
	min-height: 100vh;
	display: flex;
	align-items: center;
}

.form-container {
	max-width: 800px;
	background: white;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.form-header {
	background: linear-gradient(135deg, var(--primary) 0%, var(--secondary)
		100%);
	color: white;
	padding: 1.5rem;
	text-align: center;
}

.form-header h2 {
	margin-bottom: 0;
	font-weight: 600;
}

.form-body {
	padding: 2rem;
}

.form-label {
	font-weight: 500;
	margin-bottom: 0.5rem;
}

.form-control, .form-select {
	border-radius: 8px;
	padding: 0.75rem 1rem;
	border: 1px solid #e0e0e0;
	transition: all 0.3s;
}

.form-control:focus, .form-select:focus {
	border-color: var(--primary);
	box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
}

.image-upload-container {
	border: 2px dashed #e0e0e0;
	border-radius: 8px;
	padding: 1.5rem;
	text-align: center;
	background-color: #f9f9f9;
	cursor: pointer;
	transition: all 0.3s;
}

.image-upload-container:hover {
	border-color: var(--primary);
	background-color: rgba(67, 97, 238, 0.05);
}

.image-upload-icon {
	font-size: 2.5rem;
	color: var(--primary);
	margin-bottom: 1rem;
}

.image-preview {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 8px;
	margin-right: 10px;
	margin-bottom: 10px;
	border: 1px solid #e0e0e0;
}

.btn-submit {
	background: var(--primary);
	color: white;
	border: none;
	border-radius: 8px;
	padding: 0.75rem 2rem;
	font-weight: 500;
	transition: all 0.3s;
	width: 100%;
}

.btn-submit:hover {
	background: var(--secondary);
	transform: translateY(-2px);
}

.form-section {
	margin-bottom: 1.5rem;
	padding: 1.5rem;
	background: white;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.section-title {
	font-weight: 600;
	color: var(--primary);
	margin-bottom: 1.5rem;
	display: flex;
	align-items: center;
}

.section-title i {
	margin-right: 10px;
	font-size: 1.2rem;
}
</style>
</head>
<body>
	<div class="container py-5">
		<div class="form-container mx-auto">
			<!-- Form Header -->
			<div class="form-header">
				<h2>
					<i class="bi bi-plus-circle"></i> Add New Product
				</h2>
			</div>

			<!-- Form Body -->
			<form class="form-body" action="/EcommerceWebsite/AddProduct"
				method="post" enctype="multipart/form-data">
				<!-- Basic Information Section -->
				<div class="form-section">
					<h5 class="section-title">
						<i class="bi bi-info-circle"></i> Basic Information
					</h5>
					
					<%
					CategoryDAO dao = new CategoryDAO();
					ArrayList<Category> categoryList = dao.ShowCategories();
					int count=1;
					%>



					<div class="row mb-3">
						<div class="col-md-6 mb-3 mb-md-0">
							<label for="category" class="form-label">Category</label> <select
								class="form-select" id="categoryName" name="categoryName" required>
								
								<option value="" selected disabled>Select category</option>
								<% for(Category cat: categoryList){%>
								<option value="<%=cat.getCategoryName()%>"><%=cat.getCategoryName() %></option>
								 <%}%>
								</select>
						</div>
						<div class="col-md-6">
							<label for="productName" class="form-label">Product Name</label>
							<input type="text" class="form-control" id="productName"
								name="productName" placeholder="Enter product name" required>
						</div>
					</div>

					<div class="mb-3">
						<label for="description" class="form-label">Description</label>
						<textarea class="form-control" id="description" name="description"
							rows="3" placeholder="Enter product description" required></textarea>
					</div>
				</div>

				<!-- Pricing Section -->
				<div class="form-section">
					<h5 class="section-title">
						<i class="bi bi-tag"></i> Pricing Information
					</h5>

					<div class="row">
						<div class="col-md-6 mb-3 mb-md-0">
							<label for="cost" class="form-label">Cost Price</label>
							<div class="input-group">
								<span class="input-group-text">$</span> <input type="number"
									class="form-control" id="cost" name="cost" step="0.01" min="0"
									placeholder="0.00" required>
							</div>
						</div>
						<div class="col-md-6">
							<label for="discount" class="form-label">Discount (%)</label>
							<div class="input-group">
								<span class="input-group-text">%</span> <input type="number"
									class="form-control" id="discount" name="discount" min="0"
									max="100" placeholder="0" value="0">
							</div>
						</div>
					</div>
				</div>

				<!-- Images Section -->
				<div class="form-section">
					<h5 class="section-title">
						<i class="bi bi-images"></i> Product Images
					</h5>

					<div class="row">

						<div class="mb-3">
							<label for="emppic" class="form-label">Upload Product Pic</label>
							<input type="file" class="form-control" id="productImage1"
								name="productImage1" accept="image/*" required>
						</div>
						<div class="mb-3">
							<label for="emppic" class="form-label">Upload Product
								Pic2</label> <input type="file" class="form-control" id="productImage2"
								name="productImage2" accept="image/*">
						</div>


						<!-- Image 3 -->
						<div class="mb-3">
							<label for="emppic" class="form-label">Upload Product
								Pic3</label> <input type="file" class="form-control" id="productImage3"
								name="productImage3" accept="image/*">
						</div>

						<!-- Submit Button -->
						<button type="submit" class="btn btn-submit mt-4"
							name="submitProduct">
							<i class="bi bi-check-circle me-2"></i> Add Product
						</button>
			</form>
		</div>
	</div>

	<!-- Bootstrap 5 JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Image Preview Script -->
</body>
</html>