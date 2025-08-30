<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Feedback Dashboard - Admin</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .feedback-card {
            transition: all 0.3s ease;
            border-left: 4px solid;
        }
        .feedback-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .rating-stars {
            color: #ffc107;
        }
        .feedback-type-badge {
            font-size: 0.8rem;
        }
        .feedback-header {
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .filter-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
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
                            <a class="nav-link active text-white" href="../AdminDashboard.jsp">
                                <i class="fas fa-tachometer-alt me-2"></i>Back to Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-shopping-bag me-2"></i>Orders
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-comments me-2"></i>Feedback
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-users me-2"></i>Customers
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                <div class="feedback-header">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
                        <h1 class="h2"><i class="fas fa-comments me-2"></i>Customer Feedback</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group me-2">
                                <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Print</button>
                            </div>
                            <button type="button" class="btn btn-sm btn-primary">
                                <i class="fas fa-plus me-1"></i> Add Response
                            </button>
                        </div>
                    </div>
                    <p class="text-muted">View and manage customer feedback submissions</p>
                </div>

                <!-- Filter Section -->
                <div class="filter-section mb-4">
                    <form>
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label for="filterType" class="form-label">Feedback Type</label>
                                <select id="filterType" class="form-select">
                                    <option value="">All Types</option>
                                    <option>Product Quality</option>
                                    <option>Shipping/Delivery</option>
                                    <option>Customer Service</option>
                                    <option>Website Experience</option>
                                    <option>Suggestion</option>
                                    <option>Complaint</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="filterRating" class="form-label">Rating</label>
                                <select id="filterRating" class="form-select">
                                    <option value="">All Ratings</option>
                                    <option>5 Stars</option>
                                    <option>4 Stars</option>
                                    <option>3 Stars</option>
                                    <option>2 Stars</option>
                                    <option>1 Star</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="filterDate" class="form-label">Date Range</label>
                                <select id="filterDate" class="form-select">
                                    <option value="">All Time</option>
                                    <option>Today</option>
                                    <option>This Week</option>
                                    <option>This Month</option>
                                    <option>Last 30 Days</option>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-filter me-1"></i> Filter
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Feedback Stats -->
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5 class="card-title">Total Feedback</h5>
                                <h2 class="card-text">142</h2>
                                <p class="small mb-0"><i class="fas fa-arrow-up me-1"></i> 12% from last month</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-success text-white">
                            <div class="card-body">
                                <h5 class="card-title">Positive (4-5 Stars)</h5>
                                <h2 class="card-text">89</h2>
                                <p class="small mb-0">63% of total</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-warning text-dark">
                            <div class="card-body">
                                <h5 class="card-title">Neutral (3 Stars)</h5>
                                <h2 class="card-text">32</h2>
                                <p class="small mb-0">23% of total</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-danger text-white">
                            <div class="card-body">
                                <h5 class="card-title">Negative (1-2 Stars)</h5>
                                <h2 class="card-text">21</h2>
                                <p class="small mb-0">14% of total</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Feedback List -->
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Recent Feedback Submissions</h5>
                        <div class="dropdown">
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
                                <i class="fas fa-ellipsis-v"></i>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#">Mark all as read</a></li>
                                <li><a class="dropdown-item" href="#">Export all</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Feedback Item 1 -->
                        <div class="feedback-card card mb-3 border-left-primary">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h5 class="card-title">Excellent Product Quality</h5>
                                        <div class="rating-stars mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge bg-primary feedback-type-badge">Product Quality</span>
                                        <p class="text-muted small mb-0">Submitted: 2 hours ago</p>
                                    </div>
                                </div>
                                <p class="card-text">"The product exceeded my expectations. The quality is much better than I anticipated and it arrived earlier than the estimated delivery date. Will definitely purchase again!"</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="fw-bold">John Smith</span> - john.smith@example.com
                                        <span class="text-muted ms-2">Order #12345</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-reply"></i> Respond
                                        </button>
                                        <button class="btn btn-sm btn-outline-success me-1">
                                            <i class="fas fa-check"></i> Resolved
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Feedback Item 2 -->
                        <div class="feedback-card card mb-3 border-left-warning">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h5 class="card-title">Average Shipping Experience</h5>
                                        <div class="rating-stars mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge bg-info text-dark feedback-type-badge">Shipping/Delivery</span>
                                        <p class="text-muted small mb-0">Submitted: 1 day ago</p>
                                    </div>
                                </div>
                                <p class="card-text">"The product itself is good, but the shipping took longer than expected. The tracking information wasn't very accurate. Customer service was helpful when I called though."</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="fw-bold">Sarah Johnson</span> - sarah.j@example.com
                                        <span class="text-muted ms-2">Order #12346</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-reply"></i> Respond
                                        </button>
                                        <button class="btn btn-sm btn-outline-secondary me-1">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Feedback Item 3 -->
                        <div class="feedback-card card mb-3 border-left-danger">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h5 class="card-title">Damaged Item Received</h5>
                                        <div class="rating-stars mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge bg-danger feedback-type-badge">Complaint</span>
                                        <p class="text-muted small mb-0">Submitted: 3 days ago</p>
                                    </div>
                                </div>
                                <p class="card-text">"Very disappointed with my purchase. The item arrived damaged and the packaging was inadequate. I've contacted customer service but haven't received a response yet."</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="fw-bold">Michael Brown</span> - michael.b@example.com
                                        <span class="text-muted ms-2">Order #12347</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-reply"></i> Respond
                                        </button>
                                        <button class="btn btn-sm btn-outline-success me-1">
                                            <i class="fas fa-check"></i> Resolved
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Feedback Item 4 -->
                        <div class="feedback-card card mb-3 border-left-success">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h5 class="card-title">Great Website Experience</h5>
                                        <div class="rating-stars mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge bg-success feedback-type-badge">Website Experience</span>
                                        <p class="text-muted small mb-0">Submitted: 1 week ago</p>
                                    </div>
                                </div>
                                <p class="card-text">"The website is very user-friendly and the checkout process was smooth. I especially appreciate the product recommendations - they were spot on!"</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="fw-bold">Emily Davis</span> - emily.d@example.com
                                    </div>
                                    <div>
                                        <button class="btn btn-sm btn-outline-secondary me-1">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Feedback pagination">
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

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript for interactive elements -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Mark as read functionality
            const feedbackCards = document.querySelectorAll('.feedback-card');
            feedbackCards.forEach(card => {
                card.addEventListener('click', function(e) {
                    if (!e.target.closest('.btn')) {
                        this.classList.add('border-primary');
                        this.classList.remove('border-danger', 'border-warning', 'border-success');
                    }
                });
            });
            
            // Filter functionality would be implemented here
            // This would typically connect to an API or backend system
        });
    </script>
</body>
</html>