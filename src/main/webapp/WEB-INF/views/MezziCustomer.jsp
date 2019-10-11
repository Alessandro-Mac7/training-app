<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Parco auto</title>
</head>
<body>

<jsp:include page="parts/_nav-user.jsp"></jsp:include>
<!-- Page Content -->
<div class="container">

    <div class="row pt-4">
        <div class="col-sm-6">
            <h4>Parco auto</h4>
        </div>
    </div>

    <div class="row pt-4">
        <c:if test="${not empty mezzi}">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Targa</th>
                    <th scope="col">Casa costruttrice</th>
                    <th scope="col">Modello</th>
                    <th scope="col">Anno immatricolazione</th>
                    <th scope="col">Categoria</th>
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
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${ empty mezzi}">
            <div class="col-sm-12 text-center">
                <h4>Nessun mezzo registrato!</h4>
            </div>
        </c:if>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->
<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/customer.js"></script>

</body>
</html>
