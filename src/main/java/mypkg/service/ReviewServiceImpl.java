package mypkg.service;

import java.util.List;
import mypkg.dao.ReviewDao;
import mypkg.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDao rdao;

    @Override
    public List<Review> findAllByRestaurantID(Integer id) {
        return (rdao.findAllByRestaurantID(id));
    }

    @Override
    public List<Review> findAllByCustomerID(Integer id) {
        return (rdao.findAllByCustomerID(id));
    }

    @Override
    public void createOrUpdate(Review review) {
        rdao.save(review);
    }

    @Override
    public void remove(Integer id) {
        rdao.deleteById(id);
    }

    @Override
    public Review findByReviewID(Integer id) {
        return (rdao.findByReviewID(id));
    }

    @Override
    public Float calculateRestaurantRating(Integer id) {
        List<Review> reviews = findAllByRestaurantID(id);
        float rating = 0;
        for (Review r : reviews) {
            rating += (r.getFoodRating() + r.getServiceRating() + r.getValueRating()) / 3;
        }
        rating = Math.round(rating / reviews.size());
        return (rating);
    }

    @Override
    public Review findByRestaurantANDCustomer(Integer rid, Integer cid) {
        return (rdao.findByRestaurantANDCustomer(rid, cid));
    }

}
