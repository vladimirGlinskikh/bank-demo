<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title text-white" id="offcanvasExampleLabel">Сделки</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>

    <div class="offcanvas-body">
        <small class="card-text text-white">
            Выберите опцию ниже, чтобы выполнить сделку
        </small>

        <select name="transact-type" class="form-control my-3" id="transact-type">
            <option value="">-- Выберите тип сделки --</option>
            <option value="payment">Оплата</option>
            <option value="transfer">Перевод</option>
            <option value="deposit">Пополнение</option>
            <option value="withdraw">Вывод</option>
        </select>

        <c:import url="components/transact_forms/payment_form.jsp"/>
        <c:import url="components/transact_forms/transfer_form.jsp"/>
        <c:import url="components/transact_forms/deposit_form.jsp"/>
        <c:import url="components/transact_forms/withdraw_form.jsp"/>
    </div>
</div>