<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="card transfer-card">
    <div class="card-body">
        <form action="/transact/transfer" method="POST">
            <div class="form-group">
                <label for="">Выберите аккаунт</label>
                <select name="transfer_from" class="form-control" id="">
                    <option value="">-- Выберите аккаунт --</option>
                    <c:if test="${userAccounts != null}">
                        <c:forEach items="${userAccounts}" var="selectAccount">
                            <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>

            <div class="form-group">
                <label for="">Выберите аккаунт</label>
                <select name="transfer_to" class="form-control" id="">
                    <option value="">-- Выберите аккаунт --</option>
                    <c:if test="${userAccounts != null}">
                        <c:forEach items="${userAccounts}" var="selectAccount">
                            <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>

            <div class="form-group mb-2">
                <label for=""> Введите сумму перевода</label>
                <input type="text" name="transfer_amount" class="form-control" placeholder="Введите сумму перевода">
            </div>

            <div class="form-group my-2">
                <button id="" class="btn btn-md transact-btn">Перевести</button>
            </div>
        </form>
    </div>
</div>