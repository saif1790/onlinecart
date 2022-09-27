<%@page import="com.helper.Get10Words"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDAO"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDAO"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>


<html>
<head>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%@include file="common_modal.jsp" %>

	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%
			String catItem = request.getParameter("category");
			ProductDAO dao = new ProductDAO(FactoryProvider.getSessionFactory());
			List<Product> list = null;
			if (catItem == null || catItem.trim().equals("all")) {
				list = dao.getAllProduct();
			} else {

				int categoryId = Integer.parseInt(catItem.trim());
				list = dao.getAllProductByCategoryId(categoryId);

			}

			CategoryDAO catDAO = new CategoryDAO(FactoryProvider.getSessionFactory());
			List<Category> listCat = catDAO.getCategories();
			%>

			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>
					<%
					for (Category cat : listCat) {
					%>

					<!-- 	 //adding list group to display all categories -->

					<a href="index.jsp?category=<%=cat.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>
			<div class="col-md-10">

				<div class="row mt-4">
					<div class="col-md-12">

						<div class="card-columns">
							<%
							for (Product product : list) {
							%>

							<div class="card product-card">
								<div class="container text-center">
									<img class="card-img-top m-2"
										style="max-width: 100%; max-height: 200px; width: auto;"
										src="img/products/<%=product.getProductPhoto()%>"
										alt="Card image cap">
								</div>
								<div class="card-body">

									<h5 class="card-title"><%=product.getProductName()%></h5>
									<p class="card-text">
										<%=Get10Words.get10Words(product.getProductDescription())%></p>
								</div>
								<div class="container text-center">
									<div class="card-footer ">
										<button class="btn purple text-white"
											onclick="addToCart(<%=product.getProductId()%>,'<%=product.getProductName()%>',<%=product.getPriceAfterDiscount()%>)">Add
											to cart</button>
										<button class="btn btn-outline-primary">
											&#8377;<%=product.getPriceAfterDiscount() %>/- <span
												class="text-secondry discounted-price"><%=product.getProductPrice()%></span><span
												class="text-secondry discount-label text-danger"><%=product.getProductDiscount()+"% off" %></span>
										</button>
									</div>
								</div>
							</div>

							<%
							}
							if (list.size() == 0) {
							%>

							<div class="container text-center">

								<h2 class="text-center">No item in this Category...</h2>

							</div>
							<%
							}
							%>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>
