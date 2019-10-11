<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Eventi</title>
</head>
<body>
<!-- Wrapper -->
<div class="d-flex" id="wrapper">

    <!-- Sidebar jsp include -->
    <jsp:include page="parts/_sidebar.jsp"></jsp:include>

    <!-- Page Content Wrapper-->
    <div id="page-content-wrapper">
        <!-- Navbar jsp include -->
        <jsp:include page="parts/_nav-super.jsp"></jsp:include>

        <!-- Page Content-->
        <div class="container">
            <div class="row pt-4">
                <div class="col-sm-6">
                    <h4>Eventi</h4>
                </div>
                <div class="col-sm-6 text-right">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insEventoModal" style="width: 30%;margin: 1px;">
                        <i class="fas fa-plus"></i>&ensp;Nuovo</button>
                </div>
            </div>

            <div class="row pt-4">
                <div class="col-sm-12 text-center">
                    <c:if test="${not empty editevento}">
                    <form class="form-signin editEventoForm" action="eventi" method="post">
                        <input type="text" class="form-control" name="id" value="${editevento.id}" disabled>
                        <input type="text" class="form-control" name="tipo" value="${editevento.tipo}" placeholder="Targa">
                        <select class="form-control" name="prenotazione">
                            <c:forEach items="${prenotazioni}" var="prenotazione">
                                <option value="${prenotazione.id}">${prenotazione.utente.nome}&ensp;${prenotazione.utente.cognome}</option>
                            </c:forEach>
                        </select>
                        <button class="btn btn-lg btn-warning btn-block mt-2" type="submit">Modifica evento</button>
                        <a href="eventi" class="btn btn-lg btn-info btn-block mt-2" type="submit">Indietro</a>
                    </form>
                </div>

                </c:if>

                <c:if test="${ empty editevento}">

                    <c:if test="${not empty eventi}">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Tipo</th>
                                <th scope="col">Prenotazione</th>
                                <th scope="col">Utente</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${eventi}" var="evento">
                                <tr>
                                    <td>${evento.tipo}</td>
                                    <td>${evento.prenotazione.data_inizio}&ensp;${evento.prenotazione.data_fine}</td>
                                    <td>${evento.prenotazione.utente.nome}&ensp;${evento.prenotazione.utente.cognome}</td>
                                    <td><a href="eventi?action=edit&Id=${evento.id}" data-toggle="tooltip" data-placement="top" title="Modifica evento"  style="cursor:pointer; "><i class="fas fa-edit"></i></a>&nbsp;
                                        <a class="deleteEvento" href="javascript:void(0);"  data-id=${evento.id} data-toggle="tooltip" data-placement="top" title="Elimina evento" style="cursor:pointer; "><i class="fas fa-trash-alt"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${ empty eventi}">
                        <div class="col-sm-12 text-center">
                            <h4 style="color: gray" >Nessun evento presente!</h4>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insEventoForm" style="width: 30%;margin: 1px;">
                                Inserisci Evento
                            </button>
                        </div>
                    </c:if>

                </c:if>
            </div>

        </div>
        <!-- /Page Content-->
    </div>
    <!-- /Page Content Wrapper-->
</div>
<!-- /Wrapper -->

<div class="modal fade insEventoModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inserisci buono</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-signin insEventoForm" action="eventi" method="post">
                    <input type="text" class="form-control" name="tipo" placeholder="Tipo" required autofocus>
                    <select class="form-control" name="prenotazione">
                        <c:forEach items="${prenotazioni}" var="prenotazione">
                            <option value="${prenotazione.id}">${prenotazione.utente.nome}&ensp;${prenotazione.utente.cognome}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-lg btn-success btn-block mt-2" type="submit">Inserisci evento</button>
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
                <h4>Evento inserito correttamente!</h4>
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
                <p>Vuoi eliminare l'evento?</p>
            </div>
            <div class="modal-footer">
                <button id="deleteButtonEvento" type="button " class="btn btn-primary" data-id="">Elimina</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/admin.js"></script>

</body>
</html>
