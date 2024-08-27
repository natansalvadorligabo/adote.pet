package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.pet.PetReader;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersReader;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/petDetails")

public class PetDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long petId = Long.valueOf(req.getParameter("id"));

        User owner = UsersReader.findUserById(petId);

        Pet pet = PetReader.findPetById(petId);

        String url = "/pages/home.jsp";

        if (pet != null) {
            req.setAttribute("pet", pet);
            req.setAttribute("owner", owner);

            url = "/pages/pet-details.jsp";
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }
}