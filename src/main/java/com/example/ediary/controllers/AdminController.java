package com.example.ediary.controllers;

import com.example.ediary.models.User;
import com.example.ediary.models.enums.Role;
import com.example.ediary.services.UserService;
import lombok.RequiredArgsConstructor;
import org.dom4j.rule.Mode;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{id}")
    public String userEdit(@PathVariable("id") Long id, Model model, Principal principal) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin-edit-student";
    }
    @GetMapping("/admin/home")
    public String adminhome(User user, Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "homeadmin";
    }
    @PostMapping("/admin/home/accept")
    public String acceptGuest(@RequestParam("userId") Long id){
        userService.editRoleToUser(id);
        return "redirect:/admin/home";
    }
    @PostMapping("/admin/home/decline")
    public String declineGuest(@RequestParam("userId") Long id){
        userService.cancelGuest(id);
        return "redirect:/admin/home";
    }
    @GetMapping("/admin/userlist")
    public String userList(Model model, Principal principal){
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin-student-list";
    }
    @PostMapping("/admin/user/edit/{id}/name")
    public String postName(@PathVariable("id") Long id, @RequestParam("fullNameInput") String fullName, Model model){
        String[] name = fullName.split(" ");
        User user = userService.getUserById(id);
        user.setLastName(name[0]);
        user.setName(name[1]);
        user.setMiddleName(name[2]);
        userService.updateUser(user);
        return "redirect:/admin/user/edit/{id}";
    }
    @PostMapping("/admin/user/edit/{id}/tableNumber")
    public String postTableNumber(@PathVariable("id") Long id, @RequestParam("NumberInput") Long tableNumber, Model model){
        User user = userService.getUserById(id);
        user.setTableNumber(tableNumber);
        userService.updateUser(user);
        return "redirect:/admin/user/edit/{id}";
    }
    @PostMapping("/admin/user/edit/{id}/gender")
    public String postGender(@PathVariable("id") Long id, @RequestParam("GenderInput") String gender, Model model){
        User user = userService.getUserById(id);
        user.setGender(gender);
        userService.updateUser(user);
        return "redirect:/admin/user/edit/{id}";
    }
    @PostMapping("/admin/user/edit/{id}/date")
    public String postDate(@PathVariable("id") Long id, @RequestParam("DateInput") String date, Model model){
        User user = userService.getUserById(id);
        user.setDate(date);
        userService.updateUser(user);
        return "redirect:/admin/user/edit/{id}";
    }
    @PostMapping("/admin/user/edit/{id}/age")
    public String postDate(@PathVariable("id") Long id, @RequestParam("AgeInput") Long age, Model model){
        User user = userService.getUserById(id);
        user.setAge(age);
        userService.updateUser(user);
        return "redirect:/admin/user/edit/{id}";
    }
}
