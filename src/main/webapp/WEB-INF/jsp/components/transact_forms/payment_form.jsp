<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="card payment-card">
    <div class="card-body">
        <form action="/transact/payment" method="POST">
            <div class="form-group mb-2">
                <label for="">Владелец счета</label>
                <input type="text" name="beneficiary" class="form-control"
                       placeholder="Введите имя владельца счета / получателя">
            </div>

            <div class="form-group mb-2">
                <label for=""> Номер счета получателя</label>
                <input type="text" name="account_number" class="form-control"
                       placeholder="Введите номер счета получателя">
            </div>

            <div class="form-group">
                <label for="">Выберите аккаунт</label>
                <select name="account_id" class="form-control" id="">
                    <option value="">-- Выберите аккаунт --</option>
                    <c:if test="${userAccounts != null}">
                        <c:forEach items="${userAccounts}" var="selectAccount">
                            <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>

            <div class="form-group mb-2">
                <label for=""> Платеж</label>
                <input type="text" name="reference" class="form-control" placeholder="Назначение платежа">
            </div>

            <div class="form-group mb-2">
                <label for=""> Введите сумму платежа</label>
                <input type="text" name="payment_amount" class="form-control" placeholder="Введите сумму платежа">
            </div>

            <div class="form-group mb-2">
                <button id="" class="btn btn-md transact-btn">Оплатить</button>
            </div>
        </form>
    </div>
</div>