package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.PetGender;
import ifsp.arq.tsi.web1.adotepet.model.Size;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.ImageUploader;
import ifsp.arq.tsi.web1.adotepet.model.util.pet.PetWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.net.URISyntaxException;

@MultipartConfig
@WebServlet("/petRegister")
public class PetRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("pages/add-pet.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (UserLoginServlet.isUserNotLoggedIn(req, resp)) {
            return;
        }

        User user = (User) req.getSession().getAttribute("user");

        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        String age = req.getParameter("age");
        Size size = Size.valueOf(req.getParameter("size"));
        String description = req.getParameter("description");
        PetGender petGender = PetGender.valueOf(req.getParameter("gender"));
        String color = req.getParameter("color");

        Part filePart = req.getPart("photo");
        String imagePath = null;
        try {
            imagePath = ImageUploader.upload(req, filePart, "pets");
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }

        Pet pet = new Pet();

        pet.setName(name);
        pet.setBreed(breed);
        pet.setAge(Integer.parseInt(age));
        pet.setSize(size);
        pet.setDescription(description);
        pet.setGender(petGender);
        pet.setColor(color);
        pet.setPhoto(imagePath);
        pet.setAdopted(false);
        pet.setOwnerId(user.getId());

        if (PetWriter.write(pet)) {
            req.getSession(false).setAttribute("result", "pet-registered");
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.getSession(false).setAttribute("result", "pet-not-registered");
            resp.sendRedirect(req.getContextPath() + "/petRegister");
        }
    }
}
