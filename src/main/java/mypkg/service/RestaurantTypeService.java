package mypkg.service;

import java.util.List;
import mypkg.model.RestaurantType;

public interface RestaurantTypeService {

    List<RestaurantType> getRestaurantTypes();

    void createOrUpdate(RestaurantType restaurantType);

}
