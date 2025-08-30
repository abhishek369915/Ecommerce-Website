<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Employee</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .form-container {
            max-width: 800px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            background: white;
        }
        
        .form-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
        }
        
        .form-header::before {
            content: "";
            position: absolute;
            top: -30px;
            right: -30px;
            width: 120px;
            height: 120px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
        }
        
        .form-body {
            padding: 2rem;
        }
        
        .form-label {
            font-weight: 500;
            color: var(--dark);
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(67,97,238,0.25);
        }
        
        .profile-picture-container {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: #f0f0f0;
            margin: 0 auto 1rem;
            overflow: hidden;
            position: relative;
            border: 3px solid var(--primary);
            cursor: pointer;
        }
        
        .profile-picture {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .profile-upload-icon {
            position: absolute;
            bottom: 0;
            right: 0;
            background: var(--primary);
            color: white;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
        }
        
        .btn-submit {
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .btn-submit:hover {
            background: var(--secondary);
            transform: translateY(-2px);
        }
        
        .gender-options {
            display: flex;
            gap: 1rem;
        }
        
        .gender-option {
            flex: 1;
        }
        
        .gender-option input[type="radio"] {
            display: none;
        }
        
        .gender-option label {
            display: block;
            padding: 0.75rem 1rem;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .gender-option input[type="radio"]:checked + label {
            border-color: var(--primary);
            background: rgba(67,97,238,0.1);
            color: var(--primary);
            font-weight: 500;
        }
        
        .input-group-text {
            background: #f0f0f0;
            border: 1px solid #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="form-container mx-auto">
            <!-- Header Section -->
            <div class="form-header text-center">
                <h3 class="mb-0"><i class="bi bi-person-plus me-2"></i> Add New Employee</h3>
            </div>
            
            <!-- Form Body -->
            <div class="form-body">
                <form action="/AddEmployee" method="post" enctype="multipart/form-data">
                    <!-- Profile Picture -->
                    <div class="text-center mb-4">
                        <div class="profile-picture-container" onclick="document.getElementById('employee_picture').click()">
                            <img src="https://via.placeholder.com/120" alt="Profile" class="profile-picture" id="profile_preview">
                            <div class="profile-upload-icon">
                                <i class="bi bi-camera"></i>
                            </div>
                        </div>
                        <input type="file" id="employee_picture" name="employee_picture" accept="image/*" style="display: none;" onchange="previewImage(this)">
                        <small class="text-muted">Click to upload profile picture</small>
                    </div>
                    
                    <div class="row g-3">
                        <!-- First Name -->
                        <div class="col-md-6">
                            <label for="first_name" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="first_name" name="first_name" required>
                        </div>
                        
                        <!-- Last Name -->
                        <div class="col-md-6">
                            <label for="last_name" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="last_name" name="last_name" required>
                        </div>
                        
                        <!-- Gender -->
                        <div class="col-12">
                            <label class="form-label">Gender</label>
                            <div class="gender-options">
                                <div class="gender-option">
                                    <input type="radio" id="male" name="gender" value="male" checked>
                                    <label for="male"><i class="bi bi-gender-male me-1"></i> Male</label>
                                </div>
                                <div class="gender-option">
                                    <input type="radio" id="female" name="gender" value="female">
                                    <label for="female"><i class="bi bi-gender-female me-1"></i> Female</label>
                                </div>
                                <div class="gender-option">
                                    <input type="radio" id="other" name="gender" value="other">
                                    <label for="other"><i class="bi bi-gender-trans me-1"></i> Other</label>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Mobile -->
                        <div class="col-md-6">
                            <label for="mobile" class="form-label">Mobile Number</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-phone"></i></span>
                                <input type="tel" class="form-control" id="mobile" name="mobile" required>
                            </div>
                        </div>
                        
                        <!-- Email -->
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>
                        
                        <!-- Designation -->
                        <div class="col-md-6">
                            <label for="designation" class="form-label">Designation</label>
                            <select class="form-select" id="designation" name="designation" required>
                                <option value="" selected disabled>Select Designation</option>
                                <option value="Manager">Manager</option>
                                <option value="Developer">Developer</option>
                                <option value="Designer">Designer</option>
                                <option value="Sales Executive">Sales Executive</option>
                                <option value="HR Manager">HR Manager</option>
                                <option value="Accountant">Accountant</option>
                            </select>
                        </div>
                        
                        <!-- Salary -->
                        <div class="col-md-6">
                            <label for="salary" class="form-label">Salary</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                                <input type="number" class="form-control" id="salary" name="salary" min="0" step="0.01" required>
                            </div>
                        </div>
                        
                        <!-- Password -->
                        <div class="col-md-6">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                        
                        <!-- Confirm Password -->
                        <div class="col-md-6">
                            <label for="confirm_password" class="form-label">Confirm Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                            </div>
                        </div>
                        
                        <!-- Submit Button -->
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-submit" name="add_employee_btn">
                                <i class="bi bi-person-plus me-2"></i> Add Employee
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>