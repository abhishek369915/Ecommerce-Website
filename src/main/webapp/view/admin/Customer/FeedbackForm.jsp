<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Feedback - Your Ecommerce Site</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .feedback-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .rating i {
            cursor: pointer;
            font-size: 2rem;
            color: #ddd;
            transition: color 0.2s;
        }
        .rating i:hover, .rating i.active {
            color: #ffc107;
        }
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-header h2 {
            color: #333;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="container feedback-container bg-white">
        <div class="form-header">
            <h2><i class="fas fa-comment-alt me-2"></i>Customer Feedback</h2>
            <p class="text-muted">We value your opinion! Please share your experience with us.</p>
        </div>
        
        <form action="/submit-feedback" method="POST" id="feedbackForm">
            <!-- Customer Information -->
            <div class="row mb-4">
                <div class="col-md-6 mb-3">
                    <label for="firstName" class="form-label">First Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="firstName" name="first_name" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="last_name">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone">
                </div>
                <div class="col-12 mb-3">
                    <label for="orderNumber" class="form-label">Order Number (Optional)</label>
                    <input type="text" class="form-control" id="orderNumber" name="order_number" placeholder="If your feedback is related to a specific order">
                </div>
            </div>
            
            <!-- Rating -->
            <div class="mb-4">
                <label class="form-label d-block">Overall Rating <span class="text-danger">*</span></label>
                <div class="rating">
                    <i class="fas fa-star" data-rating="1"></i>
                    <i class="fas fa-star" data-rating="2"></i>
                    <i class="fas fa-star" data-rating="3"></i>
                    <i class="fas fa-star" data-rating="4"></i>
                    <i class="fas fa-star" data-rating="5"></i>
                </div>
                <input type="hidden" id="ratingValue" name="rating" required>
            </div>
            
            <!-- Feedback Details -->
            <div class="mb-4">
                <label for="feedbackType" class="form-label">Feedback Type <span class="text-danger">*</span></label>
                <select class="form-select" id="feedbackType" name="feedback_type" required>
                    <option value="" selected disabled>Select feedback type</option>
                    <option value="product_quality">Product Quality</option>
                    <option value="shipping">Shipping/Delivery</option>
                    <option value="customer_service">Customer Service</option>
                    <option value="website_experience">Website Experience</option>
                    <option value="suggestion">Suggestion</option>
                    <option value="complaint">Complaint</option>
                </select>
            </div>
            
            <div class="mb-4">
                <label for="feedbackText" class="form-label">Your Feedback <span class="text-danger">*</span></label>
                <textarea class="form-control" id="feedbackText" name="feedback_text" rows="5" required placeholder="Please provide detailed feedback about your experience..."></textarea>
            </div>
            
            <!-- Additional Questions -->
            <div class="mb-4">
                <label class="form-label d-block mb-3">Would you recommend us to others?</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="recommend" id="recommendYes" value="yes">
                    <label class="form-check-label" for="recommendYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="recommend" id="recommendNo" value="no">
                    <label class="form-check-label" for="recommendNo">No</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="recommend" id="recommendMaybe" value="maybe">
                    <label class="form-check-label" for="recommendMaybe">Maybe</label>
                </div>
            </div>
            
            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="fas fa-paper-plane me-2"></i> Submit Feedback
                </button>
            </div>
        </form>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript for star rating -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const stars = document.querySelectorAll('.rating i');
            const ratingInput = document.getElementById('ratingValue');
            
            stars.forEach(star => {
                star.addEventListener('click', function() {
                    const rating = this.getAttribute('data-rating');
                    ratingInput.value = rating;
                    
                    stars.forEach(s => {
                        if (s.getAttribute('data-rating') <= rating) {
                            s.classList.add('active');
                        } else {
                            s.classList.remove('active');
                        }
                    });
                });
            });
            
            // Form validation
            const form = document.getElementById('feedbackForm');
            form.addEventListener('submit', function(e) {
                if (!ratingInput.value) {
                    e.preventDefault();
                    alert('Please provide a rating by clicking the stars');
                }
            });
        });
    </script>
</body>
</html>