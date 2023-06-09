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
                <a href="/"
                   class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline"><img src="../static/logo/LabelTeacherLogo.svg"
                                                               class="img-fluid invert" alt="Мои оценки"></span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li>
                        <div class="buttonVisual">
                            <a class="nav-link align-middle px-0 buttonText" href="/">
                                <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Главная</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual active">
                            <a class="nav-link px-0 align-middle buttonText this"  href="/tutor/groups">
                                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">Группы</span> </a>
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
            <div class="menuBar">
                <form>
                    <div class="row" style="display: flex; align-items: center; margin: 0 2px;">
                        <a href="/tutor/groups" class="fw-bold text-black button text-center bi bi-chevron-left" type="button"
                           style="justify-content: right; width: 30px; height: 30px">
                        </a>
                        <div class="col text-center top-100">
                            ${group.getName()}
                        </div>
                        <button onclick="location.href='/tutor/groups/homework'" type="button" class="btn fw-bold text-black button text-center align-self-center"
                                style="flex-grow: 1;">
                            Задать домашнее задание
                        </button>
                    </div>
                </form>
            </div>

            <table class="table table-bordered" width="500">
                <thead>
                <tr>
                    <th scope="col">ФИО</th>
                    <th scope="col">Общие оценки</th>
                    <th scope="col">Средний балл</th>
                </tr>
                </thead>
                <tbody>
                <#list users as user>
                    <#assign tableView = false>
                    <#if user.group?exists && user.getGroup() == group>
                        <tr>
                            <#if scores?has_content>
                                <#list scores as score>
                                    <#if user.getId() == score.getStudentId() && !tableView>
                                        <#assign tableView = true>
                                        <th scope="row">${user.getName()} ${user.getLastName()} ${user.getMiddleName()}
                                            <a href="/tutor/groups/edit" class="fw-bold text-black button text-center" type="button"
                                               style="justify-content: right; height: 30px; width: 30px">✎
                                            </a>
                                        </th>
                                        <td>
                                            <#assign totalScore = 0>
                                            <#assign scoreCount = 0>
                                            <#list scores as s>
                                                <#if user.getId() == score.getStudentId()>
                                                    <#assign totalScore += s.getCount()>
                                                    <#assign scoreCount += 1>
                                                    ${s.getCount()}<#sep>,</#sep>
                                                </#if>
                                            </#list>
                                        </td>
                                        <td>
                                            <#if scoreCount != 0>
                                                ${totalScore / scoreCount}
                                            </#if>
                                        </td>
                                    </#if>
                                </#list>
                            <#else>
                                <th scope="row">${user.getName()} ${user.getLastName()} ${user.getMiddleName()}
                                    <a href="/tutor/groups/edit" class="fw-bold text-black button text-center" type="button"
                                       style="justify-content: right; height: 30px; width: 30px">✎
                                    </a>
                                </th>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </#if>
                        </tr>
                    </#if>
                </#list>


                </tbody>
            </table>


        </div>
    </div>
</div>
</body>
</html>