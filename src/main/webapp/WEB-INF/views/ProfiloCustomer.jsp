<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Home</title>
</head>
<body>

<jsp:include page="parts/_nav-user.jsp"></jsp:include>
<!-- Page Content -->
<div class="container">

    <!-- Page Features -->
    <div class="row mt-5" >
        <div class="col-sm-12 text-center">
            <form class="form-signin editCustomerForm" action="sign-up" method="post">
                <input type="text" class="form-control" name="id" value="${loginedUser.id}" disabled>
                <input type="text" class="form-control" name="name" value="${loginedUser.nome}" placeholder="Nome" >
                <input type="text" class="form-control" name="surname" value="${loginedUser.cognome}" placeholder="Cognome" >
                <input type="date" class="form-control" name="born-date" value="${loginedUser.data}" placeholder="Data nascita" >
                <input type="email" class="form-control" name="email" value="${loginedUser.username}" placeholder="Email" >
                <input type="password" class="form-control" name="pwd" placeholder="Password" >
                <input class="form-check-input" type="checkbox" name="superuser" style="visibility:hidden;">
                <button class="btn btn-lg btn-success btn-block" type="submit">Modifica profilo</button>
            </form>
        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->
<div class="modal fade insPrenotazioneModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inserisci Customer</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-signin insPrenotazioneForm" action="" method="post">
                    <input type="text" class="form-control" name="dataInizio" placeholder="Nome" required autofocus>
                    <input type="text" class="form-control" name="dataFine" placeholder="Cognome" required>
                    <input type="date" class="form-control" name="utente" value="${loginedUser.username}" disabled>
                    <select class="form-control" name="mezzo">
                        <c:forEach items="${mezzi}" var="mezzo">
                            <option value="${mezzo.id}">${mezzo.modello}&ensp;${mezzo.modello}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-lg btn-success btn-block" type="submit">Prenota</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade successModal" tabindex="-1" role="dialog" aria-labelledby="success-modal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modalColorHeader" style="background-color: forestgreen; color: white">
                <h5 class="modal-title modalResponseTitle" >Successo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modalResponseBody">
                <h4>Prenotazione inserito correttamente!</h4>
            </div>
        </div>
    </div>
</div>


<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/customer.js"></script>

</body>
</html>
