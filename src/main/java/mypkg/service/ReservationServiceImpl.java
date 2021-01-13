package mypkg.service;

import java.time.LocalDate;
import java.util.List;
import mypkg.dao.ReservationDao;
import mypkg.model.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationDao rdao;

    @Override
    public List<Reservation> findAllByRestaurantID(Integer id) {
        return (rdao.findAllByRestaurantID(id));
    }

    @Override
    public void createOrUpdate(Reservation reservation) {
        rdao.save(reservation);
    }

    @Override
    public Reservation findReservationByID(Integer id) {
        return (rdao.findReservationByID(id));
    }

    @Override
    public void remove(Integer id) {
        rdao.deleteById(id);
    }

    @Override
    public List<Reservation> findAllByCustomerID(Integer id) {
        return (rdao.findAllByCustomerID(id));
    }

    @Override
    public List<Reservation> findAllByDateANDRestaurantID(Integer id, LocalDate date) {
        return (rdao.findAllByDateANDRestaurantID(id, date));
    }

    @Override
    public int calculateTakenSeats(Reservation reservation) {
        List<Reservation> todaysReservations = findAllByDateANDRestaurantID(reservation.getRestaurant().getId(), reservation.getArrivalDate());
        int seatsTaken = 0;
        for (Reservation r : todaysReservations) {
            if ((r.getArrival().isBefore(reservation.getArrival().plusMinutes(150))) && (r.getDeparture().isAfter(reservation.getArrival().plusMinutes(30)))) {
                seatsTaken += r.getNumberOfPeople();
            }
        }
        return (seatsTaken);
    }

}
