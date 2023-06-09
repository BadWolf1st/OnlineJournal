package com.example.ediary.services;

import com.example.ediary.models.*;
import com.example.ediary.repositories.ScoreRepository;
import com.example.ediary.repositories.SubjectRepository;
import com.example.ediary.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ScoreService {
    private final ScoreRepository scoreRepository;
    private final SubjectRepository subjectRepository;
    private final UserRepository userRepository;

    public List<Score> listScores(String title) {
        if (title != null) return scoreRepository.findByTitle(title);
        return scoreRepository.findAll();
    }
    public List<Subject> listSubjects(String title) {
        if (title != null) return subjectRepository.findByTitle(title);
        return subjectRepository.findAll();
    }
    public void saveScore(Principal principal, Score score)  {
        score.setUser(getUserByPrincipal(principal));
        log.info("Saving new score. Title: {}; Author email: {}", score.getTitle(), score.getUser().getEmail());
        scoreRepository.save(score);
    }
    public void saveSubject(Principal principal, Subject subject) throws IOException {
        subject.setUser(getUserByPrincipal(principal));
        log.info("Saving new subject. Title: {}; Author email: {}", subject.getTitle(), subject.getUser().getEmail());
        subjectRepository.save(subject);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteScore(User user, Long id) {
        Score score = scoreRepository.findById(id)
                .orElse(null);
        if (score != null) {
            if (score.getUser().getId().equals(user.getId())) {
                scoreRepository.delete(score);
                log.info("Score with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this score with id = {}", user.getEmail(), id);
            }
        }
    }
    public void deleteSubject(User user, Long id) {
        Subject subject = subjectRepository.findById(id)
                .orElse(null);
        if (subject != null) {
            if (subject.getUser().getId().equals(user.getId())) {
                subjectRepository.deleteSubjectWithRelatedEntities(subject);
                log.info("Subject with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this subject with id = {}", user.getEmail(), id);
            }
        } else {
            log.error("Subject with id = {} is not found", id);
        }
    }
    public List<Score> getScoresByTypes(List<String> types) {
        return scoreRepository.findByTypeIn(types);
    }
    public Score getScoreById(Long id) {
        return scoreRepository.findById(id).orElse(null);
    }
    public Subject getSubjectById(Long id) {
        return subjectRepository.findById(id).orElse(null);
    }

    public void updateScore(Score score){
        scoreRepository.save(score);
    }
    public List<Score> list() {
        return scoreRepository.findAll();
    }
}
