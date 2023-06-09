package com.example.ediary.controllers;


import com.example.ediary.models.*;
import com.example.ediary.repositories.HomeworkRepository;
import com.example.ediary.repositories.ScoreRepository;
import com.example.ediary.repositories.SubjectRepository;
import com.example.ediary.repositories.TimetableRepository;
import com.example.ediary.services.*;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;


@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_TEACHER')")
public class TimetableController {
    private final UserService userService;
    private final TimetableService timetableService;
    private final TimetableRepository timetableRepository;
    private final ScoreRepository scoreRepository;
    private final GroupService groupService;
    private final ScoreService scoreService;
    private final HomeworkService homeworkService;
    private final HomeworkRepository homeworkRepository;
    private final SubjectRepository subjectRepository;
    @GetMapping("/regtimetablestudent")
    public String regtimetable(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "regtimetable";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/timetablestudent")
    public String timetable(Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));

        return "redirect:/timet/Monday/1";
    }

    @GetMapping("/tutor/home")
    public String timetableTutor(Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));

        return "redirect:/timetut/Monday/1";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/timet/{id}/{id2}")
    public String timetableWithWeeks(@PathVariable String id,@PathVariable Long id2, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        return "timetablestudent";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/timetut/{id}/{id2}")
    public String timetableWithWeeksTutor(@PathVariable String id,@PathVariable Long id2, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        return "homeTutor";
    }

    @GetMapping("/tutor/groups")
    public String tutorGroups(Principal principal, Model model, String name) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("groups", groupService.listGroups(name));
        return "groupsteacher";
    }

    @GetMapping("/tutor/groups/{id}")
    public String tutorGroups(@PathVariable Long id,Principal principal, Model model, String name) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("group", groupService.getGroupById(id));
        model.addAttribute("users", userService.list());
        model.addAttribute("scores", scoreService.listScores(null));
        return "TableTeacher";
    }
    @GetMapping("/tutor/groups/edit")
    public String editTableStud( Model model, Principal principal) {
        return "changetablestudent";
    }
    @PostMapping("/tutor/groups/edit/{id}/missing")
    public String editMissing(@PathVariable("id") Long id, @RequestParam("missing") int missing, Model model){
        Score score = scoreService.getScoreById(id);
        score.setMissing(missing);
        scoreService.updateScore(score);
        return "redirect:/tutor/groups/edit/{id}";
    }
    @GetMapping("/tutor/groups/regscore")
    public String regScore(Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("users", userService.list());
        model.addAttribute("subjects", subjectRepository.findAll());
        return "scorecreate";
    }
    @PostMapping("/tutor/groups/regscorecreate")
    public String regScoreCreate(@RequestParam(name = "subjectId", required = false) Long id, Principal principal, Score score) {
        score.setSubject(scoreService.getSubjectById(id));
        score.setTitle(scoreService.getSubjectById(id).getTitle());
        scoreService.saveScore(principal, score);
        //scoreRepository.save(score);
        return "redirect:/";
    }
    @GetMapping("/tutor/groups/deletscore")
    public String deleteScore(Model model, Principal principal) {
        model.addAttribute("scores", scoreService.list());
        return "scoredelete";
    }
    @PostMapping("/tutor/groups/deletscore")
    public String deleteScore(@RequestParam("scoreId") Long scoreId, Model model, Principal principal) {
        scoreService.deleteScore(userService.getUserByPrincipal(principal), scoreId);
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "redirect:/";
    }
    @GetMapping("/tutor/groups/homework")
    public String homeworkForGroup(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("subjects", subjectRepository.findAll());
        return "reghomework";
    }

    @PostMapping("/tutor/groups/homeworkcreate")
    public String homeworkForGroupCreate(@RequestParam(name = "subjectId", required = false) Long id, Principal principal, @RequestParam("dueDate") @DateTimeFormat(pattern = "yyyy-MM-dd") String dueDate, Homework homework, Subject subject) {
        if (id != null) {
            homework.setDueDate(LocalDate.parse(dueDate));
            subject = scoreService.getSubjectById(id);
            homework.setSubject(subject);
            homework.setTitle(subject.getTitle());
            homeworkService.saveHomework(homework);
            homeworkRepository.save(homework);
        }
        return "redirect:/";
    }
}
