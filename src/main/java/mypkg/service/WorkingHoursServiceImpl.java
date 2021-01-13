package mypkg.service;

import mypkg.dao.WorkingHoursDao;
import mypkg.model.WorkingHours;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WorkingHoursServiceImpl implements WorkingHoursService {

    @Autowired
    private WorkingHoursDao whdao;

    @Override
    public WorkingHours findByRestaurantID(Integer id) {
        return (whdao.findByRestaurantID(id));
    }

    @Override
    public void edit(WorkingHours workingHours) {
        whdao.save(workingHours);
    }

}
