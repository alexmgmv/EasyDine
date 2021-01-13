package mypkg.controller;

import java.util.List;
import mypkg.model.MyUser;
import mypkg.model.Role;
import mypkg.service.MyUserService;
import mypkg.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private MyUserService myUserService;
    @Autowired
    RoleService roleService;

    @ModelAttribute("roloi")
    public List<Role> getRoles() {
        return roleService.getRoles();
    }

    @GetMapping
    public String showHomePage() {
        return ("home");
    }

    @GetMapping("/signup")
    public String addCustomerForm(Model model) {
        model.addAttribute("customer", new MyUser());
        return ("addCustomer");
    }

    @PostMapping("/signup")
    public String addCustomer(@ModelAttribute("customer") MyUser customer, RedirectAttributes ra) {
        String msg;
        customer.setCredits(100.0f);
        try {
            myUserService.createOrUpdate(customer);
            msg = "Thank you for registering!" + "</br></br>" + "You have won 100\u20AC for in-app purchases!!!" + "</br></br>" + "Use your credentials to sign-in.";
            ra.addFlashAttribute("customerMsg", msg);
            return ("redirect:/welcome");
        } catch (Exception e) {
            msg = "This username is being used." + "</br>" + "Try a different one!";
            ra.addFlashAttribute("customerMsg", msg);
            return ("redirect:/loginPage");
        }
    }

    @GetMapping("/welcome")
    public String registrationConfirmation() {
        return ("welcome");
    }

}
