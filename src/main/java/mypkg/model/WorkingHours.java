package mypkg.model;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "working_hours")
public class WorkingHours implements Serializable {

    @Id
    @Column(name = "restaurant_id")
    private Integer restaurantId;
    @Column(name = "monday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime mondayOpen;
    @Column(name = "monday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime mondayClose;
    @Column(name = "tuesday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime tuesdayOpen;
    @Column(name = "tuesday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime tuesdayClose;
    @Column(name = "wednesday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime wednesdayOpen;
    @Column(name = "wednesday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime wednesdayClose;
    @Column(name = "thursday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime thursdayOpen;
    @Column(name = "thursday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime thursdayClose;
    @Column(name = "friday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime fridayOpen;
    @Column(name = "friday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime fridayClose;
    @Column(name = "saturday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime saturdayOpen;
    @Column(name = "saturday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime saturdayClose;
    @Column(name = "sunday_open")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime sundayOpen;
    @Column(name = "sunday_close")
    @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    private LocalTime sundayClose;
    @OneToOne
    @MapsId
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;

    public WorkingHours() {
    }

    public Integer getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(Integer restaurantId) {
        this.restaurantId = restaurantId;
    }

    public LocalTime getMondayOpen() {
        return mondayOpen;
    }

    public void setMondayOpen(LocalTime mondayOpen) {
        this.mondayOpen = mondayOpen;
    }

    public LocalTime getMondayClose() {
        return mondayClose;
    }

    public void setMondayClose(LocalTime mondayClose) {
        this.mondayClose = mondayClose;
    }

    public LocalTime getTuesdayOpen() {
        return tuesdayOpen;
    }

    public void setTuesdayOpen(LocalTime tuesdayOpen) {
        this.tuesdayOpen = tuesdayOpen;
    }

    public LocalTime getTuesdayClose() {
        return tuesdayClose;
    }

    public void setTuesdayClose(LocalTime tuesdayClose) {
        this.tuesdayClose = tuesdayClose;
    }

    public LocalTime getWednesdayOpen() {
        return wednesdayOpen;
    }

    public void setWednesdayOpen(LocalTime wednesdayOpen) {
        this.wednesdayOpen = wednesdayOpen;
    }

    public LocalTime getWednesdayClose() {
        return wednesdayClose;
    }

    public void setWednesdayClose(LocalTime wednesdayClose) {
        this.wednesdayClose = wednesdayClose;
    }

    public LocalTime getThursdayOpen() {
        return thursdayOpen;
    }

    public void setThursdayOpen(LocalTime thursdayOpen) {
        this.thursdayOpen = thursdayOpen;
    }

    public LocalTime getThursdayClose() {
        return thursdayClose;
    }

    public void setThursdayClose(LocalTime thursdayClose) {
        this.thursdayClose = thursdayClose;
    }

    public LocalTime getFridayOpen() {
        return fridayOpen;
    }

    public void setFridayOpen(LocalTime fridayOpen) {
        this.fridayOpen = fridayOpen;
    }

    public LocalTime getFridayClose() {
        return fridayClose;
    }

    public void setFridayClose(LocalTime fridayClose) {
        this.fridayClose = fridayClose;
    }

    public LocalTime getSaturdayOpen() {
        return saturdayOpen;
    }

    public void setSaturdayOpen(LocalTime saturdayOpen) {
        this.saturdayOpen = saturdayOpen;
    }

    public LocalTime getSaturdayClose() {
        return saturdayClose;
    }

    public void setSaturdayClose(LocalTime saturdayClose) {
        this.saturdayClose = saturdayClose;
    }

    public LocalTime getSundayOpen() {
        return sundayOpen;
    }

    public void setSundayOpen(LocalTime sundayOpen) {
        this.sundayOpen = sundayOpen;
    }

    public LocalTime getSundayClose() {
        return sundayClose;
    }

    public void setSundayClose(LocalTime sundayClose) {
        this.sundayClose = sundayClose;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.restaurantId);
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
        final WorkingHours other = (WorkingHours) obj;
        if (!Objects.equals(this.restaurantId, other.restaurantId)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "WorkingHours{" + "restaurantId=" + restaurantId + ", mondayOpen=" + mondayOpen + ", mondayClose=" + mondayClose + ", tuesdayOpen=" + tuesdayOpen + ", tuesdayClose=" + tuesdayClose + ", wednesdayOpen=" + wednesdayOpen + ", wednesdayClose=" + wednesdayClose + ", thursdayOpen=" + thursdayOpen + ", thursdayClose=" + thursdayClose + ", fridayOpen=" + fridayOpen + ", fridayClose=" + fridayClose + ", saturdayOpen=" + saturdayOpen + ", saturdayClose=" + saturdayClose + ", sundayOpen=" + sundayOpen + ", sundayClose=" + sundayClose + '}';
    }

}
