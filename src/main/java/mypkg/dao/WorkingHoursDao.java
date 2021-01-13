package mypkg.dao;

import mypkg.model.WorkingHours;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkingHoursDao extends JpaRepository<WorkingHours, Integer> {

    @Query("SELECT w FROM WorkingHours w WHERE w.restaurantId = ?1")
    WorkingHours findByRestaurantID(Integer id);

}
