<!DOCTYPE html>
<html lang="en">
<head>
<head>
<jsp:include page="AdminLHeaders.jsp"/>
<head>
  <meta charset="UTF-8">
  <title>Admin Pro Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
</head>
</head>



<body class="bg-light">
    <div class="container py-5">
        <div class="row d-flex justify-content-center align-items-center min-vh-100">
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10">
                <div class="card login-card">
                    <div class="card-body p-4 p-sm-5">
                        <!-- Logo Section -->
                        <div class="text-center mb-4">
                            <i class="bi bi-shield-lock text-primary" style="font-size: 3.5rem;"></i>
                            <h1 class="h3 fw-bold mt-3 mb-2">E-Commerce Admin</h1>
                            <p class="text-muted">Access your store dashboard</p>
                        </div>
                        
                        <!-- Login Form -->
                        <form action="../../AdminLoginValidate" method="post" autocomplete="off">
                            <!-- Email Field -->
                            <div class="mb-3">
                                <label for="adminEmail" class="form-label fw-semibold">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light">
                                        <i class="bi bi-envelope-at-fill text-muted"></i>
                                    </span>
                                    <input type="text" 
                                           class="form-control" 
                                           id="adminEmail" 
                                           name="username" 
                                           placeholder="usename" 
                                           required
                                           autocomplete="username">
                                </div>
                            </div>
                            
                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="adminPassword" class="form-label fw-semibold">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light">
                                        <i class="bi bi-key-fill text-muted"></i>
                                    </span>
                                    <input type="password" 
                                           class="form-control" 
                                           id="adminPassword" 
                                           name="password" 
                                           placeholder="••••••••" 
                                           required
                                           autocomplete="current-password">
                                    <button class="btn btn-outline-secondary toggle-password" type="button">
                                        <i class="bi bi-eye-fill"></i>
                                    </button>
                                </div>
                            </div>
                            
							<div class="mb-3">
<div class="mb-3">
    <label for="userRole" class="form-label fw-semibold">Role</label>
    <div class="input-group">
        <span class="input-group-text bg-light">
            <i class="bi bi-person-badge"></i>
        </span>
        <select class="form-select"
                id="userRole" 
                name="role" 
                required
                aria-label="Select user role">
            <option value="" selected disabled>Select your role</option>
            <option value="manager">Manager</option>
            <option value="assistant_manager">Assistant Manager</option>
            <option value="ceo">CEO</option>
            <option value="hr">HR</option>
            <option value="data_analyst">Data Analyst</option>
            <option value="it_manager">IT Manager</option>
            <option value="head_of_ecommerce">Head of Ecommerce</option>
        </select>
    </div>
</div>

                            <!-- Remember Me & Forgot Password -->
                            <div class="d-flex justify-content-between mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" 
                                           type="checkbox" 
                                           id="rememberMe" 
                                           name="remember">
                                    <label class="form-check-label" for="rememberMe">
                                        Remember me
                                    </label>
                                </div>
                                <a href="#" class="text-decoration-none small">Forgot password?</a>
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="d-grid mb-3">
                                <button type="submit" 
                                        class="btn btn-primary btn-lg fw-semibold py-2" 
                                        name="submit">
                                    <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
                                </button>
                            </div>
                            
                        </form>
                    </div>
                </div>
                
                <!-- Footer -->
                <div class="text-center mt-4">
                    <p class="text-muted small">&copy; <span id="currentYear"></span> Your E-Commerce Store. All rights reserved.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>