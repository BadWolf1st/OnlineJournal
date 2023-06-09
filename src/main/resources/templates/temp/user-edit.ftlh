<#import "blocks/template.ftlh" as t>
<@t.template>
<h1 style="text-align: center">Редактирование пользователя ${user.name}</h1><hr>
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
</@t.template>