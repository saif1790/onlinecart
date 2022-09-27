<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout Page</title>
<%@include file="all_js_css.jsp"%>
<%

User user = (User) session.getAttribute("currentUser");

if (user == null) {
	session.setAttribute("msg", "You are not logged in.Please first login to checkout your item");
	response.sendRedirect("login.jsp");
	return;
}
%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="common_modal.jsp"%>


	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 text-center">
				<div class="card">
					<h3>Your selected Items</h3>
					<div class="card-body">
						<div class="cart-body"></div>

					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<h3>Your Details For Order</h3>
					<div class="card-body">
						<form action="">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" value="<%=user.getUserEmail() %>" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1" value="<%=user.getUserName() %>"
									aria-describedby="emailHelp" placeholder="Enter name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile</label> <input type="text"
									class="form-control" id="exampleInputEmail1" value="<%=user.getUserMobileNumber() %>"
									aria-describedby="emailHelp" placeholder="Enter Mobile Number">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Shipping address</label>
								<textarea class="form-control"><%=user.getUserAddress() %></textarea>

							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary">Continue
									Shopping</button>	
								<button type="submit" class="btn btn-outline-success">Order
									Now</button>

							</div>

						</form>

					</div>
				</div>

			</div>

		</div>
	</div>
</body>
</html>