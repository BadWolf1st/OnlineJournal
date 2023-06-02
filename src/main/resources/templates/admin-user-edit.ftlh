
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8">
  <title>Bootstrap testing</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <style>
    .circleIcon{
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
    @media (prefers-color-scheme: dark) {
      body{
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

    .userColor{
      background-color: #D7A700
    }

    .buttonVisual{
      color: white; /* Цвет текста */
      padding: 10px; /* Поля вокруг текста */
      border-radius: 10px; /* Уголки */
    }
    .buttonVisual.active{
      color: black;
      background: rgb(215,167,0);
      background: linear-gradient(315deg, rgba(215,167,0,1) -8%, rgba(0,255,124,1) 100%);
    }
    .buttonText{
      font-weight: bold;
      color: white;
    }
    .buttonText.this{
      color: black;
    }
    @media (prefers-color-scheme: light) {
      .buttonText{
        color: black;
      }
    }

    .profileButton{
      font-weight: bold;
      color: white;
      background-color: #131313;
      border-radius: 10px;
      padding: 10px;
    }
    .profileButton.active{
      color: black;
      background: rgb(215,167,0);
      background: linear-gradient(315deg, rgba(215,167,0,1) -8%, rgba(0,255,124,1) 100%);
    }
    @media (prefers-color-scheme: light) {
      .profileButton{
        color: black;
        background-color: #cbcbcb;
      }
    }
    .CenterThis{
      position: sticky;
      top: 50%;
      left: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .perenos-hyphens {
      -moz-hyphens: auto;
      -webkit-hyphens: auto;
      -ms-hyphens: auto;
    }

    .noDots{
      list-style-type: none; /* Убираем маркеры */
    }
    .noDots2{
      margin-left: 0; /* Отступ слева в браузере IE и Opera */
      padding-left: 0; /* Отступ слева в браузере Firefox, Safari, Chrome */
    }

    /* Dark text mode =v
    class="text-black text-dark-emphasis"
    */
  </style>
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script async src="../../static/js/DarkChanger.js"></script>
<script src="../../static/js/activeButtonMenuChanger.js"></script>

<div class="container-fluid">
  <div class="row flex-nowrap">
    <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0">
      <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
        <a href="homeStudent" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
          <span class="fs-5 d-none d-sm-inline"><img src="../../static/logo/LabelLabel.svg" class="img-fluid invert" alt="Мои оценки"></span>
        </a>
        <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
          <li>
            <div  class="buttonVisual active" id="Home">
              <a href="homeStudent" id="HomeText" class="nav-link align-middle px-0 buttonText this">
                <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Главная</span>
              </a>
            </div>
          </li>

        </ul>
        <hr>
        <div class="dropdown pb-4">
          <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle profileButton " id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <div class="circleIcon text-white userColor">
              <div class="container6">Г</div>
            </div>
            <span class="d-none d-sm-inline mx-1 ">Гость</span>
          </a>
          <ul class="dropdown-menu dropdown-menu text-small shadow">
            <li><a class="dropdown-item" href="#">Профиль</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="/logout" style="color: #d62929">Выйти из аккаунта</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="vr" style="padding-right: 0; padding-left: 0"></div>
    <div class="col">
      <form action="/admin/user/edit" method="post">
        <#list roles as role>
          <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
          </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Сохранить</button>
      </form>
      <hr>
      <form action="/admin/user/edit/${user.id}/name" method="post" enctype="multipart/form-data">
        <div class="form-row align-items-center mb-4">
          <label for="fullNameInput">ФИО</label>
          <input type="text" required class="form-control"
                 id="fullNameInput" name="fullNameInput">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="width: 100%" class="btn btn-dark">Изменить</button>
      </form>
      <form action="/admin/user/edit/${user.id}}/tableNumber" method="post" enctype="multipart/form-data">
        <div class="form-row align-items-center mb-4">
          <label for="NumberInput">Табельный номер</label>
          <input type="number" required class="form-control"
                 id="NumberInput" name="NumberInput">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="width: 100%" class="btn btn-dark">Изменить</button>
      </form>
      <form action="/admin/user/edit/${user.id}/gender" method="post" enctype="multipart/form-data">
        <div class="form-row align-items-center mb-4">
          <label for="GenderInput">Пол</label>
          <input type="text" required class="form-control"
                 id="GenderInput" name="GenderInput">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="width: 100%" class="btn btn-dark">Изменить</button>
      </form>
      <form action="/admin/user/edit/${user.id}/date" method="post" enctype="multipart/form-data">
        <div class="form-row align-items-center mb-4">
          <label for="DateInput">Дата рождения</label>
          <input type="text" required class="form-control"
                 id="DateInput" name="DateInput">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="width: 100%" class="btn btn-dark">Изменить</button>
      </form>
      <form action="/admin/user/edit/${user.id}/age" method="post" enctype="multipart/form-data">
        <div class="form-row align-items-center mb-4">
          <label for="AgeInput">Возраст</label>
          <input type="number" required class="form-control"
                 id="AgeInput" name="AgeInput">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" style="width: 100%" class="btn btn-dark">Изменить</button>
      </form>
    </div>


  </div>
</div>
</body>
</html>
