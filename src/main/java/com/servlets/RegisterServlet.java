package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.entities.User;
import com.helper.EncryptPassword;
import com.helper.FactoryProvider;


@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean saveUserStatus = false;
		HttpSession httpSession = null;
		PrintWriter out = response.getWriter();

		// getting form data

		String userName = request.getParameter("username");
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		String encryptedPassword = EncryptPassword.getEncryptedPassword(userPassword);
		String userDOB = request.getParameter("dob");
		String userMobile = request.getParameter("mobile");
		String userGender = request.getParameter("gender");
		String userAddress = request.getParameter("address");
		String userAgreement = request.getParameter("agreement");

		/*
		 * out.println(userName); out.println(userEmail); out.println(userGender);
		 * out.println(abouUser); out.println(userAgreement);
		 */

		if (userAgreement == null) {
			out.println("not checked");
			System.out.println("please accept term & condition");
			// out.println(userAgreement);
		} else {
			try {

				SessionFactory sessionFactory = FactoryProvider.getSessionFactory();
				Session session = sessionFactory.openSession();
				Transaction tx = session.beginTransaction();

				User user = new User(userName, userEmail, encryptedPassword, userDOB, userMobile, userGender,
						userAddress,"normal","default.png");
				int userId = (int) session.save(user);

				tx.commit();
				session.close();
				httpSession = request.getSession();
				httpSession.setAttribute("msg", "User Registered successfully!!!" + " " + userEmail);
				response.sendRedirect("register.jsp");

				//out.print("User saved" + userId);
			} catch (ConstraintViolationException e) {
				httpSession = request.getSession();
				httpSession.setAttribute("msg", "This email already registered,try with another" + " " + userEmail);
				response.sendRedirect("register.jsp");
			} catch (Exception e) {
				e.printStackTrace();

			}

			/*
			 * if (abouUser != "" && abouUser!=null) { // creating user object and setting
			 * its value from the form User user = new User(userName, userEmail,
			 * encryptedPassword, userGender, abouUser);
			 * 
			 * UserDAO dao = new UserDAO(DBConnection.getDBConnection()); saveUserStatus =
			 * dao.saveUser(user);
			 * 
			 * if (saveUserStatus == true) { out.println("User registered successfully"); }
			 * else { out.println("something went wrong!!!"); } } else { // creating user
			 * object and setting its value from the form User user = new User(userName,
			 * userEmail, encryptedPassword, userGender);
			 * 
			 * UserDAO dao = new UserDAO(DBConnection.getDBConnection()); saveUserStatus =
			 * dao.saveUser(user);
			 * 
			 * if (saveUserStatus) { out.println("User registered successfully"); } else {
			 * out.println("something went wrong!!!"); } }
			 */
		}

	}

}
