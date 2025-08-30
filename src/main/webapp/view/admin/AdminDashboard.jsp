<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Pro Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="AdminDHeaders.jsp"/>
</head>
<body>
  <!-- Sidebar Navigation -->
  <div class="sidebar">
    <div class="sidebar-brand">
      <i class="bi bi-shop me-2"></i> <span>Admin Pro</span>
    </div>
    <div class="sidebar-nav">
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link active" href="#"
          name="home_link"> <i class="bi bi-house-door"></i> Dashboard
        </a></li>

        <!-- Categories Dropdown -->
        <li class="nav-item dropdown"><a
          class="nav-link dropdown-toggle" href="#" id="categoriesDropdown"
          role="button" data-bs-toggle="dropdown" aria-expanded="false"
          name="categories_dropdown"> <i class="bi bi-tags"></i>
            Categories
        </a>
          <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
            <li><a class="dropdown-item" href="Category/AddCategory.jsp"
              name="add_category_link"> <i class="bi bi-plus-circle me-2"></i>Add
                Category
            </a></li>
            <li><a class="dropdown-item" href="Category/ViewCategory.jsp"
              name="view_categories_link"> <i class="bi bi-list-ul me-2"></i>View
                Categories
            </a></li>
          </ul></li>
		<!-- Employees Dropdown -->
		<li class="nav-item dropdown"><a
          class="nav-link dropdown-toggle" href="#" id="categoriesDropdown"
          role="button" data-bs-toggle="dropdown" aria-expanded="false"
          name="categories_dropdown"> <i class="bi bi-people-fill"></i>
            Employees
        </a>
          <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
            <li><a class="dropdown-item" href="Employee/AddEmployee.jsp"
              name="add_category_link"> <i class="bi bi-person-plus me-2"></i>Add
                Employee
            </a></li>
            <li><a class="dropdown-item" href="Employee/ViewEmployee.jsp"
              name="view_categories_link"> <i class="bi bi-card-list me-2"></i>View
                Employees
            </a></li>
          </ul></li>
        <!-- Products Dropdown -->
        <li class="nav-item dropdown"><a
          class="nav-link dropdown-toggle" href="#" id="productsDropdown"
          role="button" data-bs-toggle="dropdown" aria-expanded="false"
          name="products_dropdown"> <i class="bi bi-box-seam"></i>
            Products
        </a>
          <ul class="dropdown-menu" aria-labelledby="productsDropdown">
            <li><a class="dropdown-item" href="Product/AddProduct.jsp" name="add_product_link">
                <i class="bi bi-plus-circle me-2"></i>Add Product
            </a></li>
            <li><a class="dropdown-item" href="Product/ViewProducts.jsp"
              name="view_products_link"> <i class="bi bi-list-ul me-2"></i>View
                Products
            </a></li>
          </ul></li>

        <li class="nav-item"><a class="nav-link" href="#"
          name="orders_link"> <i class="bi bi-cart-check"></i> Orders
        </a></li>

        <li class="nav-item"><a class="nav-link" href="Customer/Customers.jsp"
          name="customers_link"> <i class="bi bi-people"></i> Customers
        </a></li>

        <li class="nav-item"><a class="nav-link" href="#"
          name="reports_link"> <i class="bi bi-graph-up"></i> Analytics
        </a></li>

        <li class="nav-item"><a class="nav-link" href="#"
          name="settings_link"> <i class="bi bi-gear"></i> Settings
        </a></li>
      </ul>
    </div>
  </div>
  
  <!-- Main Content -->
  <main class="main-content">
    <div class="container-fluid py-4">
      <div class="row mb-4">
        <div class="col-12">
          <h2 class="fw-bold">Dashboard Overview</h2>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
          </nav>
        </div>
      </div>

      <!-- Stats Cards -->
      <div class="row mb-4">
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-start border-primary border-4 h-100">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h6 class="text-uppercase text-muted mb-2">Total Revenue</h6>
                  <h3 class="mb-0">$32,845</h3>
                  <p class="text-success mb-0"><small><i class="bi bi-arrow-up"></i> 12.5% from last month</small></p>
                </div>
                <div
                  class="icon-shape bg-primary bg-opacity-10 text-primary rounded-3">
                  <i class="bi bi-currency-dollar fs-3"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-start border-success border-4 h-100">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h6 class="text-uppercase text-muted mb-2">Total Orders</h6>
                  <h3 class="mb-0">1,845</h3>
                  <p class="text-success mb-0"><small><i class="bi bi-arrow-up"></i> 8.2% from last month</small></p>
                </div>
                <div
                  class="icon-shape bg-success bg-opacity-10 text-success rounded-3">
                  <i class="bi bi-cart-check fs-3"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-start border-info border-4 h-100">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h6 class="text-uppercase text-muted mb-2">Total Products</h6>
                  <h3 class="mb-0">428</h3>
                  <p class="text-success mb-0"><small><i class="bi bi-arrow-up"></i> 5 new this week</small></p>
                </div>
                <div
                  class="icon-shape bg-info bg-opacity-10 text-info rounded-3">
                  <i class="bi bi-box-seam fs-3"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-start border-warning border-4 h-100">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h6 class="text-uppercase text-muted mb-2">Total Customers</h6>
                  <h3 class="mb-0">1,428</h3>
                  <p class="text-success mb-0"><small><i class="bi bi-arrow-up"></i> 24 new today</small></p>
                </div>
                <div
                  class="icon-shape bg-warning bg-opacity-10 text-warning rounded-3">
                  <i class="bi bi-people fs-3"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Charts and Recent Orders -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <div class="card">
            <div class="card-header">
              <h5 class="card-title mb-0">Sales Analytics</h5>
            </div>
            <div class="card-body">
              <div class="chart-container" style="height: 300px;">
                <!-- Chart would be rendered here with Chart.js or similar -->
                <div class="d-flex align-items-center justify-content-center bg-light rounded" style="height: 100%;">
                  <div class="text-center">
                    <i class="bi bi-bar-chart fs-1 text-muted"></i>
                    <p class="mt-2">Sales chart will be displayed here</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-lg-4 mb-4">
          <div class="card">
            <div class="card-header">
              <h5 class="card-title mb-0">Top Products</h5>
            </div>
            <div class="card-body">
              <div class="list-group list-group-flush">
                <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                  <div>
                    <h6 class="mb-1">Premium Headphones</h6>
                    <small class="text-muted">Electronics</small>
                  </div>
                  <span class="badge bg-primary rounded-pill">142</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                  <div>
                    <h6 class="mb-1">Smart Watch Pro</h6>
                    <small class="text-muted">Wearables</small>
                  </div>
                  <span class="badge bg-primary rounded-pill">98</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                  <div>
                    <h6 class="mb-1">Wireless Charger</h6>
                    <small class="text-muted">Accessories</small>
                  </div>
                  <span class="badge bg-primary rounded-pill">76</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                  <div>
                    <h6 class="mb-1">Bluetooth Speaker</h6>
                    <small class="text-muted">Audio</small>
                  </div>
                  <span class="badge bg-primary rounded-pill">65</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Recent Orders -->
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div
              class="card-header d-flex justify-content-between align-items-center">
              <h5 class="card-title mb-0">Recent Orders</h5>
              <a href="#" class="btn btn-sm btn-outline-primary"
                name="view_all_orders_link">View All</a>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Order ID</th>
                      <th>Customer</th>
                      <th>Date</th>
                      <th>Amount</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>#EC-2048</td>
                      <td>Alex Johnson</td>
                      <td>2023-11-18</td>
                      <td>$298.00</td>
                      <td><span class="badge bg-success">Completed</span></td>
                      <td>
                        <button class="btn btn-sm btn-outline-primary"
                          name="view_order_link">View</button>
                      </td>
                    </tr>
                    <tr>
                      <td>#EC-2047</td>
                      <td>Sarah Williams</td>
                      <td>2023-11-17</td>
                      <td>$156.50</td>
                      <td><span class="badge bg-warning text-dark">Processing</span></td>
                      <td>
                        <button class="btn btn-sm btn-outline-primary"
                          name="view_order_link">View</button>
                      </td>
                    </tr>
                    <tr>
                      <td>#EC-2046</td>
                      <td>Michael Brown</td>
                      <td>2023-11-16</td>
                      <td>$420.75</td>
                      <td><span class="badge bg-info">Shipped</span></td>
                      <td>
                        <button class="btn btn-sm btn-outline-primary"
                          name="view_order_link">View</button>
                      </td>
                    </tr>
                    <tr>
                      <td>#EC-2045</td>
                      <td>Emily Davis</td>
                      <td>2023-11-15</td>
                      <td>$189.99</td>
                      <td><span class="badge bg-secondary">Pending</span></td>
                      <td>
                        <button class="btn btn-sm btn-outline-primary"
                          name="view_order_link">View</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <!-- Bootstrap 5 JS Bundle with Popper -->
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Simple script to handle sidebar toggle on mobile
    document.addEventListener('DOMContentLoaded', function() {
      const sidebar = document.querySelector('.sidebar');
      const toggleBtn = document.createElement('button');
      toggleBtn.className = 'btn btn-primary d-lg-none position-fixed';
      toggleBtn.style.bottom = '20px';
      toggleBtn.style.right = '20px';
      toggleBtn.style.zIndex = '1000';
      toggleBtn.innerHTML = '<i class="bi bi-list"></i>';
      
      toggleBtn.addEventListener('click', function() {
        sidebar.classList.toggle('show');
      });
      
      document.body.appendChild(toggleBtn);
    });
  </script>
</body>
</html>