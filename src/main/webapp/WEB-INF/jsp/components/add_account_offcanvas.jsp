<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h5 id="offcanvasRightLabel" class="text-white">Создать / Добавить учетную запись </h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div class="card">
            <div class="card-body">
                <form action="/account/create_account" method="POST" class="add-account-form">
                    <div class="form-group mb-3">
                        <label for=""> Введите имя учетной записи</label>
                        <input type="text" name="account_name" class="form-control"
                               placeholder="Введите имя учетной записи...">
                    </div>

                    <div class="form-group mb-3">
                        <label for=""> Выберите тип учетной записи</label>
                        <select name="account_type" class="form-control" id="">
                            <option value="">-- Выберите тип учетной записи --</option>
                            <option value="check">Проверочный</option>
                            <option value="savings">Сберегательный</option>
                            <option value="business">Бизнес</option>
                        </select>
                    </div>

                    <div class="form-group my-2">
                        <button id="" class="btn btn-md transact-btn">Добавить аккаунт</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>