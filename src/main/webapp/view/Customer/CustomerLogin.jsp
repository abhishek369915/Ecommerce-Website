<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
        }
        
        body {
            background-color: var(--secondary-color);
            height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .login-container {
            max-width: 450px;
            margin: 0 auto;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: white;
            animation: fadeIn 0.5s ease-in-out;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header i {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
        
        .login-header h2 {
            color: var(--primary-color);
            font-weight: 700;
        }
        
        .form-floating label {
            padding-left: 2.5rem;
        }
        
        .form-control {
            padding-left: 2.5rem;
            height: 50px;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 5;
        }
        
        .btn-login {
            background-color: var(--primary-color);
            border: none;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-login:hover {
            background-color: #3a5ccc;
        }
        
        .forgot-password {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 20px;
        }
        
        .register-link {
            text-align: center;
            margin-top: 20px;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <i class="fas fa-user-circle"></i>
                <h2>Customer Login</h2>
                <p class="text-muted">Please enter your credentials to login</p>
            </div>
            
            <form action="/EcommerceWebsite/CustomerLoginValidate" method="post" >
                <!-- Email Field -->
                <div class="form-floating mb-3 position-relative">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" class="form-control" id="emailId" name="emailId" placeholder="Email Address" required>
                    <label for="emailId">Email Address</label>
                </div>
                
                <!-- Password Field -->
                <div class="form-floating mb-2 position-relative">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                    <label for="password">Password</label>
                </div>
                
                <!-- Forgot Password Link -->
                <div class="forgot-password">
                    <a href="forgotPassword.jsp" class="text-decoration-none">Forgot Password?</a>
                </div>
                
                <!-- Login Button -->
                <button type="submit" class="btn btn-primary btn-login w-100">
                    <i class="fas fa-sign-in-alt me-2"></i>Login
                </button>
                
                <!-- Register Link -->
                <div class="register-link mt-4">
                    <p>Don't have an account? <a href="/EcommerceWebsite/view/Customer/RegisterCustomer.jsp" class="text-decoration-none">Register here</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Optional: Form validation script -->
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const email = document.getElementById('emailId').value;
            const password = document.getElementById('password').value;
            
            // Simple validation
            if (!email.includes('@')) {
                alert('Please enter a valid email address');
                e.preventDefault();
            }
         
        });
    </script>
</body>
</html>