package com.example.ediary.services;

import com.example.ediary.models.Timetable;
import com.example.ediary.models.User;
import com.example.ediary.repositories.TimetableRepository;
import com.example.ediary.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TimetableService {
    private final UserRepository userRepository;
    private final TimetableRepository timetableRepository;
    public void saveTimeTable (Principal principal, Timetable timetable){
        timetable.setUser(getUserByPrincipal(principal));
        timetableRepository.save(timetable);
    }
    public List<Timetable> listTimetable(String name_lesson) {
        //if (name_lesson != null) return timetableRepository.findByTitle(name_lesson); поч крашит?
        return timetableRepository.findAll();
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}
