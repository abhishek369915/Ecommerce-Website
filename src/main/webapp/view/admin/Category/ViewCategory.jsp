<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dao.CategoryDAO"%>
<%@page import="com.example.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Commerce - Categories</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

	<%
	if(request.getParameter("res")!=null){
		int res = Integer.parseInt(request.getParameter("res"));
		if(res == 2){
%>
			<div class="alert alert-success">
				<strong>Failed!</strong> Category Updated.
			</div>
<%
		} else if(res == 3){
%>
			<div class="alert alert-danger">
				<strong>Success!</strong> Category Not Updated.
			</div>
<%
		} else if(res == 4){
%>
			<div class="alert alert-success">
				<strong>Success!</strong> Category Pic Updated.
			</div>
<%
		} else if(res == 5){
%>
			<div class="alert alert-danger">
				<strong>Failed!</strong> Category Pic Not Updated.
			</div>
<%
		} else if(res == 0){
%>
			<div class="alert alert-danger">
				<strong>Success!</strong> Category Deleted.
			</div>
<%
		} else if(res == 1){
%>
			<div class="alert alert-danger">
				<strong>Failed!</strong> Category Not Deleted.
			</div>
<%
		}
	}
%>


	<div class="container mt-5">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1>Categories</h1>
			<a href="AddCategory.jsp" class="btn btn-primary"> <i
				class="fas fa-plus"></i> Add New Category
			</a>
		</div>

		<div class="card shadow-sm">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<%
	CategoryDAO dao = new CategoryDAO();  
    ArrayList<Category> categoryList = dao.ShowCategories();         
    int count = 1; 
%>
						<thead class="table-dark">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Category Name</th>
								<th scope="col">Actions</th>
								<th scope="col">Category Pic</th>
							</tr>
						</thead>
						<tbody>

							<%
for(Category cat : categoryList) { %>
							<tr>
								<td name="categoryId"><%= cat.getCategoryId()%></td>
								<td name="categoryName"><%= cat.getCategoryName() %></td>

								<td>
    <a href="EditCategory.jsp?categoryId=<%= cat.getCategoryId()%>&categoryName=<%= cat.getCategoryName() %>" class="btn btn-sm btn-warning">
        <i class="fas fa-edit"></i> Edit
    </a>
    <a href="/EcommerceWebsite/DeleteCategory?categoryId=<%= cat.getCategoryId()%>" class="btn btn-sm btn-danger">
        <i class="fas fa-trash"></i> Delete
    </a>
</td>
<td>
    <a href="/EcommerceWebsite/view/admin/Category/UpdateCategoryPic.jsp?categoryId=<%= cat.getCategoryId()%>&categoryName=<%= cat.getCategoryName() %>">
        <img src="/uploads/<%=cat.getCategoryPic() %>" height="100px" width="100px" alt="Category Pic" class="img-thumbnail">
    </a>
</td>



							</tr>
							<%
}
%>
							<!-- Delete Confirmation Modal -->
							<div class="modal fade" id="deleteModal" tabindex="-1"
								aria-labelledby="deleteModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">Confirm
												Delete</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Are you sure you want to delete
											this category?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancel</button>
											<button type="button" class="btn btn-danger"
												id="confirmDeleteBtn">Delete</button>
										</div>
									</div>
								</div>
							</div>

							<!-- Bootstrap 5 JS Bundle with Popper -->
							<script
								src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>