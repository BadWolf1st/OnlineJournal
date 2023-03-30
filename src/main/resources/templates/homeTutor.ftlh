
<!DOCTYPE html>
<html>
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

    .invert {
      filter: invert(0);
    }
    @media (prefers-color-scheme: light) {
      .invert {
        filter: invert(1);
      }
    }

    @media (prefers-color-scheme: dark) {
      body{
        background-color: #161719;
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
    .menuBar{
      color: white; /* Цвет текста */
      padding: 10px; /* Поля вокруг текста */
      border-radius: 20px; /* Уголки */
      background-color: #29292C;
      margin: 10px;
      display: flex;
    }
    .timetable{
      color: white; /* Цвет текста */
      padding: 10px; /* Поля вокруг текста */
      border-radius: 10px; /* Уголки */
      background-color: #29292C;
      margin: 10px;
      display: flex;
    }
    .rightThis{
      /* Выровнять по правому краю */
        margin-left: auto;
    }
    .row>*{
      padding-right: 0;
      padding-left: 0;
    }
    @media (prefers-color-scheme: light) {
      .menuBar{
        background-color: #cbcbcb;
      }
      .timetable{
        background-color: #cbcbcb;
      }
    }
    .form-select{
      width: 150px;
    }
    .selectWidth{
      max-height: 50px;
      max-width: 300px;
    }

    .CenterDownThis{
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  <script async src="../static/js/DarkChanger.js"></script>
  <script src="../static/js/activeButtonMenuChanger.js"></script>
  <div class="container-fluid">
    <div class="row flex-nowrap">
      <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0">
        <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
          <a href="/static" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-5 d-none d-sm-inline"><img src="../../static/logo/LabelLabel.svg" class="img-fluid invert"></span>
          </a>
          <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
            <li>
              <div  class="buttonVisual active">
                <a href="#" class="nav-link align-middle px-0 buttonText this">
                  <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Главная</span>
                </a>
              </div>
            </li>
            <li>
              <div  class="buttonVisual">
                <a href="#" data-bs-toggle="collapse" class="nav-link px-0 align-middle buttonText">
                  <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">Группы</span> </a>
              </div>
            </li>
          </ul>
          <hr>
          <div class="dropdown pb-4">
            <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle profileButton " id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
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
      <div class="vr" style="padding-right: 0; padding-left: 0"></div>
      <div class="col">
        <div class="menuBar">
          <div style="padding-left: 1%" class="row">
            <div class="col-6">
              <select class="form-select selectWidth" aria-label="Default select example">
                <option value="1" selected>Понедельник</option>
                <option value="2">Вторник</option>
                <option value="3">Среда</option>
                <option value="4">Четверг</option>
                <option value="5">Пятница</option>
                <option value="6">Суббота</option>
                <option value="7">Воскресенье</option>
              </select>
            </div>
            <div class="col-6" style="padding-left: 2%">
              <select class="form-select selectWidth" aria-label="Default select example">
                <option value="1" selected>1 неделя</option>
                <option value="2">2 неделя</option>
              </select>
            </div>
          </div>
          <spa class="rightThis CenterDownThis"> 20.02.2023 </span >
        </div>
        <div class="timetable">
          <div style="margin: 10px" class="row">
            <div class="col-md-8">5 пара</div>
            <div class="col-md-8">Лекция</div>
            <div class="col-md-8">Аудитория 1326</div>
          </div>
          <div style="margin: 10px" class="row">
            <div class="col-md-8">15:20 - 16:40</div>
            <div class="col-md-8">Основы сетевых технологий</div>
            <div class="col-md-8">УВВ-311</div>
          </div>
        </div>
        <div class="timetable">
          <div style="margin: 10px" class="row">
            <div class="col-md-8">6 пара</div>
            <div class="col-md-8">Лекция</div>
            <div class="col-md-8">Аудитория 1326</div>
          </div>
          <div style="margin: 10px" class="row">
            <div class="col-md-8">16:55 - 18:15</div>
            <div class="col-md-8">Основы сетевых технологий</div>
            <div class="col-md-8">УВВ-311</div>
          </div>
        </div>
      </div>
      </div>
    </div>
</body>
</html>
