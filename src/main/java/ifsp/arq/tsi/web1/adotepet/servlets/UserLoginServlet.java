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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	@Serial
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		RequestDispatcher dispatcher;
		
		try {
			User user = UserLogin.login(email, password);
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(30 * 60);
			session.setAttribute("user", user);
			dispatcher = req.getRequestDispatcher("home");
		}
		catch(UserNotFoundException exception){
			req.setAttribute("result", exception.getMessage());
			dispatcher = req.getRequestDispatcher("/login.jsp");
		}

		dispatcher.forward(req, resp);
	}
}