package com.example.ediary.controllers;


import com.example.ediary.models.Timetable;
import com.example.ediary.repositories.TimetableRepository;
import com.example.ediary.services.TimetableService;
import com.example.ediary.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class TimetableController {
    private final UserService userService;
    private final TimetableService timetableService;
    private final TimetableRepository timetableRepository;
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
    @GetMapping("/timet/{id}/{id2}")
    public String timetableWithWeeks(@PathVariable String id,@PathVariable Long id2, Principal principal, Model model) {
        model.addAttribute("timetables", timetableService.listTimetable(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("selectedWeekday", id);
        model.addAttribute("selectedWeek", id2);
        return "timetablestudent";
    }
    @PostMapping("/regtimetablestudent")
    public String regtimetablePost(Principal principal, Timetable timetable) {
        timetableService.saveTimeTable(principal, timetable);
        timetableRepository.save(timetable);
        return "redirect:/login";
    }
}
