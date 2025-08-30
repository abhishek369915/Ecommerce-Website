<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Your E-commerce Site</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .registration-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            background-color: white;
        }
        .registration-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .registration-header h2 {
            color: #3a3a3a;
            font-weight: 600;
        }
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
        }
        .btn-register {
            background-color: #28a745;
            border: none;
            padding: 10px 25px;
            font-weight: 500;
        }
        .btn-register:hover {
            background-color: #218838;
        }
        .btn-cancel {
            background-color: #dc3545;
            border: none;
            padding: 10px 25px;
            font-weight: 500;
        }
        .btn-cancel:hover {
            background-color: #c82333;
        }
        .profile-pic-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-pic-preview {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #e9ecef;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="registration-container">
            <div class="registration-header">
                <h2><i class="fas fa-user-plus me-2"></i>Create Your Account</h2>
                <p class="text-muted">Join our e-commerce community today</p>
            </div>
            
            <form id="registrationForm" method="post" action="/EcommerceWebsite/RegisterCustomer" enctype="multipart/form-data">
                <div class="row mb-3">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                        <div class="invalid-feedback">Please enter your first name.</div>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                        <div class="invalid-feedback">Please enter your last name.</div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="mobileNumber" class="form-label">Mobile Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" required>
                        <div class="invalid-feedback">Please enter a valid mobile number.</div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="emailId" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control" id="emailId" name="emailId" required>
                        <div class="invalid-feedback">Please enter a valid email address.</div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                        <div class="invalid-feedback">Please enter a password.</div>
                    </div>
                    <small class="form-text text-muted">Minimum 8 characters with at least one number and one letter</small>
                </div>
                
                <div class="profile-pic-container">
                    <img id="profilePicPreview" class="profile-pic-preview mb-2" alt="Profile preview">
                    <div class="mb-3">
                        <label for="profilePic" class="form-label">Profile Picture (Optional)</label>
                        <input class="form-control" type="file" id="profilePic" name="profilePic" accept="image/*">
                    </div>
                </div>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="button" class="btn btn-cancel text-white me-md-2">
                        <i class="fas fa-times me-1"></i> Cancel
                    </button>
                    <button type="submit" class="btn btn-register text-white">
                        <i class="fas fa-user-plus me-1"></i> Register
                    </button>
                </div>
                
                <div class="mt-3 text-center">
                    <p>Already have an account? <a href="#">Sign in</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const password = document.getElementById('password');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.querySelector('i').classList.toggle('fa-eye-slash');
        });
        
        // Profile picture preview
        document.getElementById('profilePic').addEventListener('change', function(e) {
            const preview = document.getElementById('profilePicPreview');
            const file = e.target.files[0];
            
            if (file) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                }
                
                reader.readAsDataURL(file);
            }
        });
        
        // Form validation
        (function() {
            'use strict';
            
            const form = document.getElementById('registrationForm');
            
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                
                form.classList.add('was-validated');
            }, false);
        })();
    </script>
</body>
</html>