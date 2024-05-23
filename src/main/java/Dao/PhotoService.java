package Dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import models.User;

@Service
public class PhotoService {
    @Autowired
    private PhotoRepository photoRepository;

    public List<User> getAllUsers() {
        return photoRepository.findAll();
    }
}
