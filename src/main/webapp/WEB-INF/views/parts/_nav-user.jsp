<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" />

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Car Rental</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/customer-home') ? 'active' : ''}" href="customer-home">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/mezzi') ? 'active' : ''}" href="mezzi">Parco auto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/eventi') ? 'active' : ''}" href="eventi">Multe</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/profilo') ? 'active' : ''}" href="profilo">Profilo utente</a>
                </li>
            </ul>
        </div>
    </div>
</nav>