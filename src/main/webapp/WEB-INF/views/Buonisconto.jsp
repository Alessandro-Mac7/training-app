<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Customers</title>
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
                    <h4>Buoni sconto</h4>
                </div>
                <div class="col-sm-6 text-right">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insBuonoModal" style="width: 30%;margin: 1px;">
                        <i class="fas fa-plus"></i>&ensp;Nuovo</button>
                </div>
            </div>

            <div class="row pt-4">
                <div class="col-sm-12 text-center">
                    <c:if test="${not empty editbuono}">
                    <form class="form-signin editBuonoForm" action="buonisconto" method="post">
                        <input type="text" class="form-control" name="id" value="${editbuono.id}" disabled>
                        <input type="text" class="form-control" name="importo" value="${editbuono.importo}" placeholder="Importo">
                        <select class="form-control" name="prenotazione">
                            <c:forEach items="${prenotazioniNoBuoni}" var="prenotazione">
                                <option value="${prenotazione.id}">${prenotazione.data_inizio}&ensp;${prenotazione.data_fine}</option>
                            </c:forEach>
                        </select>
                        <button class="btn btn-lg btn-warning btn-block mt-2" type="submit">Modifica buono</button>
                        <a href="buonisconto" class="btn btn-lg btn-info btn-block mt-2" type="submit">Indietro</a>
                    </form>
                </div>

                </c:if>

                <c:if test="${ empty editbuono}">

                    <c:if test="${not empty buoni}">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Importo</th>
                                <th scope="col">Assegnato a</th>
                                <th scope="col">Prenotazione</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${buoni}" var="buono">
                                <tr>
                                    <td>${buono.importo}</td>
                                    <td>${buono.prenotazione.utente.nome}&ensp;${buono.prenotazione.utente.cognome}</td>
                                    <td>${buono.prenotazione.id}</td>
                                    <td><a href="buonisconto?action=edit&Id=${buono.id}" data-toggle="tooltip" data-placement="top" title="Modifica buono"  style="cursor:pointer; "><i class="fas fa-edit"></i></a>&nbsp;
                                        <a class="deleteBuono" href="javascript:void(0);"  data-id=${buono.id} data-toggle="tooltip" data-placement="top" title="Elimina buono" style="cursor:pointer; "><i class="fas fa-trash-alt"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${ empty buoni}">
                        <div class="col-sm-12 text-center">
                            <h4>Nessun buono presente!</h4>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insMezzoModal" style="width: 30%;margin: 1px;">
                                Inserisci buono
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

<div class="modal fade insBuonoModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inserisci buono</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-signin insBuonoscontoForm" action="buonisconto" method="post">
                    <input type="text" class="form-control" name="importo" placeholder="Importo" required autofocus>
                    <select class="form-control" name="categoria">
                        <c:forEach items="${prenotazioni}" var="prenotazione">
                            <option value="${prenotazione.id}">${prenotazione.data_inizio}&ensp;${prenotazione.data_fine}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-lg btn-success btn-block mt-2" type="submit">Inserisci mezzo</button>
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
                <h4>Buono inserito correttamente!</h4>
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
                <p>Vuoi eliminare il buono?</p>
            </div>
            <div class="modal-footer">
                <button id="deleteButtonBuono" type="button " class="btn btn-primary" data-id="">Elimina</button>
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
