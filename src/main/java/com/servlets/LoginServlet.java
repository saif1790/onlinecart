package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.entities.User;
import com.helper.DecryptPassword;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = null;
		PrintWriter out = response.getWriter();

		String userEmail = request.getParameter("email");
		String userPass = request.getParameter("password");

		// authenticate the user

		UserDAO dao = new UserDAO(FactoryProvider.getSessionFactory());
		User user = dao.getUserByEmail(userEmail);

		if (user == null) {

			out.print("user is not exist");
			httpSession = request.getSession();
			httpSession.setAttribute("msg", "user does not exist,try with another!!");
			response.sendRedirect("login.jsp");
		}

		else if (userEmail.equalsIgnoreCase(user.getUserEmail())
				&& userPass.equals(DecryptPassword.getDecryptedPassword(user.getUserPassword()))) {
			if (user.getUserType().equals("admin")) {
				httpSession = request.getSession();
				httpSession.setAttribute("currentUser", user);
				response.sendRedirect("admin.jsp");
			} else {
				httpSession = request.getSession();
				httpSession.setAttribute("currentUser", user);
				response.sendRedirect("normalUser.jsp");
				
			}

		}

		else {
			httpSession = request.getSession();
			httpSession.setAttribute("msg", "Use Invalid!!");
			response.sendRedirect("login.jsp");
		}
	}

}
