<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<!-- navbar -->

	<%@include file="navbar.jsp"%>
	<%@include file="common_modal.jsp"%>
	<main
		class="d-flex align-items-center primary-background banner-background text-white"
		style="height: 70vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card mt-5">
						<%
						String m = (String) session.getAttribute("msg");
						if (m != null) {
						%>
						<div class="alert alert-danger" role="alert">
							<%=m%>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>
						<div class="card-header text-center primary-background text-dark">
							<span><img src="img/login.png" class="img-fluid "
								style="max-width: 100px;" /></span> </br>
							<!-- <H3>Register here</H3> -->
						</div>

						<%--  <%
						 Message m =(Message)session.getAttribute("msg");

						if (m != null) {
						%>
						<div class="alert <%=m.getCssClass()%>" role="alert">
							<%=m.getContent()%>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>   --%>


						<div class="card-body">
							<form action="login" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1" style="color: black;">Email
										address</label> <input type="email" class="form-control form-text"
										id="exampleInputEmail1" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" style="color: black;">Password</label>
									<input type="password" class="form-control" name="password"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label
										class="form-check-label text-dark" for="exampleCheck1">Check
										me out</label>
								</div>
								<div class="container text-center mt-2">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>
	</main>



</body>
</html>