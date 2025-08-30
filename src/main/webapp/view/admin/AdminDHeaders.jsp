<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    :root {
      --sidebar-width: 280px;
      --primary-color: #6c5ce7;
      --secondary-color: #a29bfe;
      --accent-color: #fd79a8;
      --dark-color: #2d3436;
      --light-color: #f5f6fa;
    }
    
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
      display: flex;
      min-height: 100vh;
    }
    
    .sidebar {
      width: var(--sidebar-width);
      background: linear-gradient(180deg, var(--primary-color), var(--dark-color));
      color: white;
      position: fixed;
      height: 100vh;
      transition: all 0.3s;
      box-shadow: 4px 0 20px rgba(0,0,0,0.1);
      z-index: 1000;
    }
    
    .sidebar-brand {
      padding: 1.5rem 1rem;
      font-size: 1.25rem;
      font-weight: 600;
      border-bottom: 1px solid rgba(255,255,255,0.1);
      display: flex;
      align-items: center;
    }
    
    .sidebar-brand i {
      font-size: 1.5rem;
      margin-right: 0.75rem;
      color: var(--accent-color);
    }
    
    .sidebar-nav {
      padding: 1rem 0;
    }
    
    .nav-link {
      color: rgba(255,255,255,0.8);
      padding: 0.75rem 1.5rem;
      margin: 0.25rem 1rem;
      border-radius: 0.5rem;
      display: flex;
      align-items: center;
      transition: all 0.2s;
    }
    
    .nav-link:hover, .nav-link.active {
      background-color: rgba(255,255,255,0.1);
      color: white;
      transform: translateX(5px);
    }
    
    .nav-link i {
      margin-right: 0.75rem;
      font-size: 1.1rem;
    }
    
    .dropdown-menu {
      background-color: var(--dark-color);
      border: none;
      border-radius: 0.5rem;
      margin-left: 1rem;
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }
    
    .dropdown-item {
      color: rgba(255,255,255,0.8);
      padding: 0.5rem 1rem;
    }
    
    .dropdown-item:hover {
      background-color: rgba(255,255,255,0.1);
      color: white;
    }
    
    .dropdown-toggle::after {
      margin-left: auto;
    }
    
    .main-content {
      margin-left: var(--sidebar-width);
      width: calc(100% - var(--sidebar-width));
      padding: 2rem;
      transition: all 0.3s;
    }
    
    .card {
      border: none;
      border-radius: 0.75rem;
      box-shadow: 0 4px 20px rgba(0,0,0,0.05);
      transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }
    
    .icon-shape {
      width: 50px;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .badge {
      padding: 0.5em 0.75em;
      font-weight: 500;
    }
    
    .table-responsive {
      border-radius: 0.75rem;
      overflow: hidden;
    }
    
    .table {
      margin-bottom: 0;
    }
    
    .table th {
      background-color: var(--light-color);
      border-bottom-width: 1px;
      font-weight: 600;
    }
    
    .table-hover tbody tr:hover {
      background-color: rgba(108, 92, 231, 0.05);
    }
    
    .breadcrumb {
      background-color: transparent;
      padding: 0;
    }
    
    .breadcrumb-item.active {
      color: var(--primary-color);
      font-weight: 500;
    }
    
    .btn-outline-primary {
      border-color: var(--primary-color);
      color: var(--primary-color);
    }
    
    .btn-outline-primary:hover {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }
    
    .border-primary {
      border-color: var(--primary-color) !important;
    }
    
    .border-success {
      border-color: #00b894 !important;
    }
    
    .border-info {
      border-color: #0984e3 !important;
    }
    
    .border-warning {
      border-color: #fdcb6e !important;
    }
    
    .text-primary {
      color: var(--primary-color) !important;
    }
    
    .bg-primary {
      background-color: var(--primary-color) !important;
    }
    
    @media (max-width: 992px) {
      .sidebar {
        transform: translateX(-100%);
      }
      
      .sidebar.show {
        transform: translateX(0);
      }
      
      .main-content {
        margin-left: 0;
        width: 100%;
      }
    }
  </style>