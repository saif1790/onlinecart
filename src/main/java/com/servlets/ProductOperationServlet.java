package com.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.hql.internal.ast.tree.IntoClause;

import com.dao.CategoryDAO;
import com.dao.ProductDAO;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String operation = request.getParameter("operation");

		if (operation.trim().equals("addCategory")) {

			String title = request.getParameter("title");
			String description = request.getParameter("description");

			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			CategoryDAO dao = new CategoryDAO(FactoryProvider.getSessionFactory());
			int catId = dao.saveCategory(category);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("msg", "Category has been saved!!!");
			response.sendRedirect("admin.jsp");

		} else if (operation.trim().equals("addProduct")) {
			String productName = request.getParameter("pname");
			int productPrice = Integer.parseInt(request.getParameter("price"));
			int productQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int productDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("photo");
			String productDescription = request.getParameter("pDesc");

			// getting Category object
			CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getSessionFactory());
			Category category = categoryDAO.getCategoryByCategoryId(catId);
			System.out.println("Catid" + " " + catId);

			// adding Product object

			Product product = new Product();
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setProductQuantity(productQuantity);
			product.setProductDiscount(productDiscount);
			product.setProductPhoto(part.getSubmittedFileName());
			product.setProductDescription(productDescription);
			product.setCategory(category);

			try {

				ProductDAO dao = new ProductDAO(FactoryProvider.getSessionFactory());
				boolean saveProductStatus = dao.saveProduct(product);
				HttpSession httpSession = request.getSession();

				/* get product photo path */
				String path = request.getRealPath("img") + File.separator + "products" + File.separator
						+ part.getSubmittedFileName();
				System.out.println(path);

				/* uploading on path */

				FileOutputStream fos = new FileOutputStream(path);

				InputStream is = part.getInputStream();

				byte[] data = new byte[is.available()];

				is.read(data);

				/* writing data Into fos */
				fos.write(data);

				fos.close();

				if (saveProductStatus) {
					httpSession.setAttribute("msg", "Product has been saved successfully!!!");
					response.sendRedirect("admin.jsp");
				} else {
					httpSession.setAttribute("msg", "Somethings went wrong!!!");
					response.sendRedirect("admin.jsp");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
