package mypkg.controller;

import java.time.LocalTime;
import java.util.List;
import mypkg.model.MenuItem;
import mypkg.model.MenuPerRestaurant;
import mypkg.model.MyUser;
import mypkg.model.Reservation;
import mypkg.model.Restaurant;
import mypkg.model.RestaurantType;
import mypkg.model.Review;
import mypkg.model.WorkingHours;
import mypkg.service.MenuItemService;
import mypkg.service.MenuPerRestaurantService;
import mypkg.service.MyUserService;
import mypkg.service.ReservationService;
import mypkg.service.RestaurantService;
import mypkg.service.RestaurantTypeService;
import mypkg.service.ReviewService;
import mypkg.service.WorkingHoursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ReviewService reviewService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private MyUserService myUserService;
    @Autowired
    private RestaurantService restaurantService;
    @Autowired
    private MenuPerRestaurantService menuPerRestaurantService;
    @Autowired
    private RestaurantTypeService restaurantTypeService;
    @Autowired
    private MenuItemService menuItemService;
    @Autowired
    private WorkingHoursService workingHoursService;

    @ModelAttribute("restaurantTypes")
    public List<RestaurantType> getRestaurantTypes() {
        return (restaurantTypeService.getRestaurantTypes());
    }

    @ModelAttribute("allMenuItems")
    public List<MenuItem> getMenuItems() {
        return (menuItemService.getMenuItems());
    }

    @GetMapping
    public String showManagerHome() {
        return ("manager/managerHome");
    }

    @GetMapping("/info")
    public String editManagerInfoForm(Authentication authentication, Model model) {
        String username = authentication.getName();
        MyUser manager = myUserService.findUserByUsername(username);
        model.addAttribute("manager", manager);
        return ("manager/info");
    }

    @PostMapping("/info")
    public String editManagerInfo(@ModelAttribute("manager") MyUser manager, RedirectAttributes ra) {
        String msg;
        try {
            myUserService.createOrUpdate(manager);
            msg = "Your personal information have changed!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager");
    }

    @GetMapping("/restaurant")
    public String showRestaurantInfo(Authentication authentication, Model model) {
        String username = authentication.getName();
        MyUser manager = myUserService.findUserByUsername(username);
        int id = manager.getId();
        List<Restaurant> restaurants;
        restaurants = restaurantService.findManagedRestaurants(id);
        model.addAttribute("restaurants", restaurants);
        return ("manager/restaurant");
    }

    @GetMapping("/editRestaurantInfo")
    public String editRestaurantInfoForm(@RequestParam("id") Integer id, Model model) {
        Restaurant restaurant = restaurantService.findRestaurantByID(id);
        model.addAttribute("restaurant", restaurant);
        return ("manager/editRestaurantInfo");
    }

    @PostMapping("/editRestaurantInfo")
    public String editRestaurantInfo(@ModelAttribute("restaurant") Restaurant restaurant, RedirectAttributes ra) {
        String msg;
        try {
            restaurantService.createOrUpdate(restaurant);
            msg = "Restaurant information have changed!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/menu")
    public String showMenu(@RequestParam("id") Integer id, Model model) {
        List<MenuPerRestaurant> menuList = menuPerRestaurantService.findAllByRestaurantID(id);
        model.addAttribute("menuItems", menuList);
        Restaurant restaurant = restaurantService.findRestaurantByID(id);
        model.addAttribute("restaurant", restaurant);
        return ("manager/menu");
    }

    @GetMapping("/editMenu")
    public String editMenuForm(@RequestParam("id") Integer id, Model model) {
        MenuPerRestaurant menuPerRestaurant = menuPerRestaurantService.findMenuByID(id);
        model.addAttribute("menu", menuPerRestaurant);
        return ("manager/editMenu");
    }

    @PostMapping("/editMenu")
    public String editMenu(@ModelAttribute("menu") MenuPerRestaurant menuPerRestaurant, RedirectAttributes ra) {
        String msg;
        try {
            menuPerRestaurantService.createOrUpdate(menuPerRestaurant);
            msg = "Menu has been updated!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/deleteMenu")
    public String deleteMenu(@RequestParam("id") Integer id, RedirectAttributes ra) {
        String msg;
        try {
            menuPerRestaurantService.remove(id);
            msg = "Menu has been updated!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/addMenu")
    public String addMenuForm(@RequestParam("id") Integer id, Model model) {
        MenuPerRestaurant menuPerRestaurant = new MenuPerRestaurant();
        menuPerRestaurant.setRestaurant(restaurantService.findRestaurantByID(id));
        model.addAttribute("menuPR", menuPerRestaurant);
        return ("manager/addMenu");
    }

    @PostMapping("/addMenu")
    public String addMenu(@ModelAttribute("menuPR") MenuPerRestaurant menuPerRestaurant, RedirectAttributes ra) {
        String msg;
        try {
            menuPerRestaurantService.createOrUpdate(menuPerRestaurant);
            msg = "Menu has been updated!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/reviews")
    public String showReviews(@RequestParam("id") Integer id, Model model) {
        List<Review> reviews = reviewService.findAllByRestaurantID(id);
        model.addAttribute("reviews", reviews);
        return ("manager/reviews");
    }

    @GetMapping("/reservations")
    public String showReservations(@RequestParam("id") Integer id, Model model) {
        List<Reservation> reservations = reservationService.findAllByRestaurantID(id);
        model.addAttribute("reservations", reservations);
        Restaurant restaurant = restaurantService.findRestaurantByID(id);
        model.addAttribute("restaurant", restaurant);
        return ("manager/reservations");
    }

    @GetMapping("/addReservation")
    public String addReservationForm(@RequestParam("id") Integer id, Model model, Authentication authentication) {
        Reservation reservation = new Reservation();
        reservation.setRestaurant(restaurantService.findRestaurantByID(id));
        reservation.setCustomer(myUserService.findUserByUsername(authentication.getName()));
        model.addAttribute("reservation", reservation);
        List<MenuPerRestaurant> restaurantMenuItems = menuPerRestaurantService.findAllByRestaurantID(id);
        model.addAttribute("restaurantMenuItems", restaurantMenuItems);
        return ("manager/addReservation");
    }

    @PostMapping("/addReservation")
    public String addReservation(@ModelAttribute("reservation") Reservation reservation, RedirectAttributes ra) {
        String msg;
        LocalTime[] businessHours = checkAvailability(reservation);
        if (businessHours[0] == null || businessHours[1] == null) {
            msg = "Sorry! Restaurant is not open today...";
            ra.addFlashAttribute("managerMsg", msg);
        } else if (businessHours[0] != null && businessHours[1] != null && businessHours[1].isAfter(reservation.getArrival())) {
            msg = "Sorry! Restaurant is not open yet...";
            ra.addFlashAttribute("managerMsg", msg);
        } else {
            int seatsTaken = reservationService.calculateTakenSeats(reservation);
            if ((reservation.getNumberOfPeople() + seatsTaken) <= (reservation.getRestaurant().getSeatCapacity())) {
                reservationService.createOrUpdate(reservation);
                msg = "Reservation has been verified!";
                ra.addFlashAttribute("managerMsg", msg);
            } else {
                msg = "Sorry! Restaurant has no tables available...";
                ra.addFlashAttribute("managerMsg", msg);
            }
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/editReservation")
    public String editReservationForm(@RequestParam("id") Integer id, Model model) {
        Reservation reservation = reservationService.findReservationByID(id);
        model.addAttribute("reservation", reservation);
        List<MenuPerRestaurant> restaurantMenuItems = menuPerRestaurantService.findAllByRestaurantID(id);
        model.addAttribute("restaurantMenuItems", restaurantMenuItems);
        return ("manager/editReservation");
    }

    @PostMapping("/editReservation")
    public String editReservation(@ModelAttribute("reservation") Reservation reservation, RedirectAttributes ra) {
        String msg;
        LocalTime[] businessHours = checkAvailability(reservation);
        if (businessHours[0] == null || businessHours[1] == null) {
            msg = "Sorry! Restaurant is not open today...";
            ra.addFlashAttribute("managerMsg", msg);
        } else if (businessHours[0] != null && businessHours[1] != null && businessHours[1].isAfter(reservation.getArrival())) {
            msg = "Sorry! Restaurant is not open yet...";
            ra.addFlashAttribute("managerMsg", msg);
        } else {
            int seatsTaken = reservationService.calculateTakenSeats(reservation);
            if ((reservation.getNumberOfPeople() + seatsTaken) <= (reservation.getRestaurant().getSeatCapacity())) {
                reservationService.createOrUpdate(reservation);
                msg = "Reservation has been updated!";
                ra.addFlashAttribute("managerMsg", msg);
            } else {
                msg = "Sorry! Restaurant has no tables available...";
                ra.addFlashAttribute("managerMsg", msg);
            }
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/deleteReservation")
    public String deleteReservation(@RequestParam("id") Integer id, RedirectAttributes ra) {
        String msg;
        try {
            reservationService.remove(id);
            msg = "Reservation has been canceled!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager/restaurant");
    }

    @GetMapping("/workingHours")
    public String showWorkingHours(@RequestParam("id") Integer id, Model model) {
        WorkingHours workingHours = workingHoursService.findByRestaurantID(id);
        model.addAttribute("hours", workingHours);
        return ("manager/workingHours");
    }

    @PostMapping("/workingHours")
    public String editWorkingHours(@ModelAttribute("hours") WorkingHours workingHours, RedirectAttributes ra) {
        String msg;
        try {
            workingHoursService.edit(workingHours);
            msg = "Working hours have been updated!";
            ra.addFlashAttribute("managerMsg", msg);
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("managerMsg", msg);
        }
        return ("redirect:/manager/restaurant");
    }

    LocalTime[] checkAvailability(Reservation reservation) {
        int restaurantID = reservation.getRestaurant().getId();
        String day = reservation.getArrivalDate().getDayOfWeek().toString().toLowerCase();
        WorkingHours working = workingHoursService.findByRestaurantID(restaurantID);
        LocalTime open = null;
        LocalTime close = null;
        switch (day) {
            case "monday":
                open = working.getMondayOpen();
                close = working.getMondayClose();
                break;
            case "tuesday":
                open = working.getTuesdayOpen();
                close = working.getTuesdayClose();
                break;
            case "wednesday":
                open = working.getWednesdayOpen();
                close = working.getWednesdayClose();
                break;
            case "thursday":
                open = working.getThursdayOpen();
                close = working.getTuesdayClose();
                break;
            case "friday":
                open = working.getFridayOpen();
                close = working.getFridayClose();
                break;
            case "saturday":
                open = working.getSaturdayOpen();
                close = working.getSaturdayClose();
                break;
            case "sunday":
                open = working.getSundayOpen();
                close = working.getSundayClose();
                break;
            default:
                System.out.println("unexpected error!");
                break;
        }
        LocalTime[] openStatus = {close, open};
        return (openStatus);
    }

}
