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
        .form {
            padding: 0px;
            margin: 0px;
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
<script async src="../static/js/DarkChanger.js"></script>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="homeAdmin"
                   class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                            <span class="fs-5 d-none d-sm-inline">
                                <img src="../static/logo/LabelAdminLogo.svg" class="img-fluid invert" alt="Мои оценки">
                            </span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li>
                        <div class="buttonVisual" id="Home">
                            <a href="/admin/home" id="HomeText" class="nav-link align-middle px-0 buttonText">
                                <i class="fs-4 bi-house"></i>
                                <span class="ms-1 d-none d-sm-inline">Главная</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual">
                            <a href="/admin/userlist"  class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi bi-person-circle"></i>
                                <span class="ms-1 d-none d-sm-inline">Пользователи</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div  class="buttonVisual active">
                            <a href="/admin/timetable" class="nav-link px-0 align-middle buttonText this">
                                <i class="fs-4 bi-clock"></i> <span class="ms-1 d-none d-sm-inline">Расписание</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual">
                            <a href="admin/groups" class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi bi-people-fill"></i>
                                <span class="ms-1 d-none d-sm-inline">Группы</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div  class="buttonVisual">
                            <a href="/admin/subject"  class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi-subtract"></i> <span class="ms-1 d-none d-sm-inline">Предметы</span></a>
                        </div>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle profileButton "
                       id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">

                        <div class="circleIcon text-white userColor">
                            <div class="container6">${user.getFirstSymbol(user.getLastName())}${user.getFirstSymbol(user.getName())}</div>
                        </div>
                        <span class="d-none d-sm-inline mx-1 ">${user.getLastName()}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu text-small shadow">
                        <li><a class="dropdown-item" href="/profile">Профиль</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li>
                            <a class="dropdown-item" href="/logout" style="color: #d62929">Выйти из аккаунта</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col">
            <form action="/deleteTimetable" method="post">
                <#assign hasTimetable = false>
                <#list timetables?sort_by('lesson_number') as timetable>
                    <#if id3 == timetable.group_name && timetable.week_number == selectedWeek && timetable.weekday == selectedWeekday>
                        <#assign hasTimetable = true>
                        <ul id="list"  style="margin-bottom: -700px;" >
                            <div class="col-" style="padding: 0; overflow-y: auto; height: 90vh; white-space: nowrap">
                                <div class="timetable fw-bold">
                                    <input type="checkbox" class="input-checkbox" name="timetableId" value="${timetable.getId()}">
                                    <div class="row" style="margin: 10px;">
                                        <div class="col-md-8">${"Номер занятия: " + timetable.getLesson_number()}</div>
                                        <div class="col-md-8">${"Тип занятия: " + timetable.getType_of_lesson()}</div>
                                        <div class="col-md-8">${"Номер аудитории: " + timetable.getClassroom_number()}</div>
                                    </div>
                                    <div class="row" style="margin: 10px">
                                        <div class="col-md-8">${"Время занятия: " + timetable.getTime()}</div>
                                        <div class="col-md-8 text-wrap">${"Наименование предмета " + timetable.getName_lesson()}</div>
                                        <div class="col-md-8">${"Имя преподавателя " + timetable.getName_teacher()}</div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </#if>
                </#list>
                <#if hasTimetable = false>
                    <h1 style="text-align: center">Нет занятий</h1>
                </#if>

                <div class="d-flex justify-content-center">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <#if hasTimetable = false>
                        <button type="submit" class="btn fw-bold text-black button text-center float-end"
                                style="justify-content: left; background-color: red; height: 40px; width: 130px; margin: 5px">Вернуться</button>
                    </#if>
                    <#if hasTimetable = true>
                        <button type="submit" class="btn fw-bold text-black button text-center float-end"
                                style="justify-content: left; background-color: red; height: 40px; width: 130px; margin: 5px">Удалить</button>
                    </#if>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>