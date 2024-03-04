<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="card withdraw-card">
    <div class="card-body">
        <form action="/transact/withdraw" method="POST" class="deposit-form">
            <div class="form-group mb-2">
                <label for=""> Введите сумму</label>
                <input type="text" name="withdrawal_amount" class="form-control" placeholder="Введите сумму вывода">
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

            <div class="form-group my-2">
                <button id="" class="btn btn-md transact-btn">Вывести</button>
            </div>
        </form>
    </div>
</div>