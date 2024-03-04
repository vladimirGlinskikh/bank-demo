<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="card deposit-card">
    <div class="card-body">

        <form action="/transact/deposit" method="POST" class="deposit-form">
            <div class="form-group mb-2">
                <label for="">Введите сумму пополнения</label>
                <input type="text" name="deposit_amount" class="form-control" placeholder="Введите сумму депозита">
            </div>

            <div class="form-group">
                <label for="">Выберите учетную запись</label>
                <select name="account_id" class="form-control" id="">
                    <option value="">-- Выберите учетную запись --</option>
                    <c:if test="${userAccounts != null}">
                        <c:forEach items="${userAccounts}" var="selectAccount">
                            <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>

            <div class="form-group my-2">
                <button id="" class="btn btn-md transact-btn">Пополнить</button>
            </div>
        </form>
    </div>
</div>