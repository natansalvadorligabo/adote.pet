package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
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
import java.util.List;

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
                List<Pet> pets = PetReader.read();

                String search = req.getParameter("search");

                if (search != null) {
                    if (!search.trim().isEmpty()) {
                        pets = pets.stream()
                                .filter(pet -> pet.getName().toUpperCase().contains(search.toUpperCase()) ||
                                        pet.getBreed().toUpperCase().contains(search.toUpperCase()))
                                .toList();
                    }
                }

                req.setAttribute("pets", pets);
                url = "/pages/home.jsp";
            }
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }
}
