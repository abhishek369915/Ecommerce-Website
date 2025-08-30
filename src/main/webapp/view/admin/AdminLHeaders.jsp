<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Pro Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="E-Commerce Admin Dashboard Login">
  <meta name="keywords" content="ecommerce, admin, dashboard, login">
  <meta name="author" content="Your Company Name">
  
  <!-- Favicon -->
  <link rel="icon" href="assets/favicon.ico" type="image/x-icon">
  
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  
  <!-- Custom CSS -->
  <style>
    :root {
      --primary-color: #4e73df;
      --secondary-color: #2e59d9;
      --accent-color: #f8f9fc;
      --dark-color: #5a5c69;
    }
    
    body {
      background-color: #f8f9fc;
      font-family: 'Nunito', sans-serif;
    }
    
    .login-card {
      border-radius: 0.5rem;
      box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
      border: none;
    }
    
    .toggle-password {
      border-left: none;
    }
    
    .toggle-password:hover {
      background-color: #e9ecef;
    }
    
    .form-control:focus, .form-select:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
    }
    
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }
    
    .btn-primary:hover {
      background-color: var(--secondary-color);
      border-color: var(--secondary-color);
    }
    
    .input-group-text {
      transition: all 0.3s;
    }
    
    .input-group:focus-within .input-group-text {
      color: var(--primary-color);
    }
  </style>
</head>