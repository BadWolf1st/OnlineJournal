
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap testing</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <style>
        .invert {
            filter: invert(0);
        }
        @media (prefers-color-scheme: light) {
            .invert {
                filter: invert(1);
            }
        }

        div.container6 {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            align-items: center;
            justify-content: center;
            display: flex;
        }

        .logo{
            width: 500px;
            height: auto;
        }
        .empty{
            wight: 50px;
            height: 100px;
        }
        button.btn-primary {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="../static/js/DarkChanger.js"></script>
<div class="container container6">

    <div class="row">
        <div class="empty"></div>
        <img src="../static/logo/LabelLabel.svg" class="img-fluid logo invert" alt="Мои оценки">
        <form action="/regtimetablestudent" method="post">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="classroom_number" placeholder="Classroom_number"><br>
                <label for="floatingInput">Номер аудитории</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="lesson_number" placeholder="Lesson_number"><br>
                <label for="floatingInput">Номер занятия</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="name_lesson" placeholder="Name_lesson"><br>
                <label for="floatingInput">Название предмета</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="name_teacher" placeholder="Name_teacher"><br>
                <label for="floatingInput">Имя преподавателя</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="time" placeholder="Time"><br>
                <label for="floatingInput">Время занятия</label>

            </div>
            <div class="form-floating  mb-3">

                <label for="type_of_lesson" style="margin-top: -15px">Тип занятия</label>
                <select id="type_of_lesson" required name="type_of_lesson" class="form-control">
                    <option value="">Тип не выбран</option>

                    <option value="Лекция">Лекция</option>
                    <option value="Лабораторная работа">Лабораторная работа</option>
                    <option value="Практическое занятие">Практическое занятие</option>
                    <option value="Консультация">Консультация</option>
                    <option value="Экзамен">Экзамен</option>

                </select>
            </div>
            <div class="form-floating  mb-3">
                <input type="text" class="form-control" name="group_name" placeholder="group_name"><br>
                <label for="floatingInput">Название группы</label>
            </div>
            <div class="form-floating  mb-3">
                <label for="weekday" style="margin-top: -15px">День недели</label>
                <select id="weekday" required name="weekday" class="form-control">
                    <option value="">День не выбран</option>

                    <option value="Понедельник">Понедельник</option>
                    <option value="Вторник">Вторник</option>
                    <option value="Среда">Среда</option>
                    <option value="Четверг">Четверг</option>
                    <option value="Пятница">Пятница</option>
                    <option value="Суббота">Суббота</option>
                    <option value="Воскресенье">Воскресенье</option>
                </select>
            </div>
            <div class="form-floating  mb-3">
                <label for="week_number" style="margin-top: -15px">Номер недели</label>
                <select id="week_number" required name="week_number" class="form-control">
                    <option value="">Номер не выбран</option>

                    <option value="1">I Неделя</option>
                    <option value="2">II Неделя</option>
                </select>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </form>
    </div>
</div>

</body>
</html>
