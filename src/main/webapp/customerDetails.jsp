<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.org.main.CartItem, com.google.gson.Gson" %>
<%
HttpSession ses = request.getSession(false);
List<CartItem> cart = (List<CartItem>) ses.getAttribute("cart");
Gson gson = new Gson();
String cartJson = gson.toJson(cart);
request.setAttribute("cartJson", cartJson);
double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
int id = Integer.parseInt(request.getParameter("id"));
//out.print(cartJson);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
	<main>
		<section class="container d-flex align-item-center justify-content-center">
		<form id="customerForm" action="ProcessPaymentServlet" method="post">
			<h2 class="text-center w-100">Customer Details</h2>
			<h3>Personal Details</h3>
            <hr>
            <input type="text" name="name" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Enter Full Name" required>
			<input type="tel" name="phone" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Phone" required>
			<input type="email" name="email" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Email" required>
			<h3>Address Details</h3>
            <hr>
            <input type="text" name="flatBuilding" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Building, Flat No" required>
            <input type="text" name="landmark" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Landmark" required>
            <input type="text" name="area" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Area Name" required>
		    <input type="text" name="city" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="City" required>
			<input type="text" name="state" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="State" required>
			<input type="text" name="pincode" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Pin Code" required>
            <input type="text" name="country" value="India" class="mb-4 email form-control w-100 border border-dark rounded-0" id="exampleFormControlInput1" placeholder="Country"  disabled readonly>
			<input type="hidden" name="totalAmount" value="<%=totalAmount %>">
        	<input type="hidden" name="productDetails" value='<%=cartJson %>'>
        	<input type="hidden" name="cId" value="<%=id %>">
        	<button type="button" onclick="openRazorpay()" name="detailsSubmit" class="btn btn-dark rounded-0 text-center py-2 px-4 fs-5">Proceed to Payment</button>
		</form>
	</section>
	</main>
    <script>
        function openRazorpay() {
            const totalAmount = document.querySelector('input[name="totalAmount"]').value;
            
            const options = {
                key: "rzp_test_VwqFWlo6Fv8q4R", // Replace with your Razorpay Key ID
                amount: totalAmount * 100, // Amount in paise (e.g., 1000 = ₹10)
                currency: "INR",
                name: "Stylox Fashion Hub",
                description: "Payment for Order",
                image: "images/illustration/account.png", // Your logo URL
                handler: function (response) {
                	
                    alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                    const form = document.getElementById("customerForm");
                    const paymentIdInput = document.createElement("input");
                    paymentIdInput.type = "hidden";
                    paymentIdInput.name = "paymentId";
                    paymentIdInput.value = response.razorpay_payment_id;
                    form.appendChild(paymentIdInput);
                    form.submit();
                },
                prefill: {
                    name: document.querySelector('input[name="name"]').value,
                    email: document.querySelector('input[name="email"]').value,
                    contact: document.querySelector('input[name="phone"]').value,
                },
                notes: {
                	city: document.querySelector('input[name="city"]').value
                },
                theme: {
                    color: "#000000", // Customize the theme color
                },
            };

            const rzp = new Razorpay(options);
            rzp.open();
        }
    </script>
</body>
</html>