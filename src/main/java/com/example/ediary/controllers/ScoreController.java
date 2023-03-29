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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        if(scoreService.getUserByPrincipal(principal).isGuest()){
            return "redirect:/waitroom";
        }
        if(scoreService.getUserByPrincipal(principal).getEmail() != null){
            return "redirect:/term/1";
        }
        return "main";
    }
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
    @PostMapping("/score/create")
    public String createScore(Principal principal, Score score) throws IOException {
        scoreService.saveScore(principal, score);
        return "redirect:/";
    }
    @GetMapping("/score")
    public String formScore(Principal principal, Model model){
        User user = scoreService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "score";
    }
    @GetMapping("/finalscore")
    public String redirectFinalScore(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        return "redirect:/finalscore/1";
    }
    @GetMapping("/finalscore/{id}")
    public String finalScore(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("subjects", scoreService.listSubjects(null));
        model.addAttribute("scores", scoreService.listScores(null));
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("selectedTerm", id);
        return "final-scores";
    }
    @GetMapping("/homeworks")
    public String redirectToHomeworks(){
        LocalDate currentDate = LocalDate.now();
        String formattedDate = currentDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        return "redirect:/homeworks/" + formattedDate;
    }
    @RequestMapping(value = "/homeworks/{dueDate}", method = RequestMethod.GET)
    public ModelAndView homeworks(@PathVariable("dueDate") @DateTimeFormat(pattern="dd-MM-yyyy") LocalDate dueDate) {
        ModelAndView modelAndView = new ModelAndView("homework-student");
        List<Homework> homeworkList = homeworkService.getAllHomework();
        List<Homework> filteredList = homeworkList.stream()
                .filter(homework -> homework.getDueDate().equals(dueDate))
                .collect(Collectors.toList());
        modelAndView.addObject("homeworkList", filteredList);
        return modelAndView;
    }
    @RequestMapping(value = "/homeworks", method = RequestMethod.POST)
    public String redirectToHomeworksWithDate(@RequestParam("dueDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate dueDate){
        return "redirect:/homeworks/" + dueDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
    }
    @GetMapping("/admin/groups")
    public String viewGroups(@RequestParam(name = "idname", required = false) String name, Model model, Principal principal){
        model.addAttribute("groups", groupService.listGroups(name));
        return "groups-admin";
    }
    @GetMapping("/admin/groups/{id}")
    public String editGroup(@RequestParam(name = "idname", required = false) String lastName, @PathVariable Long id, Model model, Principal principal){
        List<User> users = groupService.getUsersByGroup(groupService.getGroupById(id).getName());
        List<User> sortedUsers;
        if (lastName == null) {
            // Выводим весь список
            sortedUsers = users;
        } else {
            // Выводим только тех пользователей, у которых lastName равно заданному значению
            sortedUsers = users.stream()
                    .filter(user -> user.getLastName() != null && user.getLastName().equals(lastName))
                    .collect(Collectors.toList());
        }
        model.addAttribute("users", sortedUsers);
        return "add-student-to-group";
    }
}
