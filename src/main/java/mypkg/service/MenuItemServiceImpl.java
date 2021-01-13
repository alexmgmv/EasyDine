package mypkg.service;

import java.util.List;
import mypkg.dao.MenuItemDao;
import mypkg.model.MenuItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MenuItemServiceImpl implements MenuItemService {

    @Autowired
    private MenuItemDao midao;

    @Override
    public List<MenuItem> getMenuItems() {
        return (midao.findAll());
    }

}
