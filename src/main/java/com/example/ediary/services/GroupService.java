package com.example.ediary.services;

import com.example.ediary.models.Group1;
import com.example.ediary.models.User;
import com.example.ediary.repositories.GroupRepository;
import com.example.ediary.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class GroupService {
    private final UserRepository userRepository;
    private final GroupRepository groupRepository;

    public List<User> getUsersByGroup(String groupName) {
        List<Group1> groups = groupRepository.findByName(groupName);
        if (groups.isEmpty()) {
            throw new IllegalArgumentException("Group not found: " + groupName);
        }
        return userRepository.findByGroupName(groups.get(0).getName());
    }

    public List<Group1> listGroups(String title) {
        if (title != null) return groupRepository.findByName(title);
        return groupRepository.findAll();
    }
    public List<Group1> listGroupsByHeadman(String name) {
        if (name != null) return groupRepository.findByName(name);
        return groupRepository.findAll();
    }
    public void saveGroup(Principal principal, Group1 group) throws IOException {
        group.setUser(getUserByPrincipal(principal));
        log.info("Saving new group. Name: {}; Author email: {}", group.getName(), group.getUser().getEmail());
        groupRepository.save(group);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }


    public void deleteGroup(User user, Long id) {
        Group1 group = groupRepository.findById(id)
                .orElse(null);
        if (group != null) {
            if (group.getUser().getId().equals(user.getId())) {
                groupRepository.delete(group);
                log.info("Group with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this group with id = {}", user.getEmail(), id);
            }
        } else {
            log.error("Group with id = {} is not found", id);
        }    }
    public Group1 getGroupById(Long id) {
        return groupRepository.findById(id).orElse(null);
    }
    public Group1 getGroupByName(String name) {return groupRepository.findGroup1ByName(name);}
    public void updateGroup(Group1 group1){
        groupRepository.save(group1);
    }
}
