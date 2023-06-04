package com.example.ediary.controllers;


import com.example.ediary.models.Homework;
import com.example.ediary.models.Score;
import com.example.ediary.models.Timetable;
import com.example.ediary.models.User;
import com.example.ediary.models.enums.Role;
import com.example.ediary.repositories.HomeworkRepository;
import com.example.ediary.repositories.ScoreRepository;
import com.example.ediary.repositories.TimetableRepository;
import com.example.ediary.services.*;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;


@Controller
@RequiredArgsConstructor
public class TimetableController {
    private final UserService userService;
    private final TimetableService timetableService;
    private final TimetableRepository timetableRepository;
    private final ScoreRepository scoreRepository;
    private final GroupService groupService;
    private final ScoreService scoreService;
    private final HomeworkService homeworkService;
    private final HomeworkRepository homeworkRepository;
    @GetMapping("/regtimetablestudent")
    public String regtimetable(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "regtimetable";
    }
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
    @GetMapping("/timet/{id}/{id2}")
    public String timetableWithWeeks(@PathVariable String id,@PathVariable Long id2, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        return "timetablestudent";
    }

    @GetMapping("/timetut/{id}/{id2}")
    public String timetableWithWeeksTutor(@PathVariable String id,@PathVariable Long id2, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        return "homeTutor";
    }
    @PostMapping("/regtimetablestudent")
    public String regtimetablePost(Principal principal, Timetable timetable) {
        timetableService.saveTimeTable(principal, timetable);
        timetableRepository.save(timetable);
        return "redirect:/";
    }
    @GetMapping("/admin/timetable")
    public String admintimetable(Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "redirect:/admintime/Monday/1/non";
    }
    @GetMapping("/admintime/{id}/{id2}/{id3}")
    public String timetableAdmin(@PathVariable String id,@PathVariable Long id2,@PathVariable String id3, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        model.addAttribute("selectedGroup", id3);
        return "AdminTimetable2(2)";
    }
    @GetMapping("/scorecreate")
    public String regtimetable123(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "scorecreate";
    }
    @GetMapping("/admintimedel/{id}/{id2}/{id3}")
    public String timetableAdminDelete(@PathVariable String id,@PathVariable Long id2,@PathVariable String id3, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        model.addAttribute("selectedGroup", id3);
        return "admintimetabledelete";
    }
    @PostMapping("/deleteTimetable")
    public String deleteTimetable(@RequestParam(name = "timetableId", required = false) List<Long> id){
        if(id != null){
        timetableService.deleteTimetable(id);}
        return "redirect:/admin/timetable";
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
    @GetMapping("/tutor/groups/edit/{id}")
    public String editTableStud(@PathVariable("id") Long id, Model model, Principal principal) {
        Score score = scoreService.getScoreById(id);
        model.addAttribute("score", score);
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
        return "scorecreate";
    }
    @PostMapping("/tutor/groups/regscorecreate")
    public String regScoreCreate(Principal principal, Score score) {
        scoreService.saveScore(principal, score);
        scoreRepository.save(score);
        return "redirect:/";
    }
    @GetMapping("/tutor/groups/homework")
    public String homeworkForGroup(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "homeworkgroup";
    }

    @PostMapping("/tutor/groups/homeworkcreate")
    public String homeworkForGroupCreate(Principal principal, @RequestParam("dueDate") @DateTimeFormat(pattern = "yyyy-MM-dd") String dueDate, Homework homework) {
        homework.setDueDate(LocalDate.parse(dueDate));
        homeworkService.saveHomework(homework);
        homeworkRepository.save(homework);
        return "redirect:/";
    }
}
