package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Gender;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.ImageUploader;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@MultipartConfig
@WebServlet("/userRegister")
public class UserRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/user-register.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phoneNumber = req.getParameter("phoneNumber");
        String cpf = req.getParameter("cpf");
        String dateOfBirth = req.getParameter("dateOfBirth");
        Part filePart = req.getPart("photo");
        String imagePath = ImageUploader.upload(req, filePart, "users");
        Gender gender = Gender.valueOf(req.getParameter("gender"));

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);
        user.setCpf(cpf);
        user.setGender(gender);
        user.setDateOfBirth(LocalDate.parse(dateOfBirth, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        user.setPhoto(imagePath);
        RequestDispatcher dispatcher = null;

        if (UsersWriter.write(user)) {
            req.setAttribute("result", "User sucessfully registered");
            dispatcher = req.getRequestDispatcher("login");
        } else {
            req.setAttribute("result", "Email already registered");
            dispatcher = req.getRequestDispatcher("/pages/user-register.jsp");
        }

        dispatcher.forward(req, resp);
    }
}
