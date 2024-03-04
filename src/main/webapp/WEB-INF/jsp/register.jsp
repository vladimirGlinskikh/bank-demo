<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/default.css">
    <title>Регистрация</title>
</head>
<body class="d-flex align-items-center justify-content-center">

<div class="card registration-form-card col-6 bg-transparent border-0">
    <div class="card-body">
        <h1 class="form-header card-title mb-3">
            <i class="fa fa-edit"></i> Регистрация
        </h1>

        <c:if test="${requestScope.passwordMisMatch != null}">
            <div class="alert alert-danger text-center border border-danger">
                <b>${requestScope.passwordMisMatch}</b>
            </div>
        </c:if>

        <c:if test="${requestScope.success != null}">
            <div class="alert alert-success text-center border border-success">
                <b>${requestScope.success}</b>
            </div>
        </c:if>

        <form:form action="/register" class="reg-form" modelAttribute="registerUser">
            <div class="row">
                <div class="form-group col">
                    <form:input type="text" path="first_name" class="form-control form-control-lg"
                                placeholder="Введите имя"/>
                    <form:errors path="first_name" class="text-white bg-danger"/>
                </div>

                <div class="form-group col">
                    <form:input type="text" path="last_name" class="form-control form-control-lg"
                                placeholder="Введите фамилию"/>
                    <form:errors path="last_name" class="text-white bg-danger"/>
                </div>
            </div>

            <div class="form-group col">
                <form:input type="email" path="email" class="form-control form-control-lg" placeholder="Введите Email"/>
                <form:errors path="email" class="text-white bg-danger"/>
            </div>

            <div class="row">
                <div class="form-group col">
                    <form:input type="password" path="password" class="form-control form-control-lg"
                                placeholder="Введите пароль"/>
                    <form:errors path="password" class="text-white bg-danger"/>
                </div>

                <div class="form-group col">
                    <input type="password" name="confirm_password" class="form-control form-control-lg"
                           placeholder="Подтвердите пароль"/>
                    <small class="text-white bg-danger">${confirm_pass}</small>
                </div>
            </div>

            <div class="form-group col">
                <button class="btn btn-lg">Зарегистрировать</button>
            </div>
        </form:form>

        <p class="card-text text-white my-2">
            У Вас уже есть учетная запись? <span class="ms-2"><a href="/login" class="btn bt-sm text-warning">Войти</a></span>
        </p>

        <small class="text-warning">
            <i class="fa fa-arrow-alt-circle-left"></i> <a href="/" class="btn btn-sm text-warning">Назад</a>
        </small>
    </div>
</div>
</body>
</html>