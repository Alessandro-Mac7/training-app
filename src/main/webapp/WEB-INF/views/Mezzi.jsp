<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Mezzi</title>
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
                    <h4>Parco auto</h4>
                </div>
                <div class="col-sm-6 text-right">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insMezzoModal" style="width: 30%;margin: 1px;">
                        <i class="fas fa-plus"></i>&ensp;Nuovo</button>
                </div>
            </div>

            <div class="row pt-4">
                <div class="col-sm-12 text-center">
                <c:if test="${not empty editmezzo}">
                    <form class="form-signin editMezzoForm" action="mezzi" method="post">
                        <input type="text" class="form-control" name="id" value="${editmezzo.id}" disabled>
                        <input type="text" class="form-control" name="targa" value="${editmezzo.targa}" placeholder="Targa">
                        <input type="text" class="form-control" name="casaCostruttrice" value="${editmezzo.casa_costruttrice}" placeholder="Casa costruttrice">
                        <input type="text" class="form-control" name="modello" value="${editmezzo.modello}"placeholder="modello">
                        <input type="date" class="form-control" name="annoImmatricolazione" value="${editmezzo.anno_immatricolazione}" placeholder="Anno immatricolazione">
                        <select class="form-control" name="categoria">
                            <c:forEach items="${categorie}" var="categoria">
                                <option value="${categoria.id}">${categoria.nome}</option>
                            </c:forEach>
                        </select>
                        <button class="btn btn-lg btn-warning btn-block mt-2" type="submit">Modifica mezzo</button>
                        <a href="mezzi" class="btn btn-lg btn-info btn-block mt-2" type="submit">Indietro</a>
                    </form>
                </div>

                </c:if>

                <c:if test="${ empty editmezzo}">

                    <c:if test="${not empty mezzi}">
                        <input type="text" class="form-control" id="filterMezziTable">
                        <table class="table table-hover" id="mezziTable">
                            <thead>
                            <tr>
                                <th></th>
                                <th scope="col">Targa</th>
                                <th scope="col">Casa costruttrice</th>
                                <th scope="col">Modello</th>
                                <th scope="col">Anno immatricolazione</th>
                                <th scope="col">Categoria</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${mezzi}" var="mezzo">
                                <tr>
                                    <td>${mezzo.targa}</td>
                                    <td>${mezzo.casa_costruttrice}</td>
                                    <td>${mezzo.modello}</td>
                                    <td>${mezzo.anno_immatricolazione}</td>
                                    <td>${mezzo.categoria.nome}</td>
                                    <td><a href="mezzi?action=edit&Id=${mezzo.id}" data-toggle="tooltip" data-placement="top" title="Modifica mezzo"  style="cursor:pointer; "><i class="fas fa-edit"></i></a>&nbsp;
                                        <a class="deleteMezzo" href="javascript:void(0);"  data-id=${mezzo.id} data-toggle="tooltip" data-placement="top" title="Elimina mezzo" style="cursor:pointer; "><i class="fas fa-trash-alt"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${ empty mezzi}">
                        <div class="col-sm-12 text-center">
                            <h4 style="color: gray">Nessun mezzo registrato!</h4>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target=".insMezzoModal" style="width: 30%;margin: 1px;">
                                Inserisci mezzo
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
                <p>Vuoi eliminare il mezzo?</p>
            </div>
            <div class="modal-footer">
                <button id="deleteButtonMezzo" type="button " class="btn btn-primary" data-id="">Elimina</button>
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