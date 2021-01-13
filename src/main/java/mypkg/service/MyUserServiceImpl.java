package mypkg.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import mypkg.dao.MyUserDao;
import mypkg.model.MyUser;
import mypkg.model.Role;

@Service
@Transactional
public class MyUserServiceImpl implements MyUserService {

    @Autowired
    private MyUserDao udao;
    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        List<GrantedAuthority> authorities = new ArrayList();
        MyUser myuser = udao.findUserByUsername(userName);
        GrantedAuthority authority = convertRoleToGrantedAuthority(myuser.getUserRole());
        authorities.add(authority);
        User user = new User(myuser.getUsername(), myuser.getPassword(), authorities);
        return (user);
    }

    private GrantedAuthority convertRoleToGrantedAuthority(Role role) {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role.getUserRole());
        return (authority);
    }

    @Override
    public List<MyUser> getManagers() {
        return (udao.getManagers());
    }

    @Override
    public MyUser findUserByUsername(String username) {
        return (udao.findUserByUsername(username));
    }

    @Override
    public void createOrUpdate(MyUser user) {
        String plainPassword = user.getPassword();
        String encodedPassword = passwordEncoder.encode(plainPassword);
        user.setPassword(encodedPassword);
        udao.save(user);
    }

    @Override
    public void remove(Integer id) {
        udao.deleteById(id);
    }

    @Override
    public MyUser findByID(Integer id) {
        return (udao.findByID(id));
    }

    @Override
    public void removeUnattachedManagers() {
        List<MyUser> managers = udao.findUnattachedManagers();
        for (MyUser m : managers) {
            udao.deleteById(m.getId());
        }
    }

    @Override
    public List<MyUser> getAllUsers() {
        return (udao.findAll());
    }

}
