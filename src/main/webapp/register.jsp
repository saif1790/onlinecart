<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<!-- navbar -->

	<%@include file="navbar.jsp"%>

	<main class="primary-background banner-background p-5"
		style="padding-bottom: 80px">

		<div class="container">
			<div class="col-md-6 offset-md-3">
				<%
				String message = (String) session.getAttribute("msg");
				if (message != null) {
				%>
				<div class="alert alert-danger" role="alert">
					<%=message%>
				</div>

				<%
				  session.removeAttribute("msg");
				}
				%>
				<div class="card ">

					<div class="card-header text-center primary-background text-dark">
						 <img
							src="img/signup.png" class="img-fluid " style="max-width: 100px;" /></span>
						</br>
						<!-- <H3>Register here</H3> -->
					</div>
					<div class="card-body px-5">
						<form action="RegisterServlet" method="post" id="reg">
							<div class="form-group">
								<label for="user_name">Username</label> <input type="text"
									class="form-control" id="exampleInputEmail1" name="username"
									aria-describedby="emailHelp" placeholder="Enter userName"
									required="required">
							</div>

							<div class="form-group">
								<label for="user_email">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required="required"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Date Of Birth</label> <input
									name="dob" type="date" class="form-control"
									id="exampleInputPassword1" placeholder="dob"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Mobile</label> <input
									name="mobile" type="number" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Mobile Number"
									required="required">
							</div>

							<div class="form-group">
								<label for="user_gender">Select Gender</label> </br> <input
									type="radio" id="gender" name="gender" value="Male"
									required="required">Male <input type="radio"
									id="gender" name="gender" value="Female" required="required">Female
							</div>
							<div class="form-group">
								<label for="user_address">User Address</label> </br>
								<textarea class="form-control" rows="5" name="address"
									placeholder="Enter your Address" value="null"></textarea>

							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="agreement"
									id="exampleCheck1"> <label
									class="form-check-label text-dark" for="exampleCheck1">agree
									trems & conditiont</label>
							</div>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-3x text=center"></span>
								<h4>Please wait...</h4>
							</div>
							</br>
					</div>
					<div class="card-footer text-center">
						<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						<button id="reset-btn" type="reset"
							class="btn btn-outline-warning">Reset</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</main>

	<!-- <script type="text/javascript"> 
	  var form = $('#reg');
	  form.submit(function (event) {
	      event.preventDefault(); 
	   $("#submit-btn").hide();
	   $("#reset-btn").hide();
	   $("#loader").show()
	     
	  $.ajax({
	  type: 'POST',
	  url: "RegisterServlet",
	  data: form.serialize(),
	  success : function (data,textStatus, jqXHR) {
	      console.log(data);
	      if(data.trim()=="not checked")
		  {
		  swal(
			    "Error!!",
			    "Please accept terms n condition!!",
			    "error");
		  $("#submit-btn").show();
		   $("#loader").hide()
		  }
	      else if(data.trim()=="done"){
		   console.log(data);
		   $("#submit-btn").show();
		   $("#loader").hide();
		   swal("Registration Successfully Submitted!!! & we are redireting to Login.jsp page")
		   .then((value) => {
		       window.location="login.jsp";
		   });
		      
	    }},
	    error :function (jqXHR,textStatus, errorThrown) {
		console.log(jqXHR);
		   $("#submit-btn").show();
		   $("#loader").hide();
		   swal("Something went wrong!!")
	    },
	    processData : false,
	    contentData : false
	  
	  });
	   
	  });
    </script> -->
</body>
</html>