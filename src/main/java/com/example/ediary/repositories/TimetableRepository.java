package com.example.ediary.repositories;

import com.example.ediary.models.Timetable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TimetableRepository extends JpaRepository<Timetable, Long> {

//List<Timetable> findByTitle(String name_lesson); поч крашит?
}
