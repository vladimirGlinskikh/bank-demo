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
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../css/fontawesome/css/all.css">
    <link rel="stylesheet" href="../css/main.css">
    <script src="../js/bootstrap.bundle.js"></script>
    <title>Главная</title>
</head>
<body>

<c:import url="components/incl/header.jsp"/>

<div class="container my-4">
    <div class="card transaction-history shadow">
        <div class="card-header">
            <i class="fas fa-credit-card me-2" aria-hidden="true"></i> История переводов
        </div>

        <div class="card-body">
            <c:if test="${requestScope.transact_history != null}">
                <table class="table text-center table-striped">
                    <tr>
                        <th>Код перевода</th>
                        <th>Тип перевода</th>
                        <th>Сумма</th>
                        <th>Назначение</th>
                        <th>Статус</th>
                        <th>Причина отказа</th>
                        <th>Дата создания</th>
                    </tr>
                    <c:forEach items="${requestScope.transact_history}" var="transactionHistory">
                        <tr>
                            <td>${transactionHistory.transaction_id}</td>
                            <td>${transactionHistory.transaction_type}</td>
                            <td>${transactionHistory.amount}</td>
                            <td>${transactionHistory.source}</td>
                            <td>${transactionHistory.status}</td>
                            <td>${transactionHistory.reason_code}</td>
                            <td>${transactionHistory.created_at}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
</div>

<c:import url="components/incl/footer.jsp"/>

