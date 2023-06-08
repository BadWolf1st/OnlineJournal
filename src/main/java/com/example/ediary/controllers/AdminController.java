package com.example.ediary.controllers;

import com.example.ediary.models.Group1;
import com.example.ediary.models.Score;
import com.example.ediary.models.Subject;
import com.example.ediary.models.User;
import com.example.ediary.models.enums.Role;
import com.example.ediary.repositories.GroupRepository;
import com.example.ediary.services.GroupService;
import com.example.ediary.services.ScoreService;
import com.example.ediary.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final ScoreService scoreService;
    private final GroupService groupService;
    private final GroupRepository groupRepository;

    @GetMapping("/admin/panel")
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
        model.addAttribute("roles", Role.values());
        return "admin-user-edit";
    }
    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin/user/edit/" + user.getId();
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
    @GetMapping("/admin/subject")
    public String subjectList(Model model, Principal principal){
        model.addAttribute("subjects", scoreService.listSubjects(null));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin-subject-list";
    }
    @PostMapping("/admin/subject/{id}/delete")
    public String deleteSubject(@PathVariable("id") Long id, Model model, Principal principal){
        scoreService.deleteSubject(userService.getUserByPrincipal(principal), id);
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "redirect:/admin/subject";
    }
    @GetMapping("/admin/subject/create")
    public String fillSubject(Model model, Principal principal){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "subject-create";
    }
    @PostMapping("/admin/subject/create")
    public String createSubject(@RequestParam("teacherId") Long id, @RequestParam("groupId") Long groupId, Subject subject, Principal principal) throws IOException {
        subject.setTeacher(userService.getUserById(id));
        subject.setGroup(groupService.getGroupById(groupId));
        scoreService.saveSubject(principal, subject);
        return "redirect:/admin/subject";
    }
    @GetMapping("/admin/groups")
    public String viewGroups(@RequestParam(name = "idname", required = false) String name, Model model, Principal principal){
        model.addAttribute("groups", groupService.listGroups(name));
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        return "groups-admin1";
    }
    @GetMapping("/admin/groups/add")
    public String addGroups(Principal principal, Model model){
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        return "reggroup";
    }
    @PostMapping("/admin/groups/ad")
    public String addGroupsPost(Principal principal, Group1 group1) throws IOException {
        groupService.saveGroup(principal,group1);
        groupRepository.save(group1);
        return "redirect:/admin/groups";
    }
    @GetMapping("/admin/groups/edit/{id}")
    public String editGroups(@PathVariable("id") Long id,Principal principal, Model model){
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("group", groupService.getGroupById(id));
        return "editgroup";
    }
    @PostMapping("/admin/groups/edit/{id}/groupName")
    public String editGroupsName(@PathVariable("id") Long id, @RequestParam("name") String groupName, Principal principal) {
        Group1 group1 = groupService.getGroupById(id);
        group1.setName(groupName);
        groupService.updateGroup(group1);
        return "redirect:/admin/groups";
    }

    @PostMapping("/admin/groups/edit/{id}/count")
    public String editGroupsCount(@PathVariable("id") Long id, @RequestParam("count") Integer count, Principal principal) {
        Group1 group1 = groupService.getGroupById(id);
        group1.setCount(count);
        groupService.updateGroup(group1);
        return "redirect:/admin/groups";
    }

    @PostMapping("/admin/groups/add")
    public String saveGroupsPost(Principal principal, Group1 group1) throws IOException {
        groupService.saveGroup(principal,group1);
        groupRepository.save(group1);
        return "redirect:/admin/groups";
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
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("group", groupService.getGroupById(id));
        return "add-student-to-group";
    }
    @GetMapping("/admin/groups/{id}/delete/{userId}")
    public String deleteUserFromGroup(@PathVariable Long id, @PathVariable Long userId, Model model, Principal principal){
        User user = userService.getUserById(userId);
        user.setGroupName(null);
        user.setGroup(null);
        userService.updateUser(user);
        return "redirect:/admin/groups/" + id;
    }
    @GetMapping("/admin/groups/{id}/headman/{userId}")
    public String headmanUserFromGroup(@PathVariable Long id, @PathVariable Long userId, Model model, Principal principal){
        Group1 group = groupService.getGroupById(id);
        group.setHeadman(userService.getUserById(userId));
        groupService.updateGroup(group);
        return "redirect:/admin/groups/" + id;
    }
    @GetMapping("/admin/groups/{id}/add")
    public String addToGroup(@PathVariable Long id, Model model, Principal principal){
        model.addAttribute("users", userService.list());
        model.addAttribute("user", scoreService.getUserByPrincipal(principal));
        model.addAttribute("group", groupService.getGroupById(id));
        return "add-to-group";
    }
    @PostMapping("/admin/groups/{groupid}/add/{userid}")
    public String acceptToGroup(@PathVariable Long groupid, @PathVariable Long userid, Model model, Principal principal){
        User user = userService.getUserById(userid);
        user.setGroup(groupService.getGroupById(groupid));
        user.setGroupName(groupService.getGroupById(groupid).getName());
        userService.updateUser(user);
        return "redirect:/admin/groups/" + groupid + "/add";
    }
}
