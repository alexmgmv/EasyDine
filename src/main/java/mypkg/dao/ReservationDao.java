package mypkg.dao;

import java.time.LocalDate;
import java.util.List;
import mypkg.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservationDao extends JpaRepository<Reservation, Integer> {

    @Query("SELECT r FROM Reservation r WHERE r.restaurant.id = ?1")
    public List<Reservation> findAllByRestaurantID(Integer id);

    @Query("SELECT r FROM Reservation r WHERE r.customer.id = ?1")
    List<Reservation> findAllByCustomerID(Integer id);

    @Query("SELECT r FROM Reservation r WHERE r.id = ?1")
    Reservation findReservationByID(Integer id);

    @Query("SELECT r FROM Reservation r WHERE r.restaurant.id = ?1 AND r.arrivalDate = ?2")
    List<Reservation> findAllByDateANDRestaurantID(Integer id, LocalDate date);

}
