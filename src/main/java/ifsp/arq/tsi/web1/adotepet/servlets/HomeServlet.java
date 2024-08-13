package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.util.pet.PetReader;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    public HomeServlet() {}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String url = "/login.jsp";

        if (session != null) {
            if (session.getAttribute("user") != null) {
                url = "/pages/home.jsp";
            }
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        req.setAttribute("petDataset", PetReader.read());
        dispatcher.forward(req, resp);
    }
}