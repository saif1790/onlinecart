<%@page import="com.entities.User"%>


<%
User user1 = (User) session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark purple">
	<div class="container text-center">

		<a class="navbar-brand" href="index.jsp"><span><img
				src="img/bag.png" class="img-fluid " style="max-width: 40px;" /></span>
			OnlineCart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>
			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link" href="#!"><i
						class="fa fa-shopping-cart" style="font-size: 20px" data-toggle="modal" data-target="#cart-item-modal"></i><span
							class="ml-0 text-danger cart-items"> ( 0 )</span></a></li>

				<%
				if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login <span class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register <span class="sr-only">(current)</span></a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item active"><a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normalUser.jsp"%>"><%=user1.getUserName()%>
						<span class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="logout">Logout
						<span class="sr-only">(current)</span>
				</a></li>

				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>