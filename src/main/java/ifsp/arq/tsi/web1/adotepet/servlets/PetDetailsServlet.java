package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.PetGender;
import ifsp.arq.tsi.web1.adotepet.model.Size;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.ImageUploader;
import ifsp.arq.tsi.web1.adotepet.model.util.pet.PetReader;
import ifsp.arq.tsi.web1.adotepet.model.util.pet.PetWriter;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersReader;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URISyntaxException;

@WebServlet("/petDetails")
@MultipartConfig
public class PetDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "home";
        Long petId = Long.valueOf(req.getParameter("id"));
        Pet pet = PetReader.findPetById(petId);

        if (pet != null) {
            url = "/pages/pet-details.jsp";
            User owner = UsersReader.findUserById(pet.getOwnerId());

            req.setAttribute("pet", pet);
            req.setAttribute("owner", owner);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "/pages/pet-details.jsp";
        if (UserLoginServlet.isUserNotLoggedIn(req, resp)) {
            return;
        }

        Long petId = Long.valueOf(req.getParameter("id"));
        Pet pet = PetReader.findPetById(petId);
        if (pet != null) {
            String action = req.getParameter("action");
            if (action.equals("edit")) {
                String name = req.getParameter("name");
                Integer age  = Integer.valueOf(req.getParameter("age"));
                String breed = req.getParameter("breed");
                Size size = Size.valueOf(req.getParameter("size"));
                PetGender gender = PetGender.valueOf(req.getParameter("gender"));
                String color = req.getParameter("color");
                String description = req.getParameter("description");

                pet.setName(name);
                pet.setAge(age);
                pet.setBreed(breed);
                pet.setSize(size);
                pet.setGender(gender);
                pet.setColor(color);
                pet.setDescription(description);

                Part filePart = req.getPart("imageUploader");
                if (filePart != null && filePart.getSize() > 0) {
                    String imagePath = null;
                    try {
                        imagePath = ImageUploader.upload(req, filePart, "pets");
                    } catch (URISyntaxException e) {
                        throw new RuntimeException(e);
                    }
                    pet.setPhoto(imagePath);
                }

                if (PetWriter.update(pet)) {
                    req.setAttribute("result", "Pet sucessfully edited");
                    req.setAttribute("pet", pet);
                } else {
                    req.setAttribute("result", "Error in editing pet");
                }
            } else if (action.equals("remove")) {
                if (PetWriter.delete(pet)) {
                    req.setAttribute("result", "Pet sucessfully removed");
                } else {
                    req.setAttribute("result", "Error in removing pet");
                }
                url = "home";
            }
        } else {
            req.setAttribute("id", petId);
            req.setAttribute("errorMessage", "Pet not found.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }
}