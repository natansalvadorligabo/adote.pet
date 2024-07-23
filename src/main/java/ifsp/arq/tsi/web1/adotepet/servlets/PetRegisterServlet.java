package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.PetGender;
import ifsp.arq.tsi.web1.adotepet.model.Size;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.pet.PetWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/petRegister")
public class PetRegisterServlet extends HomeServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("pages/add-pet.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");


        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        String age = req.getParameter("age");
        Size size = Size.valueOf(req.getParameter("size"));
        String description = req.getParameter("description");
        PetGender petGender = PetGender.valueOf(req.getParameter("gender"));
        String color = req.getParameter("color");
        String address = req.getParameter("address");
        String photo = req.getParameter("photo");

        Pet pet = new Pet();

        pet.setName(name);
        pet.setBreed(breed);
        pet.setAge(Integer.parseInt(age));
        pet.setSize(size);
        pet.setDescription(description);
        pet.setGender(petGender);
        pet.setColor(color);
        pet.setAddress(address);
        pet.setAdopterId(user.getId());
        pet.setPhoto(photo);
        pet.setAdopted(false);

        RequestDispatcher dispatcher = null;

        if (PetWriter.write(pet)) {
            req.setAttribute("result", "pet-registered");
            dispatcher = req.getRequestDispatcher("home");
        } else {
            req.setAttribute("result", "pet-not-registered");
            dispatcher = req.getRequestDispatcher("petRegister");
        }

        dispatcher.forward(req, resp);

    }
}
