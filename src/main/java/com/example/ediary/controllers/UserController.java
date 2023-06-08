package com.example.ediary.controllers;

import com.example.ediary.models.User;
import com.example.ediary.services.GroupService;
import com.example.ediary.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final GroupService groupService;
    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "auth";
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login";
    }
    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        return "profile-student";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("groups", groupService.listGroups(null));
        return "reg";
    }


    @PostMapping("/registration")
    public String createUser(@RequestParam("groupId") Long id, User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        user.setGroup(groupService.getGroupById(id));
        return "redirect:/login";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        model.addAttribute("products", user.getProducts());
        return "profile-student";
    }

    @GetMapping("/profile/users")
    public String allUsers(User user, Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "users(2)";//доделал фулл чтобы роли отображались
    }

    @GetMapping("/profile/groups")
    public String GroupsUsers(Model model, Principal principal, String name) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("groups", groupService.listGroups(name));
        return "groupsProfile";
    }
    @GetMapping("/profile/groups/{id}")
    public String GroupsUsersInfo(@PathVariable("id") Long id, Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("group",groupService.getGroupById(id));
        return "profileGropsInfo";
    }
    @PostMapping("/profile/change/avatar")
    public String changeAddress(@RequestParam("file") MultipartFile file,
                                Principal principal, Model model) throws IOException {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        userService.changeAvatar(user, file);
        return "redirect:/profile";
    }
}
