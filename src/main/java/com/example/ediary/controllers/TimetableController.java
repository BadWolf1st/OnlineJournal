package com.example.ediary.controllers;


import com.example.ediary.models.Timetable;
import com.example.ediary.repositories.TimetableRepository;
import com.example.ediary.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TimetableController {
    private final UserService userService;

    private final TimetableRepository timetableRepository;
    @GetMapping("/regtimetablestudent")
    public String regtimetable(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "regtimetable";
    }
    @GetMapping("/timetablestudent")
    public String timetable(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "timetablestudent";
    }
    @PostMapping("/regtimetablestudent")
    public String regtimetablePost(@RequestParam String classroom_number , @RequestParam Integer lesson_number, @RequestParam String name_lesson, @RequestParam String name_teacher, @RequestParam String time, @RequestParam String type_of_lesson , Model model) {
        Timetable timetable = new Timetable(classroom_number, lesson_number,name_lesson, name_teacher,time, type_of_lesson);
        timetableRepository.save(timetable);
        return "redirect:/login";
    }
}
