package com.example.ediary.repositories;

import com.example.ediary.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    List<User> findByGroupName(String groupName);
}
