<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Bootstrap testing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <style>
        .texts {
            font-weight: bold;
        }
        .custom-list {
            margin-bottom: 10px;
        }
        .timetable-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 10px;
        }
        .timetable-item {
            padding: 20px;
            background-color: #f0f0f0;
        }
        .menuBar {
            color: white; /* Цвет текста */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 20px; /* Уголки */
            background-color: #29292C;
            margin: 10px;
        }
        .timetable {
            color: white; /* Цвет текста */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 10px; /* Уголки */
            background-color: #29292C;
            margin: 10px;
            display: flex;

        }
        @media (prefers-color-scheme: light) {
            .timetable {
            color: black;
            background-color: #cbcbcb;
            }
        }

        .button {
            padding: 4px;
            border-radius: 10px;
            background-color: #9F9F9F;
            alignment: right;
        }

        .item {
            padding: 20px; /* Поля вокруг текста */
            border-radius: 15px; /* Уголки */
            background-color: #29292C;
            margin: 10px;
        }

        @media (prefers-color-scheme: light) {
            .menuBar {
                background-color: #cbcbcb;
            }

            .item {
                background-color: #cbcbcb;
            }
        }

        @media (prefers-color-scheme: dark) {
            body {
                background-color: #161719;
            }
        }

        .selectWidth {
            max-width: 140px;
        }

        .evaluation {
            bottom: 60px;
            max-width: 53px;
            height: 30px;
            background: #9F9F9F;
            border-radius: 10px;
            color: black;
            text-align: center;
            font-size: 20px;
            line-height: 30px;
            align-items: center;

        }

        .evaluation.A {
            background-color: #2DE300;
        }

        .evaluation.B {
            background-color: #FFA800;
        }

        .evaluation.C {
            background-color: #23BEEF;
        }

        .evaluation.D {
            background-color: #E10000;
        }

        .evaluation.NP {
            background-color: #E10000;
        }

        .evaluation.P {
            background-color: #2DE300;
        }

        .evaluation.NR {
            background: #9F9F9F;
        }

        .circleIcon {
            width: 40px;
            height: 40px;
            background: #83A7C9;
            border-radius: 50%;
        }

        div.container6 {
            font-weight: bold;
            font-size: x-large;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        @media (prefers-color-scheme: dark) {
            body {
                background-color: #161719;
            }
        }

        .invert {
            filter: invert(0);
        }

        @media (prefers-color-scheme: light) {
            .invert {
                filter: invert(1);
            }
        }

        .userColor {
            background-color: #D7A700
        }

        .buttonVisual {
            color: white; /* Цвет текста */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 10px; /* Уголки */
        }

        .buttonVisual.active {
            color: black;
            background: rgb(215, 167, 0);
            background: linear-gradient(315deg, rgba(215, 167, 0, 1) -8%, rgba(0, 255, 124, 1) 100%);
        }

        .buttonText {
            font-weight: bold;
            color: white;
        }

        .buttonText.this {
            color: black;
        }

        @media (prefers-color-scheme: light) {
            .buttonText {
                color: black;
            }
        }

        .profileButton {
            font-weight: bold;
            color: white;
            background-color: #131313;
            border-radius: 10px;
            padding: 10px;
        }

        .profileButton.active {
            color: black;
            background: rgb(215, 167, 0);
            background: linear-gradient(315deg, rgba(215, 167, 0, 1) -8%, rgba(0, 255, 124, 1) 100%);
        }

        @media (prefers-color-scheme: light) {
            .profileButton {
                color: black;
                background-color: #cbcbcb;
            }
        }

    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script async src="../../static/js/DarkChanger.js"></script>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <form action="/deleteTimetable" method="post">
            <div class="col">
                <#assign hasScore = false>
                <#list timetables?sort_by('lesson_number') as timetable>
                    <#if id3 == timetable.group_name  && timetable.week_number == selectedWeek && timetable.weekday == selectedWeekday>
                        <#assign hasScore = true>
                        <ul id="list" class="custom-list">
                            <div class="col-" style="padding: 100px; height: 900px; white-space: nowrap">
                                <div class="timetable-grid">
                                    <div class="timetable-item">
                                        <input type="checkbox" class="input-checkbox" name="timetableId" value="${timetable.getId()}">
                                        <div class="row" style="margin-bottom: 10px;">
                                            <div class="col-md-8">${timetable.getLesson_number()}</div>
                                            <div class="col-md-8">${timetable.getType_of_lesson()}</div>
                                            <div class="col-md-8">${timetable.getClassroom_number()}</div>
                                            <div class="col-md-8">${timetable.getId()}</div>
                                        </div>
                                        <div class="row" style="margin-bottom: 10px">
                                            <div class="col-md-8">${timetable.getTime()}</div>
                                            <div class="col-md-8 text-wrap">${timetable.getName_lesson()}</div>
                                            <div class="col-md-8">${timetable.getName_teacher()}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </#if>
                </#list>
                <#if hasScore = false>
                    <h1 style="text-align: center">Нет занятий</h1>
                </#if>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Удалить</button>
        </form>
    </div>
</div>
</body>
</html>