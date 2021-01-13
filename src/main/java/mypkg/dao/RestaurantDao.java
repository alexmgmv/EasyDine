package mypkg.dao;

import java.util.List;
import mypkg.model.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RestaurantDao extends JpaRepository<Restaurant, Integer> {

    @Query(value = "SELECT * FROM restaurant WHERE restaurant.manager = :id", nativeQuery = true)
    List<Restaurant> findManagedRestaurants(@Param("id") Integer id);

    @Query("SELECT r FROM Restaurant r WHERE r.id = ?1")
    Restaurant findRestaurantByID(Integer id);

    @Query("SELECT DISTINCT(r.region) FROM Restaurant r")
    List<String> findAllRegions();

    @Query("SELECT DISTINCT(r.city) FROM Restaurant r")
    List<String> findAllCities();

    @Query("SELECT r FROM Restaurant r WHERE LOWER(r.businessTitle) LIKE %:title% AND LOWER(r.region) LIKE %:region% AND LOWER(r.city) LIKE %:city% AND r.restaurantType.foodCategory LIKE %:food% AND r.ratingAverage >= :rating")
    List<Restaurant> findRestaurantsByAllFilters(@Param("title") String title, @Param("region") String region, @Param("city") String city, @Param("food") String food, @Param("rating") Float rating);

}
