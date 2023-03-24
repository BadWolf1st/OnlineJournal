package com.example.ediary.repositories;

import com.example.ediary.models.Score;
import com.example.ediary.models.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SubjectRepository extends JpaRepository<Subject, Long> {
    List<Subject> findByTitle(String title);
}
