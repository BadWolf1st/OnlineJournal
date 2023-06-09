package com.example.ediary.controllers;

import com.example.ediary.models.Homework;
import com.example.ediary.models.Score;
import com.example.ediary.models.User;
import com.example.ediary.services.GroupService;
import com.example.ediary.services.HomeworkService;
import com.example.ediary.services.ScoreService;
import com.example.ediary.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class ScoreController {
    private final ScoreService scoreService;
    private final HomeworkService homeworkService;
    private final GroupService groupService;
    private final UserService userService;
    @GetMapping("/")
    public String scores(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("subjects", scoreService.listSubjects(null));
        model.addAttribute("scores", scoreService.listScores(null));
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        if(scoreService.getUserByPrincipal(principal).getEmail() == null){
            return "redirect:/login";
        }
        if(scoreService.getUserByPrincipal(principal).isGuest() || scoreService.getUserByPrincipal(principal).isCancel()){
            return "redirect:/waitroom";
        }
        if(scoreService.getUserByPrincipal(principal).isTeacher()){
            return "redirect:/tutor/home";
        }
        if(scoreService.getUserByPrincipal(principal).isAdmin()){
            return "redirect:/admin/home";
        }
        if(scoreService.getUserByPrincipal(principal).getEmail() != null){
            return "redirect:/term/1";
        }
        return "main";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/term/{id}")
    public String scoresWithTerm(@PathVariable Long id, @RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("subjects", scoreService.listSubjects(null));
        model.addAttribute("scores", scoreService.listScores(null));
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        model.addAttribute("selectedTerm", id);
        if(scoreService.getUserByPrincipal(principal).getEmail() == null){
            return "redirect:/login";
        }
        if(scoreService.getUserByPrincipal(principal).isGuest()){
            return "redirect:/waitroom";
        }
        return "main";
    }
    @GetMapping("/waitroom")
    public String waitRoom(Principal principal, Model model){
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        return "guest";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @PostMapping("/score/create")
    public String createScore(Principal principal, Score score) throws IOException {
        scoreService.saveScore(principal, score);
        return "redirect:/";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/score")
    public String formScore(Principal principal, Model model){
        User user = scoreService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "score";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/finalscore")
    public String redirectFinalScore(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        return "redirect:/finalscore/1";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/finalscore/{id}")
    public String finalScore(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("subjects", scoreService.listSubjects(null));
        model.addAttribute("scores", scoreService.listScores(null));
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("selectedTerm", id);
        return "final-scores";
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @GetMapping("/homeworks")
    public String redirectToHomeworks(){
        LocalDate currentDate = LocalDate.now();
        String formattedDate = currentDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        return "redirect:/homeworks/" + formattedDate;
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")

    @RequestMapping(value = "/homeworks/{dueDate}", method = RequestMethod.GET)
    public ModelAndView homeworks(@PathVariable("dueDate") @DateTimeFormat(pattern="dd-MM-yyyy") LocalDate dueDate, Principal principal, Model model) {
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        ModelAndView modelAndView = new ModelAndView("homework-student");
        List<Homework> homeworkList = homeworkService.getAllHomework();
        List<Homework> filteredList = homeworkList.stream()
                .filter(homework -> {
                    LocalDate homeworkDueDate = homework.getDueDate();
                    return homeworkDueDate != null && homeworkDueDate.equals(dueDate);
                })
                .collect(Collectors.toList());
        modelAndView.addObject("homeworkList", filteredList);
        return modelAndView;
    }
    @PreAuthorize("hasAnyAuthority('ROLE_USER', 'ROLE_TEACHER', 'ROLE_ADMIN')")
    @RequestMapping(value = "/homeworks", method = RequestMethod.POST)
    public String redirectToHomeworksWithDate(@RequestParam("dueDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate dueDate){
        return "redirect:/homeworks/" + dueDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
    }
}