package com.example.ediary.services;

import com.example.ediary.models.Homework;
import com.example.ediary.repositories.HomeworkRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class HomeworkService{

    private final HomeworkRepository homeworkRepository;

    public HomeworkService(HomeworkRepository homeworkRepository) {
        this.homeworkRepository = homeworkRepository;
    }

    public List<Homework> getAllHomework() {
        return homeworkRepository.findAll();
    }

    public List<Homework> getHomeworkBySubjectId(Long subjectId) {
        return homeworkRepository.findBySubjectId(subjectId);
    }

    public Homework getHomeworkById(Long id) {
        return homeworkRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Домашнее задание не найдено"));
    }

    public Homework saveHomework(Homework homework) {
        return homeworkRepository.save(homework);
    }

    public void deleteHomework(Long id) {
        homeworkRepository.deleteById(id);
    }
    public List<Homework> getHomeworkSortedByDueDate() {
        return homeworkRepository.findAll(Sort.by(Sort.Direction.ASC, "dueDate"));
    }
    public List<Homework> getHomeworkByDueDate(LocalDate dueDate) {
        return homeworkRepository.findAllByDueDate(dueDate);
    }
    public List<Homework> findByDueDate(LocalDate dueDate){
        return homeworkRepository.findByDueDate(dueDate);
    }
}
