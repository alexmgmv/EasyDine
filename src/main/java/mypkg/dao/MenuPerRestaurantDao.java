package mypkg.dao;

import java.util.List;
import mypkg.model.MenuPerRestaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuPerRestaurantDao extends JpaRepository<MenuPerRestaurant, Integer> {

    @Query("SELECT m FROM MenuPerRestaurant m WHERE m.restaurant.id = ?1")
    List<MenuPerRestaurant> findAllByRestaurantID(Integer id);

    @Query("SELECT m FROM MenuPerRestaurant m WHERE m.id = ?1")
    MenuPerRestaurant findMenuByID(Integer id);

}
