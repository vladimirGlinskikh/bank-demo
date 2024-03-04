package kz.zhelezyaka.bankdemo.controllers;

import kz.zhelezyaka.bankdemo.helpers.Token;
import kz.zhelezyaka.bankdemo.models.User;
import kz.zhelezyaka.bankdemo.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;


@Controller
@Slf4j
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public ModelAndView getLogin() {
        log.info("In Login Page Controller");
        ModelAndView getLoginPage = new ModelAndView("login");

        String token = Token.generateToken();

        getLoginPage.addObject("token", token);
        getLoginPage.addObject("PageTitle", "Login");
        return getLoginPage;
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("_token") String token,
                        Model model,
                        HttpSession session) {

        if (email.isEmpty() || email == null || password.isEmpty() || password == null) {
            model.addAttribute("error", "Имя пользователя или пароль не могут быть пустыми");
            return "login";
        }

        String getEmailInDatabase = userRepository.getUserEmail(email);

        if (getEmailInDatabase != null) {
            String getPasswordInDatabase = userRepository.getUserPassword(getEmailInDatabase);

            if (!BCrypt.checkpw(password, getPasswordInDatabase)) {
                model.addAttribute("error", "Неверное имя пользователя или пароль");
                return "login";
            }
        } else {
            model.addAttribute("error", "Вы не зарегистрированы, пожалуйста зарегистрируйтесь");
            return "login";
        }

        User user = userRepository.getUserDetails(getEmailInDatabase);

        session.setAttribute("user", user);
        session.setAttribute("token", token);
        session.setAttribute("authenticated", true);

        return "redirect:/app/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "Успешно вышел из системы");
        return "redirect:/login";
    }
}