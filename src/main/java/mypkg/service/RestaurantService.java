package mypkg.service;

import java.util.List;
import mypkg.model.Restaurant;

public interface RestaurantService {

    List<Restaurant> findManagedRestaurants(Integer id);

    Restaurant findRestaurantByID(Integer id);

    List<Restaurant> getRestaurants();

    void createOrUpdate(Restaurant restaurant);

    void remove(Integer id);

    List<String> findAllRegions();

    List<String> findAllCities();

    List<Restaurant> findRestaurantsByAllFilters(String title, String region, String city, String food, Float rating);

}
