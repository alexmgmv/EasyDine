package mypkg.dao;

import java.util.List;
import mypkg.model.MyUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface MyUserDao extends JpaRepository<MyUser, Integer> {

    @Query("SELECT u FROM MyUser u WHERE u.username = ?1")
    MyUser findUserByUsername(String username);

    @Query(value = "SELECT * FROM users INNER JOIN roles on users.user_role=roles.user_role WHERE roles.user_role='manager'", nativeQuery = true)
    List<MyUser> getManagers();

    @Query(value = "SELECT * FROM users INNER JOIN roles ON users.user_role = roles.user_role WHERE roles.user_role = 'manager' AND users.id NOT IN (SELECT manager FROM restaurant)", nativeQuery = true)
    List<MyUser> findUnattachedManagers();

    @Query("SELECT u FROM MyUser u WHERE u.id = ?1")
    public MyUser findByID(Integer id);

}
