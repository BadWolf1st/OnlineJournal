package com.example.ediary.models;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "timetable")
public class Timetable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer lesson_number;

    private String type_of_lesson;
    private String classroom_number;
    private String time;
    private String name_lesson;
    private String name_teacher;



    public Timetable(String classroom_number , Integer lesson_number, String name_lesson, String name_teacher, String time, String type_of_lesson ) {
        this.classroom_number =classroom_number;
        this.lesson_number = lesson_number;
        this.name_lesson = name_lesson;
        this.name_teacher = name_teacher;
        this.time = time;
        this.type_of_lesson = type_of_lesson;
    }
}
