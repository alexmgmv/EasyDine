package mypkg.service;

import java.util.List;
import mypkg.model.Review;

public interface ReviewService {

    List<Review> findAllByRestaurantID(Integer id);

    List<Review> findAllByCustomerID(Integer id);

    Review findByReviewID(Integer id);

    Review findByRestaurantANDCustomer(Integer rid, Integer cid);

    void createOrUpdate(Review review);

    void remove(Integer id);

    Float calculateRestaurantRating(Integer id);

}
