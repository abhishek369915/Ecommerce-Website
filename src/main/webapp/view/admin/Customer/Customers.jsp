<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management - Admin</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .customer-card {
            transition: all 0.3s ease;
            border-left: 4px solid #0d6efd;
        }
        .customer-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .profile-pic {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #dee2e6;
        }
        .status-badge {
            font-size: 0.75rem;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .action-btns .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link text-white" href="../AdminDashboard.jsp">
                                <i class="fas fa-tachometer-alt me-2"></i>Back to Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-shopping-bag me-2"></i>Orders
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active text-white" href="Customers.jsp">
                                <i class="fas fa-users me-2"></i>Customers
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="FeedbackView.jsp">
                                <i class="fas fa-comments me-2"></i>Feedback
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2"><i class="fas fa-users me-2"></i>Customer Management</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group me-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Print</button>
                        </div>
                        <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addCustomerModal">
                            <i class="fas fa-plus me-1"></i> Add Customer
                        </button>
                    </div>
                </div>

                <!-- Filter Section -->
                <div class="card mb-4">
                    <div class="card-body">
                        <form>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label for="searchName" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="searchName" name="search_name" placeholder="First or last name">
                                </div>
                                <div class="col-md-3">
                                    <label for="searchEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="searchEmail" name="search_email" placeholder="Customer email">
                                </div>
                                <div class="col-md-3">
                                    <label for="searchPhone" class="form-label">Phone</label>
                                    <input type="tel" class="form-control" id="searchPhone" name="search_phone" placeholder="Mobile number">
                                </div>
                                <div class="col-md-3 d-flex align-items-end">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="fas fa-search me-1"></i> Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Customer Stats -->
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5 class="card-title">Total Customers</h5>
                                <h2 class="card-text">1,248</h2>
                                <p class="small mb-0"><i class="fas fa-arrow-up me-1"></i> 8% from last month</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-success text-white">
                            <div class="card-body">
                                <h5 class="card-title">Active Customers</h5>
                                <h2 class="card-text">982</h2>
                                <p class="small mb-0">79% of total</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-info text-white">
                            <div class="card-body">
                                <h5 class="card-title">New This Month</h5>
                                <h2 class="card-text">156</h2>
                                <p class="small mb-0">12.5% growth</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-warning text-dark">
                            <div class="card-body">
                                <h5 class="card-title">Inactive Customers</h5>
                                <h2 class="card-text">266</h2>
                                <p class="small mb-0">21% of total</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Customers Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Customer Records</h5>
                        <div class="dropdown">
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
                                <i class="fas fa-ellipsis-v"></i>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#">Export All</a></li>
                                <li><a class="dropdown-item" href="#">Bulk Actions</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Profile</th>
                                        <th>Name</th>
                                        <th>Contact</th>
                                        <th>Registered</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Customer 1 -->
                                    <tr class="customer-card">
                                        <td>1001</td>
                                        <td>
                                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Profile" class="profile-pic">
                                        </td>
                                        <td>
                                            <strong>John</strong> Smith<br>
                                            <small class="text-muted">Username: johnsmith</small>
                                        </td>
                                        <td>
                                            john.smith@example.com<br>
                                            <small class="text-muted">+1 (555) 123-4567</small>
                                        </td>
                                        <td>
                                            Jan 15, 2023<br>
                                            <small class="text-muted">8 months ago</small>
                                        </td>
                                        <td>
                                            <span class="badge bg-success status-badge">Active</span>
                                        </td>
                                        <td class="action-btns">
                                            <button class="btn btn-sm btn-primary me-1" data-bs-toggle="modal" data-bs-target="#editCustomerModal" data-customer-id="1001">
                                                <i class="fas fa-edit"></i> Modify
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Customer 2 -->
                                    <tr class="customer-card">
                                        <td>1002</td>
                                        <td>
                                            <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Profile" class="profile-pic">
                                        </td>
                                        <td>
                                            <strong>Sarah</strong> Johnson<br>
                                            <small class="text-muted">Username: sarahj</small>
                                        </td>
                                        <td>
                                            sarah.j@example.com<br>
                                            <small class="text-muted">+1 (555) 987-6543</small>
                                        </td>
                                        <td>
                                            Mar 22, 2023<br>
                                            <small class="text-muted">6 months ago</small>
                                        </td>
                                        <td>
                                            <span class="badge bg-success status-badge">Active</span>
                                        </td>
                                        <td class="action-btns">
                                            <button class="btn btn-sm btn-primary me-1" data-bs-toggle="modal" data-bs-target="#editCustomerModal" data-customer-id="1002">
                                                <i class="fas fa-edit"></i> Modify
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Customer 3 -->
                                    <tr class="customer-card">
                                        <td>1003</td>
                                        <td>
                                            <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="Profile" class="profile-pic">
                                        </td>
                                        <td>
                                            <strong>Michael</strong> Brown<br>
                                            <small class="text-muted">Username: michaelb</small>
                                        </td>
                                        <td>
                                            michael.b@example.com<br>
                                            <small class="text-muted">+1 (555) 456-7890</small>
                                        </td>
                                        <td>
                                            Jun 5, 2023<br>
                                            <small class="text-muted">3 months ago</small>
                                        </td>
                                        <td>
                                            <span class="badge bg-warning text-dark status-badge">Inactive</span>
                                        </td>
                                        <td class="action-btns">
                                            <button class="btn btn-sm btn-primary me-1" data-bs-toggle="modal" data-bs-target="#editCustomerModal" data-customer-id="1003">
                                                <i class="fas fa-edit"></i> Modify
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Customer 4 -->
                                    <tr class="customer-card">
                                        <td>1004</td>
                                        <td>
                                            <img src="https://randomuser.me/api/portraits/women/28.jpg" alt="Profile" class="profile-pic">
                                        </td>
                                        <td>
                                            <strong>Emily</strong> Davis<br>
                                            <small class="text-muted">Username: emilyd</small>
                                        </td>
                                        <td>
                                            emily.d@example.com<br>
                                            <small class="text-muted">+1 (555) 789-0123</small>
                                        </td>
                                        <td>
                                            Aug 18, 2023<br>
                                            <small class="text-muted">1 month ago</small>
                                        </td>
                                        <td>
                                            <span class="badge bg-success status-badge">Active</span>
                                        </td>
                                        <td class="action-btns">
                                            <button class="btn btn-sm btn-primary me-1" data-bs-toggle="modal" data-bs-target="#editCustomerModal" data-customer-id="1004">
                                                <i class="fas fa-edit"></i> Modify
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Customer pagination" class="mt-4">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Edit Customer Modal -->
    <div class="modal fade" id="editCustomerModal" tabindex="-1" aria-labelledby="editCustomerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCustomerModalLabel">Edit Customer Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editCustomerForm">
                        <input type="hidden" id="edit_customer_id" name="customer_id">
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_first_name" class="form-label">First Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="edit_first_name" name="first_name" required>
                            </div>
                            <div class="col-md-6">
                                <label for="edit_last_name" class="form-label">Last Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="edit_last_name" name="last_name" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_email" class="form-label">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" id="edit_email" name="email" required>
                            </div>
                            <div class="col-md-6">
                                <label for="edit_phone" class="form-label">Mobile Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="edit_phone" name="phone" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="edit_username" name="username" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="edit_status" class="form-label">Account Status <span class="text-danger">*</span></label>
                                <select class="form-select" id="edit_status" name="status" required>
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                    <option value="suspended">Suspended</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="edit_password" class="form-label">Password (Leave blank to keep current)</label>
                                <input type="password" class="form-control" id="edit_password" name="password">
                            </div>
                            <div class="col-md-6">
                                <label for="edit_register_date" class="form-label">Registration Date</label>
                                <input type="text" class="form-control" id="edit_register_date" name="register_date" readonly>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="edit_profile_pic" class="form-label">Profile Picture</label>
                            <div class="d-flex align-items-center">
                                <img id="current_profile_pic" src="" alt="Current Profile" class="profile-pic me-3">
                                <input type="file" class="form-control" id="edit_profile_pic" name="profile_pic" accept="image/*">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="edit_address" class="form-label">Address</label>
                            <textarea class="form-control" id="edit_address" name="address" rows="2"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="saveCustomerChanges">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript for customer management -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize the edit modal with customer data
            const editModal = document.getElementById('editCustomerModal');
            if (editModal) {
                editModal.addEventListener('show.bs.modal', function(event) {
                    const button = event.relatedTarget;
                    const customerId = button.getAttribute('data-customer-id');
                    
                    // Here you would typically fetch customer data from your backend
                    // For demo purposes, we're using placeholder data
                    const customerData = getCustomerDataById(customerId);
                    
                    // Populate the form fields
                    document.getElementById('edit_customer_id').value = customerData.id;
                    document.getElementById('edit_first_name').value = customerData.firstName;
                    document.getElementById('edit_last_name').value = customerData.lastName;
                    document.getElementById('edit_email').value = customerData.email;
                    document.getElementById('edit_phone').value = customerData.phone;
                    document.getElementById('edit_username').value = customerData.username;
                    document.getElementById('edit_status').value = customerData.status;
                    document.getElementById('edit_register_date').value = customerData.registerDate;
                    document.getElementById('edit_address').value = customerData.address;
                    document.getElementById('current_profile_pic').src = customerData.profilePic;
                });
            }
            
            // Save changes button handler
            const saveBtn = document.getElementById('saveCustomerChanges');
            if (saveBtn) {
                saveBtn.addEventListener('click', function() {
                    const form = document.getElementById('editCustomerForm');
                    if (form.checkValidity()) {
                        // Here you would typically send the data to your backend
                        alert('Customer changes saved successfully!');
                        const modal = bootstrap.Modal.getInstance(editModal);
                        modal.hide();
                    } else {
                        form.reportValidity();
                    }
                });
            }
            
            // Mock function to get customer data - replace with actual API call
            function getCustomerDataById(id) {
                const customers = {
                    '1001': {
                        id: '1001',
                        firstName: 'John',
                        lastName: 'Smith',
                        email: 'john.smith@example.com',
                        phone: '+1 (555) 123-4567',
                        username: 'johnsmith',
                        status: 'active',
                        registerDate: 'Jan 15, 2023',
                        address: '123 Main St, Anytown, USA',
                        profilePic: 'https://randomuser.me/api/portraits/men/32.jpg'
                    },
                    '1002': {
                        id: '1002',
                        firstName: 'Sarah',
                        lastName: 'Johnson',
                        email: 'sarah.j@example.com',
                        phone: '+1 (555) 987-6543',
                        username: 'sarahj',
                        status: 'active',
                        registerDate: 'Mar 22, 2023',
                        address: '456 Oak Ave, Somewhere, USA',
                        profilePic: 'https://randomuser.me/api/portraits/women/44.jpg'
                    },
                    '1003': {
                        id: '1003',
                        firstName: 'Michael',
                        lastName: 'Brown',
                        email: 'michael.b@example.com',
                        phone: '+1 (555) 456-7890',
                        username: 'michaelb',
                        status: 'inactive',
                        registerDate: 'Jun 5, 2023',
                        address: '789 Pine Rd, Nowhere, USA',
                        profilePic: 'https://randomuser.me/api/portraits/men/67.jpg'
                    },
                    '1004': {
                        id: '1004',
                        firstName: 'Emily',
                        lastName: 'Davis',
                        email: 'emily.d@example.com',
                        phone: '+1 (555) 789-0123',
                        username: 'emilyd',
                        status: 'active',
                        registerDate: 'Aug 18, 2023',
                        address: '321 Elm Blvd, Anywhere, USA',
                        profilePic: 'https://randomuser.me/api/portraits/women/28.jpg'
                    }
                };
                return customers[id] || {};
            }
        });
    </script>
</body>
</html>