package ifsp.arq.tsi.web1.adotepet.servlets;

import java.io.IOException;
import java.io.Serial;

import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UserLogin;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UserNotFoundException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	@Serial
	private static final long serialVersionUID = 1L;

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
		catch(UserNotFoundException exception){
			req.setAttribute("result", exception.getMessage());
			dispatcher = req.getRequestDispatcher("/home-login.jsp");
		}

		dispatcher.forward(req, resp);
	}
}