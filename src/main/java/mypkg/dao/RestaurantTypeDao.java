package mypkg.dao;

import mypkg.model.RestaurantType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RestaurantTypeDao extends JpaRepository<RestaurantType, Integer> {

}
