<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Shipping and Payment Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
String qty="";
try{
	
	for(int slno=1; slno<=10; slno++)	{
		if(request.getParameter("qty" + slno) == null){
			break;
		}
		qty += request.getParameter("qty" + slno) +",";
	}
	
	
}catch(Exception e){
	System.out.println("Error:"+ e);
}

System.out.println("qty=" + qty);

session.setAttribute("qty", qty);

%>

<div class="container mt-5 card">
  <h2 class="mb-4 text-primary">Shipping Details</h2>
  <form name='f1' method="post" action="/EcommerceWebsite/addPayment">
    <div class="mb-3">
      <label for="deliveryAddress" class="form-label">Delivery Address</label>
      <textarea class="form-control" id="deliveryAddress" name="deliveryAddress" rows="3" required>Warangal</textarea>
    </div>
    <div class="row mb-3">
      <div class="col-md-6">
        <label for="mobileNumber" class="form-label">Mobile Number</label>
        <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" value="1234567890" required pattern="[0-9]{10}">
      </div>
      <div class="col-md-6">
        <label for="zipCode" class="form-label">ZIP Code</label>
        <input type="text" class="form-control" id="zipCode" name="zipCode" value="123456" required pattern="[0-9]{6}">
      </div>
    </div>

    <h2 class="mb-4 text-success">Payment Details</h2>

    <div class="row mb-3">
      <div class="col-md-4">
        <label for="cardType" class="form-label">Card Type</label>
        <select class="form-select" id="cardType" name="cardType" required>
          <option value="">Choose...</option>
          <option selected>Visa</option>
          <option>MasterCard</option>
          <option>RuPay</option>
        </select>
      </div>
      <div class="col-md-8">
        <label for="cardNumber" class="form-label">Card Number</label>
        <input type="text" class="form-control" id="cardNumber" name="cardNumber" value="1231231231231234" required pattern="[0-9]{16}">
      </div>
    </div>

    <div class="row mb-3">
      <div class="col-md-6">
        <label for="customerName" class="form-label">Name on Card</label>
        <input type="text" class="form-control" id="customerName" name="customerName" value="VMK" required>
      </div>
      <div class="col-md-3">
        <label for="expiryDate" class="form-label">Expiry Date</label>
        <input type="text" class="form-control" id="expiryDate" name="expiryDate" value="12-2025" required>
      </div>
      <div class="col-md-3">
        <label for="cvvNumber" class="form-label">CVV</label>
        <input type="password" class="form-control" id="cvvNumber" name="cvvNumber" value="123" required pattern="[0-9]{3}">
      </div>
    </div>

    <button type="submit" class="btn btn-primary w-100">Submit Payment</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
