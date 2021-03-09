package mypkg.service;

import mypkg.model.WorkingHours;

public interface WorkingHoursService {

    WorkingHours findByRestaurantID(Integer id);

    void edit(WorkingHours workingHours);
    
    void create(WorkingHours workingHours);

}
