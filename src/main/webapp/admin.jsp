<%@page import="com.dao.ProductDAO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.CategoryDAO"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="common_modal.jsp"%>
	<%
	User user = (User) session.getAttribute("currentUser");

	if (user == null) {
		session.setAttribute("msg", "You are not logged in.Please first login");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("normal")) {
			session.setAttribute("msg", "You cant access Admin page");
			response.sendRedirect("login.jsp");
			return;
		}

	}
	%>

	<%
	CategoryDAO dao = new CategoryDAO(FactoryProvider.getSessionFactory());
	List<Category> c = dao.getCategories();
	%>
	<div class="container mt-4 admin">
		<div class="container text-center">
			<%
			String m = (String) session.getAttribute("msg");

			if (m != null) {
			%>
			<div class="alert alert-success" role="alert">
				<%=m%>

				<%
				session.removeAttribute("msg");
				}
				%>
			</div>
			<div class="row">

				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
								<img alt="" src="img/users.png" style="max-width: 70px;"
									class=" img-fluid rounded-circle">
							</div>
							<%
							UserDAO userDAO = new UserDAO(FactoryProvider.getSessionFactory());
							Long userCounts = userDAO.getUsersCount();
							
							ProductDAO productDAO = new ProductDAO(FactoryProvider.getSessionFactory());
							Long productCounts = productDAO.getProductsCount();
							%>
							<h1><%=userCounts%></h1>
							<h1 class="text-uppercase">Users</h1>
						</div>

					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body  text-center">
							<div class="container">
								<img alt="" src="img/categories.png" style="max-width: 70px;"
									class=" img-fluid rounded-circle">
							</div>
							<h1><%=c.size() %></h1>
							<h1 class="text-uppercase">Categories</h1>
						</div>

					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body  text-center">
							<div class="container">
								<img alt="" src="img/product.png" style="max-width: 70px;"
									class=" img-fluid rounded-circle">
							</div>
							<h1><%=productCounts%></h1>
							<h1 class="text-uppercase">Products</h1>
						</div>

					</div>
				</div>
			</div>

			<div class="row mt-2">
				<div class="col-md-6">
					<div class="card" data-toggle="modal"
						data-target="#add-category-modal">
						<div class="card-body  text-center">
							<div class="container">
								<img alt="" src="img/add_Categories.png"
									style="max-width: 70px;" class=" img-fluid rounded-circle">
							</div>
							<p>click hare to add Categories</p>
							<h1 class="text-uppercase">Add Categories</h1>
						</div>

					</div>
				</div>
				<div class="col-md-6">
					<div class="card" data-toggle="modal"
						data-target="#add-product-modal">
						<div class="card-body text-center">
							<div class="container">
								<img alt="" src="img/add-product.png" style="max-width: 70px;"
									class=" img-fluid rounded-circle">
							</div>
							<p>click hare to add Products</p>
							<h1 class="text-uppercase">Add Products</h1>
						</div>

					</div>
				</div>
			</div>

		</div>

		<!-- start of add categories modal -->


		<!-- Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header purple text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill category
							details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="ProductOperationServlet" method="post">
							<input type="hidden" name="operation" value="addCategory">
							<div class="form-group">
								<div>
									<input type="text" name="title"
										placeholder="Enter Category Title" class="form-control"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<div>
									<textarea style="height: 300px;" rows="" cols=""
										placeholder="Enter Decsription of the Category"
										class="form-control" required="required" name="description"></textarea>
								</div>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Add
									Category</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>


		<!-- start of add Product modal -->


		<div class="modal fade" id="add-product-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header purple text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill Product
							details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="ProductOperationServlet" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="operation" value="addProduct">
							<div class="form-group">
								<div>
									<input type="text" name="pname"
										placeholder="Enter Product Name" class="form-control"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<div>
									<input type="number" name="price"
										placeholder="Enter Product Price" class="form-control"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<div>
									<input type="number" name="pQuantity"
										placeholder="Enter Product Quantity" class="form-control"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<div>
									<input type="number" name="pDiscount"
										placeholder="Enter Product Discount" class="form-control"
										required="required">
								</div>
							</div>


							<div class="form-group">
								<select name="catId" class="form-control">
									<%
									for (Category cat : c) {
									%>
									<option value="<%=cat.getCategoryId()%>"><%=cat.getCategoryTitle()%></option>
									<%
									}
									%>
								</select>
							</div>
							<div class="form-group">
								<label>Select Product Photo</label>
								<div>
									<input type="file" name="photo"
										placeholder="Enter Product Quantity" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<div>
									<textarea style="height: 300px;" rows="" cols=""
										placeholder="Enter Decsription of the Category"
										class="form-control" required="required" name="pDesc"></textarea>
								</div>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Add
									Product</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>


		<!-- end of add Products modal -->
</body>
</html>