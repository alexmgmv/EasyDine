package mypkg.dao;

import mypkg.model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuItemDao extends JpaRepository<MenuItem, Integer> {

}
