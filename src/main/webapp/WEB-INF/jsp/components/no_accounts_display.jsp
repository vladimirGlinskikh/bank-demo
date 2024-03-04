<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
    <div class="card no-accounts-card">
        <div class="card-body">
            <h1 class="card-title">
                <i class="fas fa-ban text-danger"></i> Нет зарегистрированных аккаунтов
            </h1>
            <hr>
            <div class="card-text">
                В настоящее время у вас нет зарегистрированных учетных записей. <br>
                Пожалуйста, нажмите ниже, чтобы зарегистрировать / добавить новую учетную запись.
            </div>
            <br>
            <button id="" class="btn btn-primary btn-lg shadow" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                <i class="fa fa-credit-card"></i> Добавить новый аккаунт
            </button>
        </div>
    </div>
</div>