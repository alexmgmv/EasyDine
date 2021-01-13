package mypkg.service;

import java.util.List;
import mypkg.dao.RestaurantTypeDao;
import mypkg.model.RestaurantType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RestaurantTypeServiceImpl implements RestaurantTypeService {

    @Autowired
    private RestaurantTypeDao rtdao;

    @Override
    public List<RestaurantType> getRestaurantTypes() {
        return (rtdao.findAll());
    }

    @Override
    public void createOrUpdate(RestaurantType restaurantType) {
        rtdao.save(restaurantType);
    }

}
