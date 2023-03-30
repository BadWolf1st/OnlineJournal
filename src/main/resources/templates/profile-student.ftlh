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

        .item {
            padding: 20px; /* Поля вокруг текста */
            border-radius: 15px; /* Уголки */
            background-color: #29292C;
            margin: 10px;
            max-width: 289px;
            max-height: 200px;
            width: 289px;
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

        .row > * {
            padding-right: auto;
            padding-left: auto;
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

        .CenterThis {
            position: sticky;
            top: 50%;
            left: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        /* Rectangle 58 */
        .Profile {
            position: absolute;
            width: 290px;
            height: 345px;
            left: 20px;
            top: 137px;

            background: url(image.png);
            border-radius: 365px;
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
                <a href="homeStudent"
                   class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                            <span class="fs-5 d-none d-sm-inline">
                                <img src="../static/logo/LabelLabel.svg" class="img-fluid invert" alt="Мои оценки">
                            </span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li>
                        <div class="buttonVisual" id="Home">
                            <a href="/" id="HomeText" class="nav-link align-middle px-0 buttonText">
                                <i class="fs-4 bi-house"></i>
                                <span class="ms-1 d-none d-sm-inline">Главная</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual">
                            <a href="/hi" data-bs-toggle="collapse" class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi bi-person-circle"></i>
                                <span class="ms-1 d-none d-sm-inline">Пользователи</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="buttonVisual">
                            <a href="#" class="nav-link px-0 align-middle buttonText">
                                <i class="fs-4 bi bi-people-fill"></i>
                                <span class="ms-1 d-none d-sm-inline">Группы</span>
                            </a>
                        </div>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle profileButton active"
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
                <div class="text-center"> Мой профиль </div>
            </div>
            <div class="col">
                <div style="height: 200px;margin: 20px">
                    <img alt="profile" src="../static/logo/Profile.svg" style="height: 100%; object-fit: cover;">
                </div>
            </div>
                <div class="col">
            <div style="margin: 10px" class="row">
                <div class="col-md-3">ФИО</div>
                <div class="col-md-3">${user.getLastName()} ${user.getName()} ${user.getMiddleName()}</div>
            </div>
            <div style="margin: 10px" class="row">
                <div class="col-md-3">Табельный номер</div>
                <div class="col-md-3">${user.tableNumber}</div>
            </div>
            <div style="margin: 10px" class="row">
                <div class="col-md-3">Пол</div>
                <div class="col-md-3">${user.gender}</div>
            </div>
            <div style="margin: 10px" class="row">
                <div class="col-md-3">Дата рождения</div>
                <div class="col-md-3">${user.getDate()}</div>
            </div>
            <div style="margin: 10px" class="row">
                <div class="col-md-3">Возраст</div>
                <div class="col-md-3">${user.age}</div>
            </div>
                </div>
            </div>
        </div>
        </div>
</body>
</html>
