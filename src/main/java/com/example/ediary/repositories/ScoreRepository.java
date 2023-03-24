package com.example.ediary.repositories;

import com.example.ediary.models.Homework;
import com.example.ediary.models.Product;
import com.example.ediary.models.Score;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ScoreRepository extends JpaRepository<Score, Long> {
    List<Score> findByTitle(String title);
    List<Score> findBySubjectId(Long id);
    @Query("SELECT s FROM Score s WHERE s.type IN :types")
    List<Score> findByTypeIn(@Param("types") List<String> types);
}
