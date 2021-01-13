package mypkg.service;

import java.time.LocalDate;
import java.util.List;
import mypkg.model.Reservation;

public interface ReservationService {

    List<Reservation> findAllByRestaurantID(Integer id);

    List<Reservation> findAllByCustomerID(Integer id);

    List<Reservation> findAllByDateANDRestaurantID(Integer id, LocalDate date);

    void createOrUpdate(Reservation reservation);

    Reservation findReservationByID(Integer id);

    void remove(Integer id);

    int calculateTakenSeats(Reservation reservation);

}
