package ifsp.arq.tsi.web1.adotepet.servlets;

import ifsp.arq.tsi.web1.adotepet.model.Gender;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/userRegister")
public class UserRegisterServlet extends HttpServlet {
    public static void main(String[] args) {

    }

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
        Gender gender = Gender.valueOf(req.getParameter("gender"));

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);
        user.setCpf(cpf);
        user.setGender(gender);
        user.setDateOfBirth(LocalDate.parse(dateOfBirth, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        RequestDispatcher dispatcher = null;

        if (UsersWriter.write(user)) {
            dispatcher = req.getRequestDispatcher("login");
        } else {
            dispatcher = req.getRequestDispatcher("/pages/user-register.jsp");
        }
    }
}
