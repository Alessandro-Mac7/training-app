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
        <div class="container-fluid">
            <h1 class="mt-4">Home User</h1>




        </div>
        <!-- /Page Content-->

    </div>
    <!-- /Page Content Wrapper-->

</div>
<!-- /Wrapper -->

<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>

<!-- Toggle -->
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>
</html>
