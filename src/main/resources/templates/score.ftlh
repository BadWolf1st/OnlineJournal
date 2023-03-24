<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои товары</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый товар
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/score/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="author">Имя преподавателя</label>
                <input type="text" required class="form-control"
                       id="author" name="author">
            </div>
            <div class="form-group">
                <label for="studentId">ID cтудента</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="studentId" name="studentId">
                </div>
            </div>
            <div class="form-group">
                <label for="type">Тип работы</label>
                <select id="type" required name="type" class="form-control">
                    <option value="">Тип не выбран</option>

                    <option value="Практическая работа">Практическая работа</option>
                    <option value="Лабораторная работа">Лабораторная работа</option>
                    <option value="Зачёт">Зачёт</option>
                    <option value="Дифференцированный зачёт">Дифференцированный зачёт</option>
                    <option value="Экзамен">Экзамен</option>

                </select>
            </div>
            <div class="form-group">
                <label for="title">Название предмета</label>
                <div class="input-group mb-3">
                    <input type="text" required class="form-control" id="title" name="title">
                </div>
            </div>
            <div class="form-group">
                <label for="groupName">Название группы</label>
                <div class="input-group mb-3">
                    <input type="text" required class="form-control" id="groupName" name="groupName">
                </div>
            </div>
            <div class="form-group">
                <label for="count">Оценка</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="count" name="count">
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
</@t.template>