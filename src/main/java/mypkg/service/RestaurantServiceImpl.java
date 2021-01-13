package mypkg.service;

import java.util.List;
import mypkg.dao.RestaurantDao;
import mypkg.model.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    private RestaurantDao rdao;

    @Override
    public List<Restaurant> findManagedRestaurants(Integer id) {
        return (rdao.findManagedRestaurants(id));
    }

    @Override
    public Restaurant findRestaurantByID(Integer id) {
        return (rdao.findRestaurantByID(id));
    }

    @Override
    public void createOrUpdate(Restaurant restaurant) {
        rdao.save(restaurant);
    }

    @Override
    public List<Restaurant> getRestaurants() {
        return (rdao.findAll());
    }

    @Override
    public void remove(Integer id) {
        rdao.deleteById(id);
    }

    @Override
    public List<Restaurant> findRestaurantsByAllFilters(String title, String region, String city, String food, Float rating) {
        return (rdao.findRestaurantsByAllFilters(title, region, city, food, rating));
    }

    @Override
    public List<String> findAllCities() {
        return (rdao.findAllCities());
    }

    @Override
    public List<String> findAllRegions() {
        return (rdao.findAllRegions());
    }

}
