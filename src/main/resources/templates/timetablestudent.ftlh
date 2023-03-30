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
            justify-content: center
        }

        .invert {
            filter: invert(0);
        }

        @media (prefers-color-scheme: light) {
            .invert {
                filter: invert(1);
            }
        }

        @media (prefers-color-scheme: dark) {
            body {
                background-color: #161719;
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

        .menuBar {
            color: white; /* Цвет текста */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 20px; /* Уголки */
            background-color: #29292C;
            margin: 10px;
            display: flex;
        }

        .timetable {
            color: black; /* Цвет текста */
            padding: 10px; /* Поля вокруг текста */
            border-radius: 10px; /* Уголки */
            background-color: #29292C;
            margin: 10px;
            display: flex;

        }

        @media (prefers-color-scheme: dark) {
            .timetable {
                color: white;
            }
        }

        .rightThis {
            /* Выровнять по правому краю */
            margin-left: 0;
        }

        .row > * {
            padding-right: 0;
            padding-left: 0;
        }

        @media (prefers-color-scheme: light) {
            .menuBar {
                background-color: #cbcbcb;
            }

            .timetable {
                background-color: #cbcbcb;
            }
        }

        .form-select {
            width: 150px;
        }

        .selectWidth {
            max-height: 50px;
            max-width: 300px;
        }

        .CenterDownThis {
            /* Выровнять по вертикали по центу */
            position: sticky;
            top: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Dark text mode =v
        class="text-black text-dark-emphasis"
        */
    </style>
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script async src="../../static/js/DarkChanger.js"></script>
<script src="../../static/js/activeButtonMenuChanger.js"></script>

<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="homeStudent"
                   class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline"><img src="../../static/logo/LabelLabel.svg"
                                                               class="img-fluid invert" alt="Мои оценки"></span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li>
                        <div class="buttonVisual" id="Home">
                            <a href="homeStudent" id="HomeText" class="nav-link align-middle px-0 buttonText">
                                <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Главная</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual">
                            <a href="/hi" data-bs-toggle="collapse" class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi-pencil-square"></i> <span class="ms-1 d-none d-sm-inline">Домашние задания</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual active">
                            <a href="#" class="nav-link px-0 align-middle buttonText this">
                                <i class="fs-4 bi-clock"></i> <span
                                        class="ms-1 d-none d-sm-inline">Расписание</span></a>
                        </div>
                    </li>

                    <li>
                        <div class="buttonVisual">
                            <a href="#" data-bs-toggle="collapse" class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi-star"></i> <span
                                        class="ms-1 d-none d-sm-inline">Итоговые оценки</span></a>
                        </div>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle profileButton "
                       id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="circleIcon text-white userColor">
                            <div class="container6">РС</div>
                        </div>
                        <span class="d-none d-sm-inline mx-1 ">Раскутин</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu text-small shadow">
                        <li><a class="dropdown-item" href="#">Профиль</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#" style="color: #d62929">Выйти из аккаунта</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="menuBar align-items-md-start flex-column">

                <select aria-label="Default select example" class="form-select selectWidth flex-row" onchange="redirectToPage(this)">
                    <option value="Понедельник" <#if selectedWeekday == "Понедельник">selected</#if>>Понедельник</option> <!-- Если будет не айс с русскими названиями в поисковой строке, то надо будет подумать здесь ! -->
                    <option value="Вторник" <#if selectedWeekday == "Вторник">selected</#if>>Вторник</option>
                    <option value="Среда" <#if selectedWeekday == "Среда">selected</#if>>Среда</option>
                    <option value="Четверг" <#if selectedWeekday == "Четверг">selected</#if>>Четверг</option>
                    <option value="Пятница" <#if selectedWeekday == "Пятница">selected</#if>>Пятница</option>
                    <option value="Суббота" <#if selectedWeekday == "Суббота">selected</#if>>Суббота</option>
                    <option value="Воскресенье" <#if selectedWeekday == "Воскресенье">selected</#if>>Воскресенье</option>
                </select>
                <select aria-label="Default select example" class="form-select selectWidth flex-row" onchange="redirectToPage(this)">
                    <option value="1" <#if selectedWeek == 1>selected</#if>>1 неделя</option>
                    <option value="2" <#if selectedWeek == 2>selected</#if>>2 неделя</option>
                </select>
            </div>

            <script>
                function redirectToPage(selectElement) {
                    var selectedWeekday = document.querySelector('.form-select.selectWidth.flex-row:first-child').value;
                    var selectedWeek = document.querySelector('.form-select.selectWidth.flex-row:last-child').value;
                    window.location.href = "/timet/" + selectedWeekday + "/" + selectedWeek;
                }
            </script>


            <div class="col-" style="padding: 0; overflow-y: auto; height: 90vh; white-space: nowrap">
                <#assign hasScore = false>
                <#list timetables?sort_by('lesson_number') as timetable>
                    <#if user.groupName == timetable.group_name  && timetable.week_number == selectedWeek && timetable.weekday == selectedWeekday>
                        <#assign hasScore = true>
                        <div class="timetable fw-bold">
                            <div class="row" style="margin: 10px;">
                                <div class="col-md-8">${timetable.getLesson_number()}</div>
                                <div class="col-md-8">${timetable.getType_of_lesson()}</div>
                                <div class="col-md-8">${timetable.getClassroom_number()}</div>
                            </div>
                            <div class="row" style="margin: 10px">
                                <div class="col-md-8">${timetable.getTime()}</div>
                                <div class="col-md-8 text-wrap">${timetable.getName_lesson()}</div>
                                <div class="col-md-8">${timetable.getName_teacher()}</div>
                            </div>
                        </div>
                    </#if>
                </#list>
                <#if hasScore = false>
                    <h1 style="text-align: center">Нет занятий</h1>
                </#if>
            </div>
        </div>

    </div>
</div>
</body>
</html>