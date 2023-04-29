package com.example.ediary.repositories;

import com.example.ediary.models.Group1;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group1, Long> {
    List<Group1> findByName(String name);
    Group1 findGroup1ByName(String name);

}
