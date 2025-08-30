<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Category | E-Commerce Admin</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4e73df;
            --success-color: #1cc88a;
            --border-color: #e3e6f0;
        }
        
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .category-form-container {
            max-width: 600px;
            margin: 2rem auto;
            background: white;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .form-header {
            border-bottom: 1px solid var(--border-color);
            padding: 1rem 1.5rem;
            background-color: #f8f9fc;
            border-radius: 0.35rem 0.35rem 0 0;
        }
        
        .form-body {
            padding: 1.5rem;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
        }
        
        .btn-submit {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }
        
        .btn-submit:hover {
            background-color: #17a673;
            border-color: #17a673;
        }
        
        .is-invalid {
            border-color: #e74a3b;
        }
        
        .invalid-feedback {
            color: #e74a3b;
        }
    </style>
</head>
<body>


<%
	if(request.getParameter("res")!=null){
		int res=Integer.parseInt(request.getParameter("res"));
		if(res==1){
			%>
			<div class="alert alert-success">
		  <strong>Success!</strong> Category Added.
		</div>
			
			<%
		}else if(res==0){
			%>
			<div class="alert alert-danger">
		  <strong>Failed!</strong> Category Not Added.
		</div>
			<%
		}
	}


%>


    <div class="container py-5">
        <div class="category-form-container">
            <!-- Form Header -->
            <div class="form-header">
                <h3 class="h4 mb-0 text-gray-800">
                    <i class="bi bi-tag me-2"></i>Add New Category
                </h3>
            </div>
            
            <!-- Form Body -->
            <div class="form-body">
                <form id="categoryForm" action="../../../AddCategory" method="post" enctype="multipart/form-data">
                    <!-- Category Name Field -->
                    <div class="mb-4">
                        <label for="categoryName" class="form-label fw-semibold">
                            Category Name <span class="text-danger">*</span>
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-tag-fill"></i>
                            </span>
                            <input type="text" 
                                   class="form-control" 
                                   id="categoryName" 
                                   name="categoryName" 
                                   placeholder="e.g. Electronics, Clothing, Furniture" 
                                   required
                                   minlength="2"
                                   maxlength="50">
                        </div>
                        <div class="invalid-feedback">
                            Please provide a valid category name (2-50 characters).
                        </div>
                    </div>
                    
                    <div class="mb-3">
							<label for="emppic" class="form-label">Upload Product
								Pic3</label> <input type="file" class="form-control" id="productImage3"
								name="categoryPic" accept="image/*">
						</div>
                    
                    
                    <!-- Form Actions -->
                    <div class="d-flex justify-content-between mt-5">
                       <a href="../AdminDashboard.jsp" class="btn btn-outline-secondary">
    <i class="bi bi-arrow-left me-2"></i>Cancel
</a>
                        <button type="submit" class="btn btn-submit text-white">
                            <i class="bi bi-save me-2"></i>Save Category
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>