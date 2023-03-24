package com.example.ediary.controllers;

import com.example.ediary.models.Score;
import com.example.ediary.models.User;
import com.example.ediary.services.ScoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ScoreController {
    private final ScoreService scoreService;
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
        model.addAttribute("finalscores", scoreService.getScoresByTypes());
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("selectedTerm", id);
        return "final-scores";
    }
}
