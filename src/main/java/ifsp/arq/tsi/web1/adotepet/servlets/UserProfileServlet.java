package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.ImageUploader;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersReader;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URISyntaxException;

@MultipartConfig
@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (UserLoginServlet.isUserNotLoggedIn(req, resp)) {
            return;
        }

        User user = (User) req.getSession(false).getAttribute("user");
        if (user != null) {
            if(req.getParameter("ownerId") != null) {
                Long ownerId = Long.valueOf(req.getParameter("ownerId"));
                User owner = UsersReader.findUserById(ownerId);
                if (owner != null) {
                    req.setAttribute("owner", owner);
                }
            }
        } else {
            req.setAttribute("errorMessage", "User not found.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/user-profile.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (UserLoginServlet.isUserNotLoggedIn(req, resp)) {
            return;
        }

        User user = (User) req.getSession(false).getAttribute("user");
        if (user != null) {
            String username = req.getParameter("name");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phone");

            user.setUsername(username);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);

            Part filePart = req.getPart("imageUploader");
            if (filePart != null && filePart.getSize() > 0) {
                String imagePath = null;
                try {
                    imagePath = ImageUploader.upload(req, filePart, "users");
                } catch (URISyntaxException e) {
                    throw new RuntimeException(e);
                }
                user.setPhoto(imagePath);
            }

            if (UsersWriter.update(user)) {
                req.setAttribute("result", "User sucessfully edited");
            } else {
                req.setAttribute("result", "Error in editing user");
            }
        } else {
            req.setAttribute("errorMessage", "User not found.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/user-profile.jsp");
        dispatcher.forward(req, resp);
    }
}
