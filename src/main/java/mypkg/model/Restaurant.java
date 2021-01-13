package mypkg.model;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "restaurant")
public class Restaurant implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "business_title")
    private String businessTitle;
    @Column(name = "address")
    private String address;
    @Column(name = "region")
    private String region;
    @Column(name = "city")
    private String city;
    @Column(name = "phone")
    private String phone;
    @Column(name = "mail")
    private String mail;
    @Column(name = "seat_capacity")
    private Integer seatCapacity;
    @Column(name = "rating_average")
    private Float ratingAverage;
    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL)
    private List<MenuPerRestaurant> restaurantMenus;
    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL)
    private List<Review> reviews;
    @OneToOne(mappedBy = "restaurant", cascade = CascadeType.ALL)
    private WorkingHours workingHours;
    @ManyToOne
    @JoinColumn(name = "restaurant_type_id", referencedColumnName = "id")
    private RestaurantType restaurantType;
    @ManyToOne
    @JoinColumn(name = "manager", referencedColumnName = "id")
    private MyUser manager;
    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL)
    private List<Reservation> reservations;

    public Restaurant() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBusinessTitle() {
        return businessTitle;
    }

    public void setBusinessTitle(String businessTitle) {
        this.businessTitle = businessTitle;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Integer getSeatCapacity() {
        return seatCapacity;
    }

    public void setSeatCapacity(Integer seatCapacity) {
        this.seatCapacity = seatCapacity;
    }

    public Float getRatingAverage() {
        return ratingAverage;
    }

    public void setRatingAverage(Float ratingAverage) {
        this.ratingAverage = ratingAverage;
    }

    public List<MenuPerRestaurant> getRestaurantMenus() {
        return restaurantMenus;
    }

    public void setRestaurantMenus(List<MenuPerRestaurant> restaurantMenus) {
        this.restaurantMenus = restaurantMenus;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public WorkingHours getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(WorkingHours workingHours) {
        this.workingHours = workingHours;
    }

    public RestaurantType getRestaurantType() {
        return restaurantType;
    }

    public void setRestaurantType(RestaurantType restaurantType) {
        this.restaurantType = restaurantType;
    }

    public MyUser getManager() {
        return manager;
    }

    public void setManager(MyUser manager) {
        this.manager = manager;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 19 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Restaurant other = (Restaurant) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Restaurant{" + "id=" + id + ", businessTitle=" + businessTitle + ", address=" + address + ", region=" + region + ", city=" + city + ", phone=" + phone + ", mail=" + mail + ", seatCapacity=" + seatCapacity + ", ratingAverage=" + ratingAverage + '}';
    }

}
