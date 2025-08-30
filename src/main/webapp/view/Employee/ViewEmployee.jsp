<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .gradient-header {
            background: linear-gradient(135deg, #43cea2 0%, #185a9d 100%);
            color: white;
            border-radius: 15px 15px 0 0;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        
        .gradient-table {
            background: linear-gradient(to right, #f5f7fa 0%, #e4e8f0 100%);
        }
        
        .gradient-table thead {
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            color: #2c3e50;
        }
        
        .gradient-table tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }
        
        .gradient-table tbody tr:hover {
            background: rgba(255, 255, 255, 0.8);
            transform: translateX(5px);
        }
        
        .action-btn {
            border-radius: 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            padding: 5px 15px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .edit-btn {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            border: none;
            color: white;
        }
        
        .delete-btn {
            background: linear-gradient(to right, #ff758c 0%, #ff7eb3 100%);
            border: none;
            color: white;
        }
        
        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .employee-pic {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid white;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }
        
        .table-container {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .gender-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.75rem;
            text-transform: uppercase;
            font-weight: 600;
        }
        
        .male {
            background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
            color: #2c3e50;
        }
        
        .female {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            color: #2c3e50;
        }
        
        .other {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
            color: #2c3e50;
        }
        
        .password-field {
            font-family: monospace;
            letter-spacing: 1px;
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="table-container">
            <div class="gradient-header p-4 d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="bi bi-people-fill"></i> Employee Directory</h2>
                <button class="btn btn-light rounded-pill">+ Add Employee</button>
            </div>
            
            <div class="table-responsive gradient-table">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Photo</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Designation</th>
                            <th>Salary</th>
                            <th>Password</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Employee 1 -->
                        <tr>
                            <td name="employeeid">EMP-1001</td>
                            <td><img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Employee" class="employee-pic" name="employeepic"></td>
                            <td name="firstname">John</td>
                            <td name="lastname">Doe</td>
                            <td><span class="gender-badge male" name="gender">Male</span></td>
                            <td name="mobile">+1 (555) 123-4567</td>
                            <td name="email">john.doe@company.com</td>
                            <td name="designation">Senior Developer</td>
                            <td name="salary">$85,000</td>
                            <td class="password-field" name="password">••••••••</td>
                            <td>
                                <button class="btn btn-sm edit-btn action-btn me-2">Edit</button>
                                <button class="btn btn-sm delete-btn action-btn">Delete</button>
                            </td>
                        </tr>
                        
                        <!-- Employee 2 -->
                        <tr>
                            <td name="employeeid">EMP-1002</td>
                            <td><img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Employee" class="employee-pic" name="employeepic"></td>
                            <td name="firstname">Sarah</td>
                            <td name="lastname">Smith</td>
                            <td><span class="gender-badge female" name="gender">Female</span></td>
                            <td name="mobile">+1 (555) 987-6543</td>
                            <td name="email">sarah.smith@company.com</td>
                            <td name="designation">HR Manager</td>
                            <td name="salary">$72,500</td>
                            <td class="password-field" name="password">••••••••</td>
                            <td>
                                <button class="btn btn-sm edit-btn action-btn me-2">Edit</button>
                                <button class="btn btn-sm delete-btn action-btn">Delete</button>
                            </td>
                        </tr>
                        
                        <!-- Employee 3 -->
                        <tr>
                            <td name="employeeid">EMP-1003</td>
                            <td><img src="https://randomuser.me/api/portraits/men/67.jpg" alt="Employee" class="employee-pic" name="employeepic"></td>
                            <td name="firstname">Michael</td>
                            <td name="lastname">Johnson</td>
                            <td><span class="gender-badge male" name="gender">Male</span></td>
                            <td name="mobile">+1 (555) 456-7890</td>
                            <td name="email">michael.j@company.com</td>
                            <td name="designation">Marketing Director</td>
                            <td name="salary">$92,000</td>
                            <td class="password-field" name="password">••••••••</td>
                            <td>
                                <button class="btn btn-sm edit-btn action-btn me-2">Edit</button>
                                <button class="btn btn-sm delete-btn action-btn">Delete</button>
                            </td>
                        </tr>
                        
                        <!-- Employee 4 -->
                        <tr>
                            <td name="employeeid">EMP-1004</td>
                            <td><img src="https://randomuser.me/api/portraits/women/63.jpg" alt="Employee" class="employee-pic" name="employeepic"></td>
                            <td name="firstname">Emily</td>
                            <td name="lastname">Wilson</td>
                            <td><span class="gender-badge female" name="gender">Female</span></td>
                            <td name="mobile">+1 (555) 789-0123</td>
                            <td name="email">emily.w@company.com</td>
                            <td name="designation">UX Designer</td>
                            <td name="salary">$68,000</td>
                            <td class="password-field" name="password">••••••••</td>
                            <td>
                                <a href="EditEmployee.jsp"><button class="btn btn-sm edit-btn action-btn me-2">Edit</button></a>
                                <button class="btn btn-sm delete-btn action-btn">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</body>
</html>