package mypkg.controller;

import java.time.LocalTime;
import java.util.List;
import mypkg.model.MenuPerRestaurant;
import mypkg.model.MyUser;
import mypkg.model.Reservation;
import mypkg.model.Restaurant;
import mypkg.model.RestaurantType;
import mypkg.model.Review;
import mypkg.model.WorkingHours;
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
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private MyUserService myUserService;
    @Autowired
    private RestaurantService restaurantService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private MenuPerRestaurantService menuPerRestaurantService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private WorkingHoursService workingHoursService;
    @Autowired
    private RestaurantTypeService restaurantTypeService;

    @ModelAttribute("restaurantTypes")
    public List<RestaurantType> getAllRestaurantTypes() {
        return (restaurantTypeService.getRestaurantTypes());
    }

    @ModelAttribute("regions")
    public List<String> getAllRegions() {
        return (restaurantService.findAllRegions());
    }

    @ModelAttribute("cities")
    public List<String> getAllCities() {
        return (restaurantService.findAllCities());
    }

    @GetMapping
    public String showCustomerHome() {
        return ("customer/customerHome");
    }

    @GetMapping("/info")
    public String editCustomerInfoForm(Authentication authentication, Model model) {
        String username = authentication.getName();
        MyUser customer = myUserService.findUserByUsername(username);
        model.addAttribute("user", customer);
        return ("customer/info");
    }

    @PostMapping("/info")
    public String editCustomerInfo(@ModelAttribute("user") MyUser customer, RedirectAttributes ra) {
        String msg;
        try {
            myUserService.createOrUpdate(customer);
            msg = "Your personal information have changed!";
            ra.addFlashAttribute("customerMsg", msg);
        } catch (Exception e) {
            msg = "This username is being used." + "</br>" + "Try a different one!";
            ra.addFlashAttribute("customerMsg", msg);
        }
        return ("redirect:/customer");
    }

    @GetMapping("/remove")
    public String removeAccount(@RequestParam("id") Integer id, RedirectAttributes ra) {
        String msg;
        try {
            myUserService.remove(id);
            msg = "Your account has been deleted!";
            ra.addFlashAttribute("customerMsg", msg);
            return ("redirect:/loginPage");
        } catch (Exception e) {
            msg = "Something went wrong... Please try again!";
            ra.addFlashAttribute("customerMsg", msg);
            return ("redirect:/customer");
        }
    }

    @GetMapping("/restaurants")
    public String browseRestaurants(Model model) {
        List<Restaurant> restaurants;
        restaurants = restaurantService.getRestaurants();
        model.addAttribute("restaurants", restaurants);
        return ("customer/restaurants");
    }

    @GetMapping("/restaurantDetails")
    public String restaurantInfo(@RequestParam("id") Integer id, Model model) {
        Restaurant restaurant = restaurantService.findRestaurantByID(id);
        model.addAttribute("restaurant", restaurant);
        return ("/customer/restaurantDetails");
    }

    @GetMapping("addReservation")
    public String reserveTableForm(@RequestParam("id") Integer id, Model model, Authentication authentication) {
        Reservation reservation = new Reservation();
        reservation.setRestaurant(restaurantService.findRestaurantByID(id));
        reservation.setCustomer(myUserService.findUserByUsername(authentication.getName()));
        List<MenuPerRestaurant> restaurantMenu = menuPerRestaurantService.findAllByRestaurantID(id);
        model.addAttribute("restaurantMenu", restaurantMenu);
        model.addAttribute("reservation", reservation);
        return ("/customer/addReservation");
    }

    @PostMapping("addReservation")
    public String reserveTable(@ModelAttribute("reservation") Reservation reservation, Authentication authentication, RedirectAttributes ra) {
        String msg;
        MyUser customer = myUserService.findUserByUsername(authentication.getName());
        LocalTime[] businessHours = checkAvailability(reservation);
        if (businessHours[0] == null || businessHours[1] == null) {
            msg = "Sorry! Restaurant is not open today...";
            ra.addFlashAttribute("customerMsg", msg);
        } else if (businessHours[0] != null && businessHours[1] != null && businessHours[1].isAfter(reservation.getArrival())) {
            msg = "Sorry! Restaurant is not open yet...";
            ra.addFlashAttribute("customerMsg", msg);
        } else {
            int seatsTaken = reservationService.calculateTakenSeats(reservation);
            if ((reservation.getNumberOfPeople() + seatsTaken) <= (reservation.getRestaurant().getSeatCapacity())) {
                paymentMethodChoice(reservation, customer);
                msg = "Your table has been reserved. Thank you!";
                ra.addFlashAttribute("customerMsg", msg);
            } else {
                msg = "Sorry! Restaurant has no tables available...";
                ra.addFlashAttribute("customerMsg", msg);
            }
        }
        return ("redirect:/customer");
    }

    @GetMapping("reservations")
    public String showReservationHistory(Model model, Authentication authentication) {
        MyUser customer = myUserService.findUserByUsername(authentication.getName());
        List<Reservation> reservations = reservationService.findAllByCustomerID(customer.getId());
        model.addAttribute("reservations", reservations);
        return ("/customer/reservations");
    }

    @GetMapping("cancel")
    public String cancelReservation(@RequestParam("id") Integer id, Authentication authentication, RedirectAttributes ra) {
        String msg;
        MyUser customer = myUserService.findUserByUsername(authentication.getName());
        Reservation reservation = reservationService.findReservationByID(id);
        try {
            reservationService.remove(id);
            if (reservation.getPaymentMethod().equalsIgnoreCase("app credits")) {
                float bill = reservation.getNumberOfPeople() * reservation.getMenuChoice().getPrice();
                customer.setCredits(customer.getCredits() + bill / 2);
                myUserService.createOrUpdate(customer);
                msg = "Your reservation has been canceled!" + "</br></br>" + "50% App Credits refund.";
            } else {
                msg = "Your reservation has been canceled!";
            }
        } catch (Exception e) {
            msg = "Sorry, something went wrong... Please try again!";
        }
        ra.addFlashAttribute("customerMsg", msg);
        return ("redirect:/customer/reservations");
    }

    @GetMapping("addReview")
    public String writeReviewForm(@RequestParam("id") Integer id, Model model, Authentication authentication) {
        Restaurant restaurant = restaurantService.findRestaurantByID(id);
        MyUser customer = myUserService.findUserByUsername(authentication.getName());
        int cid = customer.getId();
        Review existingReview = reviewService.findByRestaurantANDCustomer(id, cid);
        if (existingReview == null) {
            Review review = new Review();
            review.setRestaurant(restaurant);
            review.setCustomer(customer);
            model.addAttribute("review", review);
            return ("/customer/addReview");
        } else {
            return ("redirect:/customer/editReview?id=" + existingReview.getId());
        }
    }

    @PostMapping("addReview")
    public String writeReview(@ModelAttribute("review") Review review, RedirectAttributes ra) {
        String msg;
        reviewService.createOrUpdate(review);
        refreshRestaurantRating(review);
        msg = "Your review has been posted!";
        ra.addFlashAttribute("customerMsg", msg);
        return ("redirect:/customer/reviews");
    }

    @GetMapping("reviews")
    public String showReviewHistory(Model model, Authentication authentication) {
        MyUser customer = myUserService.findUserByUsername(authentication.getName());
        List<Review> reviews = reviewService.findAllByCustomerID(customer.getId());
        model.addAttribute("reviews", reviews);
        return ("/customer/reviews");
    }

    @GetMapping("editReview")
    public String editReviewForm(@RequestParam("id") Integer id, Model model) {
        Review review = reviewService.findByReviewID(id);
        model.addAttribute("review", review);
        return ("/customer/editReview");
    }

    @PostMapping("editReview")
    public String editReview(@ModelAttribute("review") Review review, RedirectAttributes ra) {
        String msg;
        reviewService.createOrUpdate(review);
        refreshRestaurantRating(review);
        msg = "Your review has been revised!";
        ra.addFlashAttribute("customerMsg", msg);
        return ("redirect:/customer/reviews");
    }

    @GetMapping("deleteReview")
    public String deleteReview(@RequestParam("id") Integer id, RedirectAttributes ra) {
        String msg;
        Review review = reviewService.findByReviewID(id);
        reviewService.remove(id);
        refreshRestaurantRating(review);
        msg = "Your review has been deleted!";
        ra.addFlashAttribute("customerMsg", msg);
        return ("redirect:/customer/reviews");
    }

    @GetMapping("search")
    public String searchRestaurantsForm(Model model) {
        model.addAttribute("restaurant", new Restaurant());
        return ("customer/searchForm");
    }

    @GetMapping("searchResults")
    public String searchRestaurants(@ModelAttribute("restaurant") Restaurant restaurant, Model model) {
        if (restaurant.getRatingAverage() == null) {
            restaurant.setRatingAverage(0.0f);
        }
        List<Restaurant> searchedRestaurant = restaurantService.findRestaurantsByAllFilters(restaurant.getBusinessTitle(), restaurant.getRegion(), restaurant.getCity(), restaurant.getRestaurantType().getFoodCategory(), restaurant.getRatingAverage());
        model.addAttribute("restaurants", searchedRestaurant);
        return ("customer/searchResults");
    }

    void refreshRestaurantRating(Review review) {
        int rid = review.getRestaurant().getId();
        Restaurant restaurant = restaurantService.findRestaurantByID(rid);
        restaurant.setRatingAverage(reviewService.calculateRestaurantRating(rid));
        restaurantService.createOrUpdate(restaurant);
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

    void paymentMethodChoice(Reservation reservation, MyUser customer) {
        float bill = reservation.getNumberOfPeople() * reservation.getMenuChoice().getPrice();
        reservation.setDeparture(reservation.getArrival().plusHours(2));
        if (reservation.getPaymentMethod().equalsIgnoreCase("app credits")) {
            if (customer.getCredits() >= bill) {
                customer.setCredits(customer.getCredits() - bill);
                reservationService.createOrUpdate(reservation);
                myUserService.createOrUpdate(customer);
            } else {
                System.out.println("Not enough credits!!!");
            }
        } else {
            reservationService.createOrUpdate(reservation);
        }
    }

}
