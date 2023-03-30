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
    private String group_name;
    private String weekday;
    private Integer week_number;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;



    public Timetable(String classroom_number , Integer lesson_number, String name_lesson, String name_teacher, String time, String type_of_lesson, String group_name, String weekday, Integer week_number) {
        this.classroom_number =classroom_number;
        this.lesson_number = lesson_number;
        this.name_lesson = name_lesson;
        this.name_teacher = name_teacher;
        this.time = time;
        this.type_of_lesson = type_of_lesson;
        this.group_name = group_name;
        this.weekday = weekday;
        this.week_number = week_number;
    }

    public Integer getWeek_number() {
        return week_number;
    }

    public void setWeek_number(Integer week_number) {
        this.week_number = week_number;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getLesson_number() {
        return lesson_number;
    }

    public void setLesson_number(Integer lesson_number) {
        this.lesson_number = lesson_number;
    }

    public String getType_of_lesson() {
        return type_of_lesson;
    }

    public void setType_of_lesson(String type_of_lesson) {
        this.type_of_lesson = type_of_lesson;
    }

    public String getClassroom_number() {
        return classroom_number;
    }

    public void setClassroom_number(String classroom_number) {
        this.classroom_number = classroom_number;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getName_lesson() {
        return name_lesson;
    }

    public void setName_lesson(String name_lesson) {
        this.name_lesson = name_lesson;
    }

    public String getName_teacher() {
        return name_teacher;
    }

    public void setName_teacher(String name_teacher) {
        this.name_teacher = name_teacher;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }
}
