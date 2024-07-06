package br.edu.ifsp.arqweb1.ifitness.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arqweb1.ifitness.model.User;
import br.edu.ifsp.arqweb1.ifitness.model.util.users.UserLogin;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final int cookieMaxAge = 60 * 60 * 24;

	public UserLoginServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		RequestDispatcher dispatcher = null;
		
		try {
			User user = UserLogin.login(email, password);

			req.setAttribute("user", user);

			// TO DO: jsp home page path
			dispatcher = req.getRequestDispatcher("/home-login.jsp");
		}
		catch(UserNotFoundException usnf)
		{
			req.setAttribute("result", usnf.getMessage());
			dispatcher = req.getRequestDispatcher("/home-login.jsp");
		}
		catch(Exception generic){
			req.setAttribute("result", generic.getMessage());
			dispatcher = req.getRequestDispatcher("/home-login.jsp");
		}

		dispatcher.forward(req, resp);
	}
}