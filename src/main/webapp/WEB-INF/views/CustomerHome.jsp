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

    <!-- Jumbotron Header -->
    <header class="jumbotron text-center my-4">
        <h2>Ciao ${loginedUser.nome}&ensp;${loginedUser.cognome}!</h2>
        <a href="logout" ><i class="fas fa-sign-out-alt"></i> Esci</a>
    </header>

    <c:if test="${not empty error}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Errore!</strong> ${error}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>

    <div class="row pt-4">
        <div class="col-sm-6">
            <h4>Le mie prenotazioni</h4>
        </div>
        <div class="col-sm-6 text-right">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insPrenotazioneModal" style="width: 30%;margin: 1px;">
                <i class="fas fa-plus"></i>&ensp;Nuova</button>
        </div>
    </div>

    <div class="row pt-4">
        <div class="col-sm-12 text-center">
            <c:if test="${not empty editprenotazione}">
            <form class="form-signin editPrenotazioneForm" action="prenotazioni" method="post">
                <input type="text" class="form-control" name="id" value="${editprenotazione.id}" disabled>
                <input type="date" class="form-control" name="data_inizio" value="${editprenotazione.data_inizio}" placeholder="Data inizio">
                <input type="date" class="form-control" name="data_fine" value="${editprenotazione.data_fine}" placeholder="Data fine">
                <input type="date" class="form-control" name="approvata" value="${editprenotazione.approvata}" placeholder="Approvata">
                <select class="form-control" name="utenti">
                    <c:forEach items="${utenti}" var="utente">
                        <option value="${utente.id}">${utente.nome}&ensp;${utente.cognome}</option>
                    </c:forEach>
                </select>
                <select class="form-control" name="mezzi">
                    <c:forEach items="${mezzi}" var="mezzo">
                        <option value="${mezzo.id}">${mezzo.modello}&ensp;${mezzo.targa}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-lg btn-warning btn-block mt-2" type="submit">Modifica prenotazione</button>
                <a href="customer-home" class="btn btn-lg btn-info btn-block mt-2" type="submit">Indietro</a>
            </form>
        </div>

        </c:if>

            <c:if test="${ empty editprenotazione}">

            <c:if test="${not empty prenotazioni}">
                <input type="text" class="form-control" id="filterPrenotazioniTable">

                <table class="table table-hover" id="prenotazioniTable">
                    <thead>
                    <tr>
                        <th scope="col">Data inizio</th>
                        <th scope="col">Data fine</th>
                        <th scope="col">Approvata</th>
                        <th scope="col">Mezzo</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${prenotazioni}" var="prenotazione">
                        <tr>
                            <td>${prenotazione.data_inizio}</td>
                            <td>${prenotazione.data_fine}</td>
                            <c:if test="${prenotazione.approvata == 0}">
                                <td style="color: darkred;"><i class="fas fa-exclamation-circle"></i></td>
                            </c:if>
                            <c:if test="${prenotazione.approvata == 1}">
                                <td style="color: green;"><i class="fas fa-check-circle"></i></td>
                            </c:if>
                            <td>${prenotazione.mezzo.modello}&ensp;${prenotazione.mezzo.targa}</td>
                            <td><a href="prenotazioni?action=editCustomer&Id=${prenotazione.id}" data-toggle="tooltip" data-placement="top" title="Modifica prenotazione"  style="cursor:pointer; "><i class="fas fa-edit"></i></a>&nbsp;
                                <a class="deletePrenotazione" href="javascript:void(0);"  data-id=${prenotazione.id} data-toggle="tooltip" data-placement="top" title="Elimina prenotazione" style="cursor:pointer; "><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${ empty prenotazioni}">
                <div class="col-sm-12 text-center">
                    <h4 style="color: gray">Nessun Prenotazione presente!</h4>
                </div>
            </c:if>

        </c:if>
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
                    <input type="date" class="form-control" name="data_inizio"  required autofocus>
                    <input type="date" class="form-control" name="data_fine"  required>
                    <input type="text" class="form-control" name="utente" value="${loginedUser.id}" disabled>
                    <select class="form-control" name="mezzo">
                        <c:forEach items="${mezzi}" var="mezzo">
                            <option value="${mezzo.id}">${mezzo.modello}&ensp;${mezzo.targa}</option>
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
<div class="modal fade confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirm-modal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Conferma</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modalResponseBody">
                <p>Vuoi eliminare la prenotazione?</p>
            </div>
            <div class="modal-footer">
                <button id="deleteButtonPrenotazione" type="button " class="btn btn-primary" data-id="">Elimina</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
            </div>
        </div>
    </div>
</div>


<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/customer.js"></script>

</body>
</html>
