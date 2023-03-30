
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
        </style>
    </head>
    <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="../static/js/DarkChanger.js"></script>
    <div class="container container6">
        <div class="row">
            <img src="../static/logo/LabelLabel.svg" class="img-fluid logo invert" alt="Мои оценки">
            <form action="/login " method="post" style="margin-top: 2%">
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="email" name="username" placeholder="Электронная почта">
                    <label for="email">Электронная почта</label>
                    <div id="email" class="invalid-feedback">
                        Неверная электронная почта
                    </div>
                </div>
                <div class="form-floating mb-3">

                    <input type="password" class="form-control" id="password" name="password" placeholder="Пароль">
                    <label for="password">Пароль</label>
                    <div id="password" class="invalid-feedback">
                        Неверный пароль
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary" style="margin-top: 1%">Войти</button>
            </form>
            <form action="/registration" method="get" style="margin-top: 2%">
                <button type="submit" class="btn btn-primary" style="align: right">Зарегистрироваться</button>
            </form>
        </div>
    </div>

    </body>
    </html>