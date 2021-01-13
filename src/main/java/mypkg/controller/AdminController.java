package mypkg.controller;

import java.util.List;
import mypkg.model.MyUser;
import mypkg.model.Restaurant;
import mypkg.model.RestaurantType;
import mypkg.model.Role;
import mypkg.service.MyUserService;
import mypkg.service.RestaurantService;
import mypkg.service.RestaurantTypeService;
import mypkg.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private MyUserService myUserService;
    @Autowired
    RoleService roleService;
    @Autowired
    private RestaurantService restaurantService;
    @Autowired
    private RestaurantTypeService restaurantTypeService;

    @ModelAttribute("roloi")
    public List<Role> getRoles() {
        return roleService.getRoles();
    }

    @ModelAttribute("restaurantTypes")
    public List<RestaurantType> getRestaurantTypes() {
        return (restaurantTypeService.getRestaurantTypes());
    }

    @ModelAttribute("managers")
    public List<MyUser> getManagers() {
        return (myUserService.getManagers());
    }

    @GetMapping
    public String showAdminHome() {
        return ("admin/adminHome");
    }

    @GetMapping("restaurants")
    public String showRestaurants(Model model) {
        List<Restaurant> restaurants = restaurantService.getRestaurants();
        model.addAttribute("restaurants", restaurants);
        return ("admin/restaurants");
    }

    @GetMapping("addRestaurant")
    public String addRestaurantForm(Model model) {
        model.addAttribute("restaurant", new Restaurant());
        return ("admin/addRestaurant");
    }

    @PostMapping("addRestaurant")
    public String addRestaurant(@ModelAttribute("restaurant") Restaurant restaurant, RedirectAttributes ra) {
        String msg;
        try {
            restaurantService.createOrUpdate(restaurant);
            msg = "Restaurant has been added!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/restaurants");
    }

    @GetMapping("delete")
    public String removeRestaurant(@RequestParam("id") Integer id, RedirectAttributes ra) {
        String msg;
        try {
            restaurantService.remove(id);
            msg = "Restaurant has been removed!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/restaurants");
    }

    @GetMapping("replace")
    public String replaceManagerForm(@RequestParam("id") Integer id, Model model) {
        Restaurant restaurant = restaurantService.findRestaurantByID(id);
        model.addAttribute("restaurant", restaurant);
        return ("admin/replace");
    }

    @PostMapping("replace")
    public String replaceManager(@ModelAttribute("restaurant") Restaurant restaurant, RedirectAttributes ra) {
        String msg;
        try {
            restaurantService.createOrUpdate(restaurant);
            msg = "Manager has been replaced!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/restaurants");
    }

    @GetMapping("addRestaurantType")
    public String addRestaurantTypeForm(Model model) {
        model.addAttribute("type", new RestaurantType());
        return ("admin/addRestaurantType");
    }

    @PostMapping("addRestaurantType")
    public String addRestaurantType(@ModelAttribute("type") RestaurantType restaurantType, RedirectAttributes ra) {
        String msg;
        try {
            restaurantTypeService.createOrUpdate(restaurantType);
            msg = "Restaurant type has been added!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/addRestaurant");
    }

    @GetMapping("addManager")
    public String addManagerForm(Model model) {
        model.addAttribute("manager", new MyUser());
        return ("admin/addManager");
    }

    @PostMapping("addManager")
    public String addManager(@ModelAttribute("manager") MyUser manager, RedirectAttributes ra) {
        String msg;
        try {
            myUserService.createOrUpdate(manager);
            msg = "Manager has been added!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/addRestaurant");
    }

    @GetMapping("users")
    public String showAllUsers(Model model) {
        List<MyUser> users = myUserService.getAllUsers();
        model.addAttribute("users", users);
        return ("admin/users");
    }

    @GetMapping("editUser")
    public String editUserForm(@RequestParam("id") Integer id, Model model) {
        MyUser user = myUserService.findByID(id);
        model.addAttribute("user", user);
        return ("/admin/editUser");
    }

    @PostMapping("editUser")
    public String editUser(@ModelAttribute("user") MyUser user, RedirectAttributes ra) {
        String msg;
        myUserService.createOrUpdate(user);
        msg = "User information have changed!";
        ra.addFlashAttribute("adminMsg", msg);
        return ("redirect:/admin/users");
    }

    @GetMapping("deleteUser")
    public String removeUser(@RequestParam("id") Integer id, RedirectAttributes ra) {
        String msg;
        try {
            myUserService.remove(id);
            msg = "User has been removed!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/users");
    }

    @GetMapping("cleanup")
    public String verifyManagers(RedirectAttributes ra) {
        String msg;
        try {
            myUserService.removeUnattachedManagers();
            msg = "All unattached managers have been removed!";
            ra.addFlashAttribute("adminMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("adminMsg", msg);
        }
        return ("redirect:/admin/users");
    }

}
