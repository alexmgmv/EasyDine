package mypkg.service;

import java.util.List;
import mypkg.dao.MenuPerRestaurantDao;
import mypkg.model.MenuPerRestaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MenuPerRestaurantServiceImpl implements MenuPerRestaurantService {

    @Autowired
    private MenuPerRestaurantDao mdao;

    @Override
    public List<MenuPerRestaurant> findAllByRestaurantID(Integer id) {
        return (mdao.findAllByRestaurantID(id));
    }

    @Override
    public MenuPerRestaurant findMenuByID(Integer id) {
        return (mdao.findMenuByID(id));
    }

    @Override
    public void createOrUpdate(MenuPerRestaurant menuPerRestaurant) {
        mdao.save(menuPerRestaurant);
    }

    @Override
    public void remove(Integer id) {
        mdao.deleteById(id);
    }

}
