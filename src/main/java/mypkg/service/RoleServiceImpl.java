package mypkg.service;

import java.util.List;
import mypkg.dao.RoleDao;
import mypkg.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao rdao;

    @Override
    public List<Role> getRoles() {
        return (rdao.findAll());
    }

}
