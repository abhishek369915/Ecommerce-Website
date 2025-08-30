<%@page import="com.example.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="card-title">Edit Category</h3>
                    </div>
                    <div class="card-body">
                        <form action="/EcommerceWebsite/UpdateCategory" method="post">
                            <!-- Category ID Field (readonly if needed) -->
                            <div class="mb-3">
      <%
    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
    String categoryName = request.getParameter("categoryName");
%>

<label>Category Id:</label><br>
<!-- Visible categoryId (disabled for editing) -->
<input type="text" class="form-control" id="categoryId" 
       value="<%=categoryId %>" disabled>

<!-- Hidden input to send categoryId -->

<input type="hidden" name="categoryId" value="<%=categoryId %>"><br>

<!-- Editable categoryName -->
<label>Category Name</label><br>
<input type="text" class="form-control" id="categoryName" 
       name="categoryName" value="<%=categoryName %>" required><br>

                            </div>
                            
                            <!-- Form Buttons -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button type="button" class="btn btn-secondary me-md-2" 
                                        onclick="window.history.back()">Cancel</button>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>