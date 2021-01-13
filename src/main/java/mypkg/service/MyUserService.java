package mypkg.service;

import java.util.List;
import mypkg.model.MyUser;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface MyUserService extends UserDetailsService {

    List<MyUser> getManagers();

    List<MyUser> getAllUsers();

    MyUser findUserByUsername(String username);

    void createOrUpdate(MyUser user);

    void remove(Integer id);

    void removeUnattachedManagers();

    MyUser findByID(Integer id);

}
