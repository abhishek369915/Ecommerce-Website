<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Edit Form</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .employee-form-container {
            background: linear-gradient(135deg, #f6f9fc 0%, #e7eff8 100%);
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(50, 50, 93, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            overflow: hidden;
            margin: 2rem auto;
        }
        
        .form-header {
            background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .form-header::after {
            content: "";
            position: absolute;
            bottom: -50px;
            left: -10%;
            width: 120%;
            height: 100px;
            background: white;
            transform: rotate(-3deg);
        }
        
        .form-body {
            padding: 2.5rem;
        }
        
        .form-label {
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .form-control, .form-select {
            border-radius: 12px;
            border: 1px solid rgba(0, 0, 0, 0.08);
            padding: 0.75rem 1rem;
            background-color: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.2);
            background-color: white;
        }
        
        .readonly-field {
            background-color: #f8fafc;
            color: #64748b;
            cursor: not-allowed;
        }
        
        .profile-picture-container {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            background: linear-gradient(45deg, #e2e8f0, #cbd5e0);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #94a3b8;
            overflow: hidden;
        }
        
        .btn-update {
            background: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);
            border: none;
            border-radius: 50px;
            padding: 0.75rem 2.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            color: white;
            box-shadow: 0 4px 15px rgba(67, 233, 123, 0.3);
            transition: all 0.3s ease;
        }
        
        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 20px rgba(67, 233, 123, 0.4);
        }
        
        .btn-reset {
            background: linear-gradient(to right, #f78ca0 0%, #f9748f 100%);
            border: none;
            border-radius: 50px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            color: white;
            box-shadow: 0 4px 15px rgba(247, 140, 160, 0.3);
            transition: all 0.3s ease;
        }
        
        .btn-reset:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 20px rgba(247, 140, 160, 0.4);
        }
        
        .gender-radio {
            display: flex;
            gap: 1.5rem;
            margin-top: 0.5rem;
        }
        
        .gender-radio .form-check-input {
            width: 1.2em;
            height: 1.2em;
            margin-top: 0.15em;
        }
        
        .gender-radio .form-check-label {
            font-weight: 500;
        }
        
        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #718096;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="employee-form-container">
                    <div class="form-header">
                        <h2><i class="bi bi-person-badge me-2"></i>Edit Employee Details</h2>
                        <p class="mb-0">Update employee information</p>
                    </div>
                    
                    <div class="form-body">
                        <form>
                            <!-- Profile Picture -->
                            <div class="profile-picture-container">
                                <img src="https://via.placeholder.com/150" alt="Employee Photo" class="profile-picture" id="employeePicPreview">
                                <div class="mt-3">
                                    <input type="file" class="form-control d-none" id="employeePic" name="employeePic" accept="image/*">
                                    <label for="employeePic" class="btn btn-sm btn-outline-primary">Change Photo</label>
                                </div>
                            </div>
                            
                            <div class="row">
                                <!-- Employee ID (Unchangeable) -->
                                <div class="col-md-6 mb-4">
                                    <label for="employeeId" class="form-label">Employee ID</label>
                                    <input type="text" class="form-control readonly-field" id="employeeId" name="employeeId" value="EMP-2023-0456" readonly>
                                </div>
                                
                                <!-- Designation -->
                                <div class="col-md-6 mb-4">
                                    <label for="designation" class="form-label">Designation</label>
                                    <select class="form-select" id="designation" name="designation">
                                        <option selected>Software Developer</option>
                                        <option>Project Manager</option>
                                        <option>UI/UX Designer</option>
                                        <option>HR Manager</option>
                                        <option>Marketing Specialist</option>
                                        <option>Accountant</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <!-- First Name -->
                                <div class="col-md-6 mb-4">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName" value="John">
                                </div>
                                
                                <!-- Last Name -->
                                <div class="col-md-6 mb-4">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName" value="Doe">
                                </div>
                            </div>
                            
                            <!-- Gender -->
                            <div class="mb-4">
                                <label class="form-label">Gender</label>
                                <div class="gender-radio">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
                                        <label class="form-check-label" for="male">Male</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                        <label class="form-check-label" for="female">Female</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="other" value="other">
                                        <label class="form-check-label" for="other">Other</label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <!-- Mobile -->
                                <div class="col-md-6 mb-4">
                                    <label for="mobile" class="form-label">Mobile Number</label>
                                    <input type="tel" class="form-control" id="mobile" name="mobile" value="+1 (555) 123-4567">
                                </div>
                                
                                <!-- Email -->
                                <div class="col-md-6 mb-4">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" value="john.doe@example.com">
                                </div>
                            </div>
                            
                            <div class="row">
                                <!-- Salary -->
                                <div class="col-md-6 mb-4">
                                    <label for="salary" class="form-label">Salary ($)</label>
                                    <input type="number" class="form-control" id="salary" name="salary" value="75000" step="0.01" min="0">
                                </div>
                                
                                <!-- Password -->
                                <div class="col-md-6 mb-4 position-relative">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" value="********">
                                    <span class="password-toggle" id="togglePassword">
                                        <i class="bi bi-eye"></i>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="d-flex justify-content-between mt-5">
                                <button type="reset" class="btn-reset">
                                    <i class="bi bi-arrow-counterclockwise me-2"></i>Reset
                                </button>
                                <button type="submit" class="btn-update">
                                    <i class="bi bi-check-circle me-2"></i>Update Employee
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    
    <script>
        // Profile picture preview
        const employeePic = document.getElementById('employeePic');
        const employeePicPreview = document.getElementById('employeePicPreview');
        
        employeePic.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    employeePicPreview.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
        
        // Password toggle
        const togglePassword = document.getElementById('togglePassword');
        const password = document.getElementById('password');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="bi bi-eye"></i>' : '<i class="bi bi-eye-slash"></i>';
        });
    </script>
</body>
</html>