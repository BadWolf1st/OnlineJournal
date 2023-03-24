package com.example.ediary.repositories;

import com.example.ediary.models.Homework;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface HomeworkRepository extends JpaRepository<Homework, Long> {
    List<Homework> findByTitle(String title);
    List<Homework> findBySubjectId(Long id);
    List<Homework> findAllByDueDate(LocalDate date);
    List<Homework> findByDueDate(LocalDate date);
}
