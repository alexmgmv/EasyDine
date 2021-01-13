package mypkg.dao;

import java.util.List;
import mypkg.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewDao extends JpaRepository<Review, Integer> {

    @Query("SELECT r FROM Review r WHERE r.restaurant.id = ?1")
    List<Review> findAllByRestaurantID(Integer id);

    @Query("SELECT r FROM Review r WHERE r.customer.id = ?1")
    List<Review> findAllByCustomerID(Integer id);

    @Query("SELECT r FROM Review r WHERE r.id = ?1")
    Review findByReviewID(Integer id);

    @Query("SELECT r FROM Review r WHERE r.restaurant.id = ?1 AND r.customer.id = ?2")
    Review findByRestaurantANDCustomer(Integer rid, Integer cid);

}
