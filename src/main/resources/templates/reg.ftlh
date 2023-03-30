
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
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="../static/js/DarkChanger.js"></script>
<div class="container container6">
    <div class="row">
        <div class="empty"></div>
        <img src="../static/logo/LabelLabel.svg" class="img-fluid logo invert" alt="Мои оценки">
        <form action="/registration" method="post">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="lastName" required name="lastName" placeholder="LastName">
                <label for="floatingInput">Фамилия</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" required id="name" name="name" placeholder="Name">
                <label for="floatingInput">Имя</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="middleName" required name="middleName" placeholder="MiddleName">
                <label for="floatingInput">Отчество</label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" required name="email" placeholder="name@example.com">
                <label for="floatingInput">Электронная почта</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="phoneNumber" required name="phoneNumber" placeholder="+7xxxxxxxxxx">
                <label for="floatingInput">Номер телефона</label>
                <div id="emailHelp" class="form-text">Формат ввода: +7910999999</div>
            </div>
            <div class="form-floating  mb-3">
                <input type="password" class="form-control" id="password" required name="password" placeholder="Password">
                <label for="floatingPassword">Пароль</label>
            </div>
            <div class="form-group">
                <label for="gender">Пол</label>
                <select id="gender" required name="gender" class="form-control">
                    <option value="">Пол не выбран</option>

                    <option value="Мужской">Мужской</option>
                    <option value="Женский">Женский</option>

                </select>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="groupName" required name="groupName" placeholder="ААА-000">
                <label for="floatingInput">Группа</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" class="form-control" id="tableNumber" required name="tableNumber" placeholder="tableNumber">
                <label for="floatingInput">Табельный номер</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="faculty" required name="faculty" placeholder="Faculty">
                <label for="floatingInput">Институт</label>
            </div>
            <div class="form-group  mb-3">
                <label for="inputDate">Введите дату рождения:</label>
                <input type="date" class="form-control" required name="date">
            </div>
            <div class="form-floating mb-3">
                <input type="number" class="form-control" id="age" required name="age" placeholder="age">
                <label for="floatingInput">Возраст</label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
        </form>
    </div>
</div>

</body>
</html>
