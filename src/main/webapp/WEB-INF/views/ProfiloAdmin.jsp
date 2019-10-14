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
                <h4>Utente registrato con successo!</h4>
            </div>
        </div>
    </div>
</div>


<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/admin.js"></script>

</body>
</html>
