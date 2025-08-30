<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Category</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String categoryPic = request.getParameter("categoryPic");
%>

<div class="container mt-5 card p-4">
    <form action="/EcommerceWebsite/UpdateCategoryPic" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="categoryId" value="<%=categoryId%>">

        <div class="mb-3">
            <label for="categoryPic" class="form-label">Upload Category Pic to Update</label>
            <input type="file" class="form-control" id="categoryPic" name="categoryPic" accept="image/*" required>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/EcommerceWebsite/view/admin/Category/ViewCategory.jsp?res=5" class="btn btn-danger">Cancel</a>
    </form>
</div>
</body>
</html>
