<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container d-flex">

    <button id="add-account-btn" class="btn btn-lg shadow" type="button" data-bs-toggle="offcanvas"
            data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
        <i class="fa fa-credit-card"></i> Добавить новый аккаунт
    </button>

    <button id="transact-btn" class="btn btn-lg ms-auto shadow" type="button" data-bs-toggle="offcanvas"
            data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
        <i class="fa fa-wallet"></i> Сделки
    </button>

</div>
<div class="container d-flex py-3">
    <h2 class="me-auto">Общий остаток на счетах:</h2>
    <h2 class="ms-auto">
        <c:if test="${requestScope.totalBalance != null}">
            <c:out value="${totalBalance}"/>
        </c:if>
    </h2>
</div>

<div class="container">
    <c:if test="${requestScope.userAccounts != null }">
        <c:forEach items="${requestScope.userAccounts}" var="account">

            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#flush-${account.account_id}" aria-expanded="false"
                                aria-controls="flush-collapseOne">
                                ${account.account_name}
                        </button>
                    </h2>
                    <div id="flush-${account.account_id}" class="accordion-collapse collapse"
                         aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex">Имя учетной записи <span
                                        class="ms-auto"><b>${account.account_name}</b></span></li>
                                <li class="list-group-item d-flex">Номер счета <span
                                        class="ms-auto"><b>${account.account_number}</b></span></li>
                                <li class="list-group-item d-flex">Тип учетной записи <span
                                        class="ms-auto"><b>${account.account_type}</b></span></li>
                                <li class="list-group-item d-flex">Баланс счета <span
                                        class="ms-auto"><b>${account.balance}</b></span></li>
                                <li class="list-group-item d-flex">Дата создания <span
                                        class="ms-auto"><b>${account.created_at}</b></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>