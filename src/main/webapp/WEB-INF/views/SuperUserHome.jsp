<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Home admin</title>
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
        <div class="container-fluid">
            <div class="row pt-4" style="display:flex;justify-content:space-around;">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insMezzoModal" style="width: 30%;margin: 1px;">
                        Inserisci mezzo
                    </button>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insCustomerModal" style="width: 30%;margin: 1px;">
                        Inserisci customer
                    </button>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target=".appPrenotazioneModal"style="width: 30%;margin: 1px;">
                        Approva prenotazione
                    </button>
            </div>

            <div class="row pt-4">

                <c:if test="${not empty editCustomer}">
                    <form class="form-signin editCustomerForm" action="sign-up" method="post">
                        <input type="text" class="form-control" name="id" value="${editCustomer.id}" disabled>
                        <input type="text" class="form-control" name="name" value="${editCustomer.nome}" placeholder="Nome" >
                        <input type="text" class="form-control" name="surname" value="${editCustomer.cognome}" placeholder="Cognome" >
                        <input type="date" class="form-control" name="born-date" value="${editCustomer.data}" placeholder="Data nascita" >
                        <input type="email" class="form-control" name="email" value="${editCustomer.username}" placeholder="Email" >
                        <input type="password" class="form-control" name="pwd" placeholder="Password" >
                        <input class="form-check-input" type="checkbox" name="superuser" style="visibility:hidden;">
                        <button class="btn btn-lg btn-success btn-block" type="submit">Modifica Customer</button>
                        <a href="admin-home" class="btn btn-lg btn-info btn-block mt-2" type="button">Indietro</a>
                    </form>
                </c:if>

                <c:if test="${empty editCustomer}">
                    <c:if test="${not empty customers}">
                        <input type="text" class="form-control" id="filterCustomerTable">
                        <table class="table table-hover" id="customerTable">
                            <thead>
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Cognome</th>
                                <th scope="col">Data di Nascita</th>
                                <th scope="col">Username</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customers}" var="customer">
                                <tr>
                                    <td>${customer.nome}</td>
                                    <td>${customer.cognome}</td>
                                    <td>${customer.data}</td>
                                    <td>${customer.username}</td>
                                    <td>
                                        <a href="admin-home?action=eventi&Id=${customer.id}"  class="showCollapseEventi" data-toggle="tooltip" data-placement="top" title="Visualizza eventi" style="cursor:pointer; "><i class="fas fa-exclamation-triangle"></i></a>&nbsp;
                                        <a href="admin-home?action=prenotazioni&Id=${customer.id}" class="showCollapsePrenotazioni" data-toggle="tooltip" data-placement="top" title="Visualizza prenotazioni" style="cursor:pointer; "><i class="fas fa-car-side"></i></a>&nbsp;
                                        <a href="customers?action=edit&Id=${customer.id}" data-toggle="tooltip" data-placement="top" title="Modifica utente" style="cursor:pointer; "><i class="fas fa-edit"></i></a>&nbsp;
                                        <a class="deleteCustomer" href="javascript:void(0)" data-id=${customer.id} data-toggle="tooltip" data-placement="top" title="Elimina utente" style="cursor:pointer; "><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${ empty customers}">
                        <div class="col-sm-12 text-center">
                            <h4>Nessun customer registrato!</h4>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insCustomerModal" style="width: 30%;margin: 1px;">
                                Inserisci customer
                            </button>
                        </div>
                    </c:if>
                </c:if>


            </div>

            <div class="row">
                <div id="collapsePrenotazione" class="collapse">
                    <c:if test="${not empty prenotazioniUtente}">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Inizio</th>
                                <th scope="col">Fine</th>
                                <th scope="col">Approvata</th>
                                <th scope="col">Customer</th>
                                <th scope="col">Mezzo</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${prenotazioniUtente}" var="prenotazione">
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
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div id="collapseEvento" class="collapse">
                    <c:if test="${not empty eventiUtente}">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Tipo</th>
                                <th scope="col">Prenotazione</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${eventiUtente}" var="evento">
                                <tr>
                                    <td>${evento.tipo}</td>
                                    <td>${evento.prenotazione.data_inizio}&ensp;${evento.prenotazione.data_fine}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>

        </div>
        <!-- /Page Content-->

    </div>
    <!-- /Page Content Wrapper-->

</div>
<!-- /Wrapper -->

<!-- The Modal -->
<div class="modal fade insMezzoModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inserisci mezzo</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-signin insMezzoForm" action="mezzi" method="post">
                    <input type="text" class="form-control" name="targa" placeholder="Targa" required autofocus>
                    <input type="text" class="form-control" name="casaCostruttrice" placeholder="Casa costruttrice" required>
                    <input type="text" class="form-control" name="modello" placeholder="modello" required>
                    <input type="date" class="form-control" name="annoImmatricolazione" placeholder="Anno immatricolazione" required>
                    <select class="form-control" name="categoria">
                        <c:forEach items="${categorie}" var="categoria">
                            <option value="${categoria.id}">${categoria.nome}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-lg btn-success btn-block mt-2" type="submit">Inserisci mezzo</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade insCustomerModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inserisci Customer</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form-signin insCustomerForm" action="" method="post">
                    <input type="text" class="form-control" name="name" placeholder="Nome" required autofocus>
                    <input type="text" class="form-control" name="surname" placeholder="Cognome" required>
                    <input type="date" class="form-control" name="born-date" placeholder="Data nascita" required>
                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                    <input type="password" class="form-control" name="pwd" placeholder="Password" required>
                    <input class="form-check-input" type="checkbox" name="superuser" style="visibility:hidden;">
                    <button class="btn btn-lg btn-success btn-block" type="submit">Inserisci Customer</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade appPrenotazioneModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Approva prenotazione</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <c:if test="${not empty prenotazioni}">
                    <div class="container" >
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Data inizio</th>
                            <th>Data fine</th>
                            <th>Utente</th>
                            <th>Mezzo</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${prenotazioni}" var="prenotazione">
                            <tr>
                                <td>${prenotazione.data_inizio}</td>
                                <td>${prenotazione.data_fine}</td>
                                <td>${prenotazione.utente.nome}&nbsp;${prenotazione.utente.cognome}</td>
                                <td>${prenotazione.mezzo.modello}&ensp;${prenotazione.mezzo.targa}</td>
                                <td><a href="" class="approvaButton" data-id="${prenotazione.id}" ><i class="fas fa-thumbs-up"></i> Approva</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </c:if>
                <c:if test="${ empty prenotazioni}">
                    <h6>Nessuna prenotazione da approvare!</h6>
                </c:if>
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
                <h4>Utente registrato con successo!</h4>
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
                <p>Vuoi eliminare l'utente?</p>
            </div>
            <div class="modal-footer">
                <button id="deleteButton" type="button " class="btn btn-primary" data-id="">Elimina</button>
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
