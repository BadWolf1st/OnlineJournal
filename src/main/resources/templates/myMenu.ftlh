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

    /* Dark text mode =v
    class="text-black text-dark-emphasis"
    */
  </style>
</head>
<body>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  <script>
  /*!
* Color mode toggler for Bootstrap's docs (https://getbootstrap.com/)
* Copyright 2011-2022 The Bootstrap Authors
* Licensed under the Creative Commons Attribution 3.0 Unported License.
*/

  (() => {
    'use strict'

    const storedTheme = localStorage.getItem('theme')

    const getPreferredTheme = () => {
      if (storedTheme) {
        return storedTheme
      }

      return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
    }

    const setTheme = function (theme) {
      if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
        document.documentElement.setAttribute('data-bs-theme', 'dark')
      } else {
        document.documentElement.setAttribute('data-bs-theme', theme)
      }
    }

    setTheme(getPreferredTheme())

    const showActiveTheme = theme => {
      const activeThemeIcon = document.querySelector('.theme-icon-active use')
      const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)
      const svgOfActiveBtn = btnToActive.querySelector('svg use').getAttribute('href')

      document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
        element.classList.remove('active')
      })

      btnToActive.classList.add('active')
      activeThemeIcon.setAttribute('href', svgOfActiveBtn)
    }

    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
      if (storedTheme !== 'light' || storedTheme !== 'dark') {
        setTheme(getPreferredTheme())
      }
    })

    window.addEventListener('DOMContentLoaded', () => {
      showActiveTheme(getPreferredTheme())

      document.querySelectorAll('[data-bs-theme-value]')
              .forEach(toggle => {
                toggle.addEventListener('click', () => {
                  const theme = toggle.getAttribute('data-bs-theme-value')
                  localStorage.setItem('theme', theme)
                  setTheme(theme)
                  showActiveTheme(theme)
                })
              })
    })
  })()
</script>

  <div class="container-fluid">
    <div class="row flex-nowrap">
      <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0">
        <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
          <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-5 d-none d-sm-inline"><img src="../static/logo/LabelLabel.svg" class="img-fluid invert" alt="Мои оценки"></span>
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
                <i class="fs-4 bi-pencil-square"></i> <span class="ms-1 d-none d-sm-inline">Домашние задания</span> </a>
              </div>
            </li>
            <li>
              <div  class="buttonVisual">
              <a href="#" class="nav-link px-0 align-middle buttonText">
                <i class="fs-4 bi-clock"></i> <span class="ms-1 d-none d-sm-inline">Расписание</span></a>
              </div>
            </li>
            <li>
              <div  class="buttonVisual">
              <a href="#" data-bs-toggle="collapse" class="nav-link px-0 align-middle buttonText">
                <i class="fs-4 bi-star"></i> <span class="ms-1 d-none d-sm-inline">Итоговые оценки</span></a>
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
      <div class="col py-3">
        Content area...
      </div>
    </div>
  </div>
</body>
</html>