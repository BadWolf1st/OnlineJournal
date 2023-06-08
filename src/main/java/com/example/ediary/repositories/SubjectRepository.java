package com.example.ediary.repositories;

import com.example.ediary.models.Score;
import com.example.ediary.models.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface SubjectRepository extends JpaRepository<Subject, Long> {
    List<Subject> findByTitle(String title);
    @Transactional
    @Modifying
    @Query("DELETE FROM Homework h WHERE h.subject = :subject")
    void deleteHomeworksBySubject(@Param("subject") Subject subject);

    @Transactional
    @Modifying
    @Query("DELETE FROM Score s WHERE s.subject = :subject")
    void deleteScoresBySubject(@Param("subject") Subject subject);

    @Transactional
    default void deleteSubjectWithRelatedEntities(Subject subject) {
        deleteHomeworksBySubject(subject);
        deleteScoresBySubject(subject);
        delete(subject);
    }
}
