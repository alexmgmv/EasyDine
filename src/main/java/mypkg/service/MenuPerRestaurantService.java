package mypkg.service;

import java.util.List;
import mypkg.model.MenuPerRestaurant;

public interface MenuPerRestaurantService {

    List<MenuPerRestaurant> findAllByRestaurantID(Integer id);

    MenuPerRestaurant findMenuByID(Integer id);

    void createOrUpdate(MenuPerRestaurant menuPerRestaurant);

    void remove(Integer id);

}
