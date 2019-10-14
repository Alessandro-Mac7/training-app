<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Prenotazioni</title>
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
                    <h4>Prenotazioni</h4>
                </div>
            </div>

            <div class="row pt-4">
                <div class="col-sm-12 text-center">
                    <c:if test="${not empty editprenotazione}">
                    <form class="form-signin editPrenotazioneForm" action="prenotazioni" method="post">
                        <input type="text" class="form-control" name="id" value="${editprenotazione.id}" disabled>
                        <input type="date" class="form-control" name="data_inizio" value="${editprenotazione.data_inizio}" placeholder="Data inizio">
                        <input type="date" class="form-control" name="data_fine" value="${editprenotazione.data_fine}" placeholder="Data fine">
                        <select class="form-control" name="approvata">
                                <option value="0" style="color: darkred;">Non approvare <i class="fas fa-exclamation-circle"></i></option>
                                <option value="1" style="color: green;" >Approva <i class="fas fa-check-circle"></i></option>
                        </select>
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
                        <a href="prenotazioni" class="btn btn-lg btn-info btn-block mt-2" type="submit">Indietro</a>
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
                                <th scope="col">Customer</th>
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
                                    <td>${prenotazione.utente.nome}&ensp;${prenotazione.utente.cognome}</td>
                                    <td>${prenotazione.mezzo.modello}&ensp;${prenotazione.mezzo.targa}</td>
                                    <td><a href="prenotazioni?action=edit&Id=${prenotazione.id}" data-toggle="tooltip" data-placement="top" title="Modifica prenotazione"  style="cursor:pointer; "><i class="fas fa-edit"></i></a>&nbsp;
                                        <a class="deletePrenotazione" href="javascript:void(0);"  data-id=${prenotazione.id} data-toggle="tooltip" data-placement="top" title="Elimina prenotazione" style="cursor:pointer; "><i class="fas fa-trash-alt"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${ empty prenotazioni}">
                        <div class="col-sm-12 text-center">
                            <h4 style="color: gray" >Nessun Prenotazione presente!</h4>
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
<script type="application/javascript" src="js/admin.js"></script>


</body>
</html>