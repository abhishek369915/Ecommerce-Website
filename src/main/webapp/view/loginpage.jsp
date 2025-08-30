<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Portal</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3a0ca3;
            --accent: #f72585;
            --employee: #4cc9f0;
            --light: #f8f9fa;
            --dark: #212529;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .portal-container {
            max-width: 1200px;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            background: white;
        }
        
        .portal-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
        }
        
        .portal-header::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
        }
        
        .portal-header::after {
            content: "";
            position: absolute;
            bottom: -80px;
            left: -80px;
            width: 250px;
            height: 250px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
        }
        
        .portal-options {
            display: flex;
            flex-wrap: wrap;
        }
        
        .option-card {
            flex: 1;
            min-width: 300px;
            padding: 2rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .option-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(67,97,238,0.05) 0%, rgba(58,12,163,0.05) 100%);
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .option-card:hover::before {
            opacity: 1;
        }
        
        .option-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .option-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 1.8rem;
        }
        
        .admin-icon {
            background: rgba(67,97,238,0.1);
            color: var(--primary);
        }
        
        .customer-icon {
            background: rgba(247,37,133,0.1);
            color: var(--accent);
        }
        
        .employee-icon {
            background: rgba(76,201,240,0.1);
            color: var(--employee);
        }
        
        .btn-option {
            border-radius: 50px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }
        
        .btn-admin {
            background: var(--primary);
            color: white;
        }
        
        .btn-admin:hover {
            background: #3a56e8;
            color: white;
            transform: translateY(-2px);
        }
        
        .btn-customer {
            background: var(--accent);
            color: white;
        }
        
        .btn-customer:hover {
            background: #e5177b;
            color: white;
            transform: translateY(-2px);
        }
        
        .btn-employee {
            background: var(--employee);
            color: white;
        }
        
        .btn-employee:hover {
            background: #3ab4d8;
            color: white;
            transform: translateY(-2px);
        }
        
        .portal-footer {
            background: var(--light);
            padding: 1.5rem;
            text-align: center;
        }
        
        .divider {
            position: relative;
            margin: 0 0.5rem;
        }
        
        .divider::before {
            content: "OR";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 0 0.5rem;
            color: var(--dark);
            font-weight: 600;
            z-index: 1;
            font-size: 0.8rem;
        }
        
        .divider::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            height: 1px;
            background: rgba(0,0,0,0.1);
        }
        
        @media (max-width: 992px) {
            .option-card {
                min-width: 250px;
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="portal-container mx-auto">
            <!-- Header Section -->
            <div class="portal-header text-center">
                <h1 class="display-5 fw-bold mb-3"><i class="bi bi-shop"></i> E-Commerce Portal</h1>
                <p class="mb-0 opacity-75">Select your login option below</p>
            </div>
            
            <!-- Login Options -->
            <div class="portal-options">
                <!-- Admin Option -->
                <div class="option-card" name="admin_option_area">
                    <div class="option-icon admin-icon">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                    <h3 class="text-center mb-3">Admin Portal</h3>
                    <p class="text-center text-muted mb-4">Manage products, orders, and customer data with full administrative privileges</p>
                    <form action="admin/AdminLogin.jsp" method="post">
                        <input type="hidden" name="user_type" value="admin">
                        <div class="d-grid">
                            <button type="submit" class="btn btn-admin btn-option" name="admin_login_btn">
                                <i class="bi bi-box-arrow-in-right me-2"></i> Admin Login
                            </button>
                        </div>
                    </form>
                </div>
                
                <div class="divider d-none d-md-flex"></div>
                
                <!-- Employee Option -->
                <div class="option-card" name="employee_option_area">
                    <div class="option-icon employee-icon">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <h3 class="text-center mb-3">Employee Portal</h3>
                    <p class="text-center text-muted mb-4">Access inventory, process orders, and manage customer interactions</p>
                    <form action="EmployeeLogin.jsp" method="post">
                        <input type="hidden" name="user_type" value="employee">
                        <div class="d-grid">
                            <button type="submit" class="btn btn-employee btn-option" name="employee_login_btn">
                                <i class="bi bi-box-arrow-in-right me-2"></i> Employee Login
                            </button>
                        </div>
                    </form>
                </div>
                
                <div class="divider d-none d-md-flex"></div>
                
                <!-- Customer Option -->
                <div class="option-card" name="customer_option_area">
                    <div class="option-icon customer-icon">
                        <i class="bi bi-person-check"></i>
                    </div>
                    <h3 class="text-center mb-3">Customer Portal</h3>
                    <p class="text-center text-muted mb-4">Access your orders, wishlist, and account settings</p>
                    <form action="/EcommerceWebsite/view/Customer/CustomerLogin.jsp" method="post">
                        <input type="hidden" name="user_type" value="customer">
                        <div class="d-grid">
                            <button type="submit" class="btn btn-customer btn-option" name="customer_login_btn">
                                <i class="bi bi-box-arrow-in-right me-2"></i> Customer Login
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Footer Section -->
            <div class="portal-footer">
                <p class="mb-0">Don't have an account? <a href="/EcommerceWebsite/view/Customer/RegisterCustomer.jsp" class="text-decoration-none fw-bold" name="register_link">Register here</a></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>